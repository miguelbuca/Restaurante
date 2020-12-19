let func__sm = null;

const closeSMS = ()=> {
    sms09.remove();
    if(func__sm != null)func__sm();
} 

const callSMS = (sms = "Olá Mundo",funcClosed = ()=>{})=>{
    
    func__sm = funcClosed;

    let section = document.createElement('section');
    section.setAttribute('id','sms09');
    section.setAttribute('class','sms');
    section.innerHTML = `
        <div class="header-nav-child r dmd">
            <span onClick="closeSMS();"> x </span>
            <span>Mensagem</span>
        </div>
        <div class="sms-cont">
            Olá Estamos com covid 19
        </div>`;


    document.body.appendChild(section);
    sms09.querySelector("#sms09 div:last-child").innerHTML = sms;
}