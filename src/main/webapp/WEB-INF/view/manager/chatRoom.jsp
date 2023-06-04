<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<div>
		    <p>매니저 챗</p>
		    <input type="text" id="message">
		    <button onclick="ssss()">메시지 날리기</button>
		    <div id="msg-socket">

            </div>
		</div>
	</div>
</main>
<script type="text/javascript" src="/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
<script>
const ws = new SockJS("http://localhost:8080/chat");

ws.onopen = function () {
    const messageJSON = {
        "type": "ENTER",
        "msg": "매니저님께서 입장하셨습니다",
        "roomName": "${roomName}",
    }
    ws.send(JSON.stringify(messageJSON));
    // onmessage : message를 받았을 때의 callback
}

ws.onmessage = (e) => {
    const socketDivTag = document.getElementById("msg-socket");
    const data = JSON.parse(e.data)
    const createDivTag = document.createElement("div")
    createDivTag.append("${roomName}: " + data.msg + "\n")
    socketDivTag.append(createDivTag);
}

function ssss(){
    let message = document.getElementById("message")
    const messageJSON = {
        "type": "MANAGER_CHAT",
        "roomName": "${roomName}",
        "msg": message.value,
    }
    ws.send(JSON.stringify(messageJSON));
    message.value = null;
}
</script>
<%@ include file="../layout/footer.jsp"%>
