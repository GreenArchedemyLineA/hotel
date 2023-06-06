<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #64c5f3;
}

#msg-socket {
	height: 520px;
	/*overflow-x: hidden;*/
	display: flex;
	flex-direction: column;
	margin-bottom: 10px;
}

.recieve--msg {
	padding-left: 60px;
}

.send--msg--div {
	width: 100px;
	background-color: yellow;
	border-radius: 5px;
	padding: 5px;
	margin-right: 25px;
}

#message {
	width: 300px;
	height: 23px;
}

#send--btn {
	width: 50px;
	height: 28px;
	background: none;
	border: 1px solid #000;
}

.xi-send {
	font-size: 18px;
}

</style>
</head>
<body>
	<div>
		${principal.getId()}
		<button onclick="closePopUp()">닫기</button>
	</div>
	<div id="socket">
		<div id="msg-socket"></div>
		<div>
			<input type="text" id="message" onkeypress="enter(window.event)">
			<button id="send--btn" onclick="sendMsg()">
				<i class="xi-send"></i>
			</button>
		</div>
	</div>
	<script type="text/javascript" src="/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script type="text/javascript">
		let ws = null;
		function open() {
			ws = new SockJS("/chat");
			ws.onopen = function() {
				// onmessage : message를 받았을 때의 callback
				ws.onmessage = function(e) {
					const socketDivTag = document.getElementById("msg-socket");
					const data = JSON.parse(e.data);
					const createDivTag = document.createElement("div");
					createDivTag.className = "sender--div";
					const createDivTag2 = document.createElement("div");
					createDivTag2.className = "recieve--msg";
					const createDivTag3 = document.createElement("div");
					createDivTag3.style.width = "100px";
					console.log(data.type);
					if (data.type === "ENTER") {
						const eh = socketDivTag.clientHeight
								+ socketDivTag.scrollTop;

						const isScroll = socketDivTag.scrollHeight <= eh;

						createDivTag.append(data.msg + "\n")
						if (!isScroll) {
							socketDivTag.scrollTop = socketDivTag.scrollHeight;
						}
					} else {
						const eh = socketDivTag.clientHeight
								+ socketDivTag.scrollTop;

						const isScroll = socketDivTag.scrollHeight <= eh;

						createDivTag.append("매니저:");
						createDivTag3.append(data.msg + "\n");
						createDivTag2.append(createDivTag3);
						if (!isScroll) {
							socketDivTag.scrollTop = socketDivTag.scrollHeight;
						}
					}
					socketDivTag.append(createDivTag);
					socketDivTag.append(createDivTag2);
				}
			}
		}
		// 연결 종료
		function disconnect() {
			ws.close();
			const socketDivTag = document.getElementById("msg-socket");
			socketDivTag.textContent = "";
		}

		function sendMsg() {

			const socketDivTag = document.getElementById("msg-socket");
			const eh = socketDivTag.clientHeight + socketDivTag.scrollTop;

			const isScroll = socketDivTag.scrollHeight <= eh;
			let message = document.getElementById("message");
			const createDivTag = document.createElement("div");
			createDivTag.style.display = "flex";
			createDivTag.style.justifyContent = "flex-end";
			const createDivTag2 = document.createElement("div");
			const createDivTag3 = document.createElement("div");
			createDivTag2.style.display = "flex";
			createDivTag2.className = "send--msg";
			createDivTag3.className = "send--msg--div";
			createDivTag2.style.justifyContent = "flex-end";
			createDivTag.textContent = ":나";
			createDivTag.style.paddingLeft = "15px";
			createDivTag3.textContent = message.value;
			createDivTag2.append(createDivTag3);
			socketDivTag.append(createDivTag);
			socketDivTag.append(createDivTag2);
			if (!isScroll) {
				socketDivTag.scrollTop = socketDivTag.scrollHeight;
			}
			const messageJSON = {
				"type" : "CHAT",
				"msg" : message.value,
			}
			ws.send(JSON.stringify(messageJSON));
			message.value = null;
			message.focus();
		}
		function closePopUp() {
			disconnect();
			window.close();
		}

		function connectSocket() {
			open();
		}

		function enter(e) {
			if (e.keyCode == 13) {
				sendMsg();
			}
		}

		connectSocket();
	</script>
</body>
</html>