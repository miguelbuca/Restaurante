<?php

    include_once 'auxiliary.php';
    include_once 'emailService.php';

    class Application extends Aux{

        public function login($_DATA){

            if(!(isset($_DATA['username']) && isset($_DATA['password']))){
                echo json_encode(['info'=>'Esperava receber nome de usuário e senha!','data'=>null,'status'=>false]);
                return;
            }

            $db        =  new Database();
            $cn        =  $db->getter_getConnection();
            $userName  =  mysqli_real_escape_string($cn, $_DATA['username']);
            $password  =  mysqli_real_escape_string($cn, $_DATA['password']);
            
            mysqli_close($cn);
            
            $res     =  $db->query("select *from usuario where username = '$userName' ");
            $linhas  =  $res['data']->num_rows;

            if($linhas == 0){
                $this->showErro('Usuário não existe');
                exit;
            }

            $rest = new Rest();
            $dataArray  = $rest->dataArray($res)[0];
            $passwordIn = ($dataArray)['senha'];

            if($passwordIn !== $password){
                $this->showErro('Senha Errada!');
                exit;
            }
            
            $_REQUEST['where' ]  = "pessoa.id=".$dataArray['id_pessoa'];
            $_REQUEST['class' ]  = "pessoa";
            $_REQUEST['isJoin']  = "true";
            $_REQUEST['return']  = "true";

            $obj        =  new Generic();
            $data       =  $obj->all(0)['data'];

            if(empty($data)){
                $this->showErro('Dados da pessoa não foram encontrados!');
                return;
            }

            $data       = $data[0];

            $dataArray  =  [ 
                "usuario" => $dataArray,
                "pessoa"=> $data 
            ];

            $this->echoResult(true,"Login feito com sucesso!",$dataArray,[],[]);
        }

        
        public function sendEmail($_DATA){
            
            $empty = [];
            $missed = [];
            $invalid = [];
            $status = true;

            foreach(["from","fromName","to","toName","subject","body"] as $key){
                if(array_key_exists($key,$_DATA)){
                 
                    if(empty($_DATA[$key])){
                    array_push($empty, $key);
                    $status = false;
                  }elseif ($key === "from" || $key === "to"){
                     
                    if (!filter_var($_DATA[$key], FILTER_VALIDATE_EMAIL)) {
                        array_push($invalid, ["campo"=>$key,"value"=>$_DATA[$key]]);
                        $status = false;
                    }
                 }
                }else{
                    $info = "missed field '$key' ,";
                    array_push($missed, $key);
                    $status = false;
                }
            }

            $res = ["status"=>$status,"empty"=> $empty, "missed"=>$missed,  "invalid"=>$invalid ];
            if(!$status){
                echo json_encode($res);
                return;
            }

            $email = new Email();
            $res = $email->send($_DATA);
            echo json_encode($res);
        }

        public function logout(){
            if(isset($_COOKIE['user'])){
                var_dump((array)json_decode($_COOKIE['user']));
            }else{
                var_dump("deslogado");
                //gerar tolkin
            }
        }
    }
?>

