<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	<link rel="icon" href="/LinkedClubs/Images/fav.png" type="image/icon type">
<style>
.place-holder-color::placeholder {
	color: #FF7556;
	opacity: 1;
}

.place-holder-color::-ms-input-placeholder {
	color: #FF7556;
}

.main-bg-color {
	background-color: #FF7556;
}

.main-color {
	color: #FF7556;
}

.main-border-color {
	border-color: #FF7556;
}
</style>
<title>Public Chat</title>
<link rel="icon" href="/LinkedClubs/Images/LCbg.png" type="image/icon type">
<link rel="stylesheet" type="text/css"
	href="/LinkedClubs/CSS/NavBar.css" media="screen" />
</head>

<body>

	<nav id="navBar">
	<main>
		<c:if test="${ sessionScope.student != null }">
			<a href="home">LinkedClubs</a>
		</c:if>

		<c:if test="${ sessionScope.student == null }">
			<a href="./">LinkedClubs</a>
		</c:if>

		<button>
			<a href="pubchat"><i class="fas fa-comments"></i> Chat Room</a>
		</button>
		
		<c:if test="${ sessionScope.student != null }">
			<div>
				<button id="notificationBtn">
					<i class="fas fa-sticky-note"></i>
				</button>
				<span id="nbrReminder">${ nbrReminders }</span>
				<button id="notifyBtn">
					<i class="fas fa-bell"></i>
				</button>
				<span id="nbrNotificattion">${ nbrNotifications }</span> <img style="width: 60px; height: 60px;"
					src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.student.profileImage}"/>"
					alt="profile picture"> <a href="profile"><span
					id="fullName"><c:out
							value="${sessionScope.student.fullName}" /></span></a>

				<form action="Logout" method="post">

					<button id="logout_btn" type="submit"
						style="color: white; display: block; margin-left: 20px;">
						<i class="fas fa-sign-out-alt"></i>
					</button>

				</form>

			</div>
		</c:if>

		<c:if test="${ sessionScope.student == null }">
			<div>
				<img
					src="/LinkedClubs/Images/clubProfileImages/<c:out value="${club.image}"/>"
					alt="profile picture"> <span id="fullName"><c:out
						value="${club.clubName}" /></span>


			</div>
		</c:if>

	</main>
</nav>

<br>

	<div class="flex justify-center">
		<main class="w-full lg:w-3/4 h-full lg:m-6 lg:mt-16 mt-16" style="box-shadow: 10px 10px 10px 10px gray;">
			<header class="flex justify-between main-bg-color pb-10 px-2 pt-2">
				<div class="flex mt-4">
					<img src="/LinkedClubs/Images/LCbg.jpeg" class="rounded-full w-9 h-9 mx-2" />
					<p class="text-white">
						Public Chat, Talk With Friends <br> <span
							class="text-sm text-gray-200">Share Your Ideas</span>
					</p>
				</div>
			</header>
			<hr>
			<section class="overflow-y-scroll h-96" id="chat-section">

				<c:forEach items="${messages}" var="message" varStatus="status">

					<div class="flex my-4">
						<img
							src="/LinkedClubs/Images/profileImages/<c:out value="${ message.image }"/>"
							class="rounded-full w-7 h-7 mx-2" />
						<p class="shadow-xl p-2 text-white rounded-xl main-bg-color mr-2">
							${ message.message }</p>
					</div>

				</c:forEach>

			</section>
			<hr>
			<section class="">
				<form onsubmit="return false;" class=" flex">
					<input type="text" placeholder="what's on your mind?"
						class="w-10/12 h-full p-3 place-holder-color outline-none" id="message" />
					<button type="submit" style="outline: none;" class=" mt-3 w-2/12 h-full main-color"
						id="send-message-btn">
						<i class="fas fa-paper-plane text-2xl"></i>
					</button>
				</form>
			</section>
			<hr>
		</main>
	</div>

	<script>
		scroll_bottom();

		// Function to scroll to the bottom when sending or receiving new message
		function scroll_bottom() {

			var toscrolldown = document.getElementById('chat-section');
			toscrolldown.scrollTop = toscrolldown.scrollHeight;

		}

		// Handle websocket stuff
		const chatSocket = new WebSocket('ws://' + '127.0.0.1:8000'
				+ '/ws/chat/' + 'public' + '/');

		chatSocket.onmessage = function(e) {
			const data = JSON.parse(e.data);

			if (!data.message == "") {

				const msg = '<div class="flex my-4"><img src="/LinkedClubs/Images/profileImages/' + data.image + '" class="rounded-full w-7 h-7 mx-2" /><p class="shadow-xl p-2 text-white rounded-xl main-bg-color mr-2">'
						+ data.message + '</p></div>';

				document.querySelector('#chat-section').innerHTML += msg;

				scroll_bottom();
			}
		};

		chatSocket.onclose = function(e) {
			console.error('Chat socket closed unexpectedly');
		};

		document.querySelector('#send-message-btn').onclick = function(e) {
			const messageInputDom = document.querySelector('#message');
			const message = messageInputDom.value;
			chatSocket.send(JSON.stringify({
				'message' : message,
				'image' : '${sessionScope.student.profileImage}'
			}));
			messageInputDom.value = '';
		};
	</script>

</body>

</html>