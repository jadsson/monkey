    const talkToUser = document.querySelector('.msg-erro');

    const imgs = document.querySelectorAll('img');
    const inputImgName = document.querySelector('.value-with-js'); 
    const imgName = document.querySelector('#visible-img-name');
    let attr = "";

    const username = document.querySelector('#username');
    const email = document.querySelector('#email');
    const pass = document.querySelector('#pass');
    const conf = document.querySelector('#conf');
    const divImg = document.querySelector('.card-imgs');

    const submit = document.querySelector('#submit');

    const shadow = '0 0 5px 2px rgb(200,0,0)';


    /**
     * inserir nome da imagem clicada no input 
     */
     imgs.forEach((e,i) => {
        imgs[i].addEventListener('click', ()=>{
            attr = imgs[i].getAttribute('src').replace('img/user/', '');
            inputImgName.setAttribute('value', attr);

            imgName.textContent = attr;
            imgName.style.color = 'white';
            divImg.style.boxShadow = 'none';
        })
    });

    /**
     * invoca função de validação de formulário
     */
    submit.addEventListener('click', (e)=>{
        e.preventDefault();

        validationForm();
        
    })

    /**
     * valida formulário e invoca requisição
     */
    function validationForm() {
    
        if(!inputImgName.value) {
            divImg.style.boxShadow = shadow;
            imgName.textContent = 'SELECIONE UMA IMAGEM';
        } else {
            divImg.style.boxShadow = 'none';
        }
        
        !username.value ? fieldEmpty(username) : false;
        !email.value ? fieldEmpty(email) : false;
        !pass.value ? fieldEmpty(pass) : false;
        !conf.value ? fieldEmpty(conf) : false;

        if(
            !spaceInName(username.value, username) && 
            inputImgName.value && 
            username.value && 
            email.value && 
            pass.value && 
            pass.value === conf.value
        ){
            httpRequest();

        }else{
            talkToUser.textContent = "Erro | Algum campo ficou vermelho? Preencha tudo ou veja se a senha tá certa";
        }

    }

    /**
     * verifica espaços no input
     */
    username.addEventListener('change', ()=>{
        spaceInName(username.value, username);
    })
    function spaceInName(string, field) {

        const splitString = string.trim().split('');

        let space = false;

        splitString.forEach((e,i) => {
            if(e === ' ') {
                space = true;
            }
        });

        if(space) {
            field.style.boxShadow = shadow;
            
                talkToUser.textContent = 'Nome Inválido | Retire os espaços do nome de usuário'

            return true;
        } else {
            field.style.boxShadow = 'none';
            talkToUser.textContent = '';
            return false;
        }
    }

    /**
     * requisição ajax pro método create do php
     */
    function httpRequest() {
        const ajax = new XMLHttpRequest;

        ajax.open("POST", "http://localhost/ajax/chat/requests/user/create.php", true);

        ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        ajax.onreadystatechange = () => {

            talkToUser.textContent = "[ Enviando... ]";

            if(ajax.readyState == 4 && ajax.status < 400) {

                /**
                 * retorna o username ou email caso já existam
                 */
                const resJson = (JSON.parse(ajax.responseText));

                if(resJson.trim() === username.value.trim()) {

                    setTimeout(() => {
                        talkToUser.textContent = `Ops... | Usuário "${username.value}" já existe`;
                        username.style.boxShadow = shadow;
                    }, 1200);
    
                }
                else if(resJson.trim() === email.value.trim()) {

                    setTimeout(() => {
                        talkToUser.textContent = `Ops... | Email "${email.value}" já existe`;
                        email.style.boxShadow = shadow;
                    }, 1200);

                } else {

                    setTimeout(() => {
                        talkToUser.textContent = "[ Cadastro realizado com sucesso! ]";
                        username.value = '';
                        email.value = '';
                        pass.value = '';
                        conf.value = '';
                    }, 2000);
                }


            } else if (ajax.readyState == 4 && ajax.status >= 400) {
                talkToUser.textContent = "[ Enviando... ]";
                setTimeout(() => {
                    talkToUser.textContent = `Erro | Ocorreu um erro '${ajax.status}'... Esse problema é na conexão com o servidor. Tente novamente`;
                    
                }, 1200);

            }

        }
        ajax.send("username="+username.value.trim()+"&email="+email.value.trim()+"&pass="+pass.value+"&img="+inputImgName.value);

    }

    /**
     * verifica se os inputs estão vazios, se sim, o campo recebe o estilo
     */
    function fieldEmpty(input) {
        if(input) {
            input.style.boxShadow = shadow;

            input.addEventListener('focus', ()=>{
                input.style.boxShadow = '0 5px 6px 2px rgb(12,12,12)';
            })
        }
    }
