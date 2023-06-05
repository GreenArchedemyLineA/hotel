<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	${principal.getId()}
	<button onclick="closePopUp()">닫기</button>
</div>
<div id="socket">
    <div>
        <p>소켓라인</p>
        <input type="text" id="message">
        <button onclick="ssss()">ㅇㅇ</button>
    </div>
    <div id="msg-socket">

    </div>
</div>
<script type="text/javascript" src="/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
<script type="text/javascript">
let ws = null;
function open(){
    ws = new SockJS("/chat");
    ws.onopen = function () {
        // onmessage : message를 받았을 때의 callback
        ws.onmessage = function (e) {
            const socketDivTag = document.getElementById("msg-socket");
            const data = JSON.parse(e.data)
            console.log(data.msg);
            const createDivTag = document.createElement("div")
            if(data.type === "ENTER"){
                createDivTag.append(data.msg + "\n")
            }else{
                createDivTag.append("매니저님의 답변: " + data.msg + "\n")
            }
            socketDivTag.append(createDivTag);
        }
    }
}
    // 연결 종료
    function disconnect(){
        ws.close();
        const socketDivTag = document.getElementById("msg-socket");
        socketDivTag.textContent = "";
    }
    // 메시지 전달 입맛에 맞게 함수 변경하시길...
    function ssss(){
        let message = document.getElementById("message")
        const messageJSON = {
            "type": "CHAT",
            "msg": message.value,
        }
        ws.send(JSON.stringify(messageJSON));
        message.value = null;
        message.focus();
    }
    function closePopUp() {
    	disconnect();
    	window.close();
    }

	function connectSocket(){
        open();
	}

connectSocket();
</script>
</body>
</html>