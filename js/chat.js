const users = document.querySelector('.users');
const msgs = document.querySelector('.section-msg');

const myNameElement = document.querySelector('.myName');
const myFriendElement = document.querySelector('.friend');

const searchButton = document.querySelector('.btn-search');
const inputSearch = document.querySelector('.input-search');
const divUsersSearch = document.querySelector('.search-users-div');
const reloadChat = document.querySelector('.reload-chat');
let idChatForReload = '';

const sendMessageButton = document.querySelector('.btn-send');
const sendMessageInput = document.querySelector('.input-send');

const inputIdChat = document.querySelector('.input-chat-id');

function requestUsers () {
    const ajax = new XMLHttpRequest;
    ajax.open('GET', 'http://localhost/ajax/chat/requests/user/read.php');
    ajax.onreadystatechange = ()=>{

        if(ajax.readyState == 4 && ajax.status < 400) {
            
            const json = JSON.parse(ajax.responseText);
            renderFriendList(json);

        }
    }
    ajax.send();
}
window.addEventListener('load', requestUsers);

function renderFriendList(d) {
    let content = ``;
    d.forEach(e => {
        content += 
        `
        <div class='user' 

            onclick='friendList.createAndOpenChat(${e.id_user})'

        >
            <img src='img/user/${e.perfil_img}' alt='perfil photo'>
            <div>
                <h3>${e.username}</h3>
                <p>Entrou em ${new Date(e.created).toLocaleString('pt-BR',
                                                                        {
                                                                            month: '2-digit',
                                                                            day: "numeric",
                                                                            year: "numeric",
                                                                            hour: '2-digit',
                                                                            minute: '2-digit'
                                                                        })}
                </p>
            </div>

        </div>
        `;
    });
    users ? users.insertAdjacentHTML("beforeend", content) : false;
}

if(searchButton) {
    searchButton.addEventListener('click', (e)=>{
        e.preventDefault();
    })
}
if(inputSearch) {


    inputSearch.addEventListener('keyup', ()=>{

        if(inputSearch.value.trim() != '') {
            const ajax = new XMLHttpRequest;
            ajax.open('POST', 'http://localhost/ajax/chat/requests/user/search.php');
            ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            ajax.onreadystatechange = () => {
                if(ajax.readyState == 4 && ajax.status < 400) {
                    const json = JSON.parse(ajax.responseText);
    
                    renderSearchList(json);
                }
            };
            ajax.send(`search=${inputSearch.value}`);
            console.log(inputSearch.value);
        }
    
    });
    window.addEventListener('click', (e)=>{
        e.target != divUsersSearch ? divUsersSearch.style.display = 'none' : false;
    })
}


function renderSearchList(j) {
    let content = ``;
    divUsersSearch.innerHTML = "";
    
    j.forEach(e => {
        content += 
        `
        <div class='user search-list' 

            onclick='friendList.createAndOpenChat(${e.id_user})'

        >
            <img src='img/user/${e.perfil_img}' alt='perfil photo'>
            <div>
                <h3>${e.username}</h3>
            </div>

        </div>
        `;
    });

    divUsersSearch.insertAdjacentHTML("beforeend", content);
    divUsersSearch.style.display = 'block';
    
}

if(sendMessageButton) {
    sendMessageButton.addEventListener('click', (e)=>{
        e.preventDefault();
    
        const contentMessage = sendMessageInput.value.trim();
        const id = inputIdChat.value;
    
        SendMessage(id, contentMessage);
    
        sendMessageInput.value = "";
    
    });
}

function SendMessage(chat, msg) {
    if(sendMessageInput.value.trim() != '') {
  
        const ajax = new XMLHttpRequest;
        ajax.open('POST', 'http://localhost/ajax/chat/requests/message/create.php');
        ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
        ajax.onreadystatechange = ()=>{

            if(ajax.readyState == 4 && ajax.status < 400) {

                RequestMessages(chat);
                
            }
            
        };
        ajax.send(`msg=${msg}&chat=${chat}`);
    } else {
        sendMessageInput.value = "";
    }
}

if(reloadChat) {
    reloadChat.addEventListener('click', ()=>{
        ReloadChat(idChatForReload);
    })
}
function ReloadChat(id) {
    
    RequestMessages(id);
    
}

/**
 * criando e retornando o chat com o usuário clicado
 */
window.friendList = {};

window.friendList.createAndOpenChat = (id_friend)=>{

    const ajax = new XMLHttpRequest;
    ajax.open('POST', 'http://localhost/ajax/chat/requests/chat/create.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    ajax.onreadystatechange = ()=>{

        if(ajax.readyState == 4 && ajax.status < 400) {
            /**
             * id da conversa
             */
            const idChat = ajax.responseText.replace(/"/g, "");
            /**
             * requisitando comentários do chat com o id do parâmetro
             */
            RequestMessages(idChat);

            RequestDataFriend(id_friend);
            
            /**
             * id para usar no reload do chat
             */
            idChatForReload = idChat;
            
            /**
             * passando o id do chat para o input no formulário de mensagem
             */
            inputIdChat.value = idChat;

        }
    }
    ajax.send(`friend=${id_friend}`);
}

function RequestDataFriend(id) {
    const ajax = new XMLHttpRequest;
    ajax.open('POST', 'http://localhost/ajax/chat/requests/user/oneUser.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.onreadystatechange = ()=>{
        if(ajax.readyState == 4 && ajax.status < 400) {

            const json = JSON.parse(ajax.responseText);
            renderFriendComponent(json);
        }
    }
    ajax.send(`id=${id}`);
}

function renderFriendComponent(json) {
    myFriendElement.innerHTML = "";
    
    let content = `
        <div class="friend-content">
            <img src="img/user/${json.perfil_img}" alt="perfil image">
            <h3>${json.username}</h3>
        </div>    
    `;

    myFriendElement.insertAdjacentHTML("beforeend", content);
}

function RequestMessages(idChat) {

    const newAjax = new XMLHttpRequest;
    newAjax.open('POST', 'http://localhost/ajax/chat/requests/chat/read.php');
    newAjax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    newAjax.onreadystatechange = ()=>{

        if(newAjax.readyState == 4 && newAjax.status < 400) {

            const json = JSON.parse(newAjax.responseText);
            /**
             * renderizar comentários
             */
            renderChat(json);
            scrollToFinal();

        }
    };
    newAjax.send(`requestMessages=${idChat}`)
}

function scrollToFinal() {
    msgs.scrollBy({
        top: 6000000,
        left: 0
    })

}

function renderChat(msg) {

    msgs.innerHTML = "";

    let content = `
                    <p
                        style="
                            color: rgba(255,255,255,.2);
                            text-align: center;
                            margin: 0 0 30px 0;
                        "
                    >
                        Início
                    </p>
    `;

    if(msg != '') {

        msg.forEach(e => {

            if(e.username == myNameElement.textContent) {
                content += `
                            <div class="msg">
    
                                <p>${e.msg_content}</p>
                                <p>${new Date(e.date_msg).toLocaleString('pt-BR',
                                {
                                    month: 'numeric',
                                    day: "2-digit",
                                    year: "2-digit",
                                    hour: '2-digit',
                                    minute: '2-digit'
                                })}</p>
    
                            </div>
                `;
    
            } else {
                content += `
                            <div id="msg-r">
    
                                <div class="msg right">
    
                                    <p>${e.msg_content}</p>
                                    <p>${new Date(e.date_msg).toLocaleString('pt-BR',
                                    {
                                        month: 'numeric',
                                        day: "2-digit",
                                        year: "2-digit",
                                        hour: '2-digit',
                                        minute: '2-digit'
                                    })}</p>
    
                                </div>
    
                            </div>
                `;
            }
            
        });

    }

    msg ? msgs.insertAdjacentHTML("beforeend", content) : false;

}
