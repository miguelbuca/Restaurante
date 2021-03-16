
document.addEventListener('DOMContentLoaded',()=>{
new conf();
});
class conf {

    constructor(input){
        this.inicializar(input);
      
    }

    static table = {
        isOrder:"",
        field:"",
        search:"",
        where:"",
        last_id:"",
        limit:""
    }

    inicializar(input) {

        let vetInput = document.querySelectorAll('input[type=file]');
        if(input) vetInput = [input];
        for (let input of vetInput) {

            let id = input.getAttribute('img');
            if(id){

                input.onchange = function(e){  
                    let id = input.getAttribute('img');
                    let img = document.getElementById(id);
                    let file = e ? e.target.files[0] : this.files[0]; 
                    img.src = URL.createObjectURL(file);
                } 
            }
        }

        if(input) return input;

    }
}
