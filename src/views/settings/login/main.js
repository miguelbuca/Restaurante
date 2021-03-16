let api = new Api();
let button = document.querySelector('.btn-send')

button.addEventListener('click',()=>{
  console.log(button)
  api.login({
    table: 'application',
    method: 'login?username='+email.value+'&password='+password.value,
    data: {
        allPage: true
    }
}).then(e => {
  if(e?.status){
    sessionStorage.setItem('user',JSON.stringify({...e?.data?.pessoa,acesso: e?.data?.usuario.acesso}));
    window.location.href = "../dashboard/"
  }else alert(e?.info)
  console.log(e)
})
})