<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/62e9ec17ac.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/LinkedClubs/CSS/ProfilePage.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/LinkedClubs/CSS/NavBar.css" media="screen" />
<title>Profile</title>
</head>
<body>
	<c:import url="navbar.jsp" />
	<!----------------Personnal info sections--------------------->
	<!----------------Personnal info sections--------------------->
	<section id="personal__info"
		style="background-image: url('/LinkedClubs/Images/coverImages/<c:out value="${sessionScope.student.coverImage}"/>')">
		<main>
			<img
				src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.student.profileImage}"/>"
				alt="profile picture">
			<div>
				<ul>
					<li><c:out value="${sessionScope.student.fullName}" /></li>
					<li><i class="fab fa-facebook"></i><span><c:out
								value="${sessionScope.student.facebook}" /></span></li>
					<li><i class="fab fa-instagram"></i><span><c:out
								value="${sessionScope.student.instagram}" /></span></li>
				</ul>
				<span>Clubs<span id="nbrClubsJoined" style="color: #FF7556;">68</span>
					<button>
						<a href="/LinkedClubs/StudentSetting" style="color: initial;"><i
							class="fas fa-cog"></i></a>
					</button></span>
			</div>
		</main>
	</section>
	<!--------------Post && Reminder section----------------------->
	<!--------------Post && Reminder section----------------------->
	<div id="posts__reminder">
		<div id="reminder">
			<section>
				<span style="color: #FF7556; font-size: 1.5em">Reminder</span> <span
					style="text-align: right;"><i class="fas fa-sticky-note"></i></span>
			</section>
			
			<div class="addReminder">
				<input type="text" placeholder="Title of the reminder...">
				<input type="datetime-local">
				<input type="submit" name="addReminder" value="Add reminder">
				<span class="reminderErr">Check out title and Date</span>
			</div>
			
			<c:forEach items="${reminders}" var="reminder" varStatus="status">

				<section>
					<span>${ reminder.title }</span> <span>${ reminder.reminderDate }</span>
				</section>

			</c:forEach>
		</div>
		<div id="posts">
			<!---------------------Normal post with picture----------->
			<c:forEach items="${posts}" var="post" varStatus="status">
				<div class="post event">
					<header>
						<div>
							<img
								src="/LinkedClubs/Images/clubProfileImages/<c:out value="${post.club.image}"/>"
								alt="profile image"> <span>
								<li>${ post.club.clubName }</li>
								<li>${ post.publishedDate }</li>
							</span>
						</div>
						<div>
							<li name="numberLikes">${ post.likeNumber }</li>
							<li><i class="fas fa-star"></i></li>
						</div>
					</header>
					<p>${ post.postDescription }</p>
					<img
						src="/LinkedClubs/Images/postFiles/<c:out value="${post.fileLink}"/>"
						alt="picture">
					<header class="likes__comments">
						<div>

							<button name="likesBtn"
								data-isLiked="${ likedPosts.contains(post.id) }"
								<c:if test="${ likedPosts.contains(post.id) }">style="color:#FF7556;"</c:if>
								data-id="${ post.id }">
								<i class="fas fa-star"></i> like
							</button>

							<button name="commentsBtn">
								<i class="fas fa-comment-alt"></i> comment
							</button>
						</div>
						<div>
							<li name="numberComments">${ post.commentNumber }</li>
							<li>comments</li>
						</div>
					</header>
					<section class="comments">
						<main>

							<c:forEach items="${allComments}" var="comment">

								<c:if test="${ comment.post.id == post.id }">

									<div>
										<img
											src="/LinkedClubs/Images/profileImages/<c:out value="${comment.student.profileImage}"/>"
											alt="profile picture"> <span>${ comment.content }</span>
									</div>

								</c:if>

							</c:forEach>
						</main>
						<form action="" method="post" onsubmit="return false;">
							<button name="publishBtn" data-id="${ post.id }"
								data-img="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.student.profileImage}"/>">Publish</button>
							<input type="text" name="commentInput"
								placeholder="Write a comment..."> <span
								style="color: red;">${err.get("errCommentContent")}</span>
						</form>
					</section>
				</div>
			</c:forEach>
			<!---------------------Normal post without picture----------->
			<div class="post event">
				<header>
					<div>
						<img src="/LinkedClubs/Images/profileImage.jpg"
							alt="profile image"> <span>
							<li>zakaria najib</li>
							<li>2h.</li>
						</span>
					</div>
					<div>
						<li name="numberLikes">36</li>
						<li><i class="fas fa-star"></i></li>
					</div>
				</header>
				<p>You’ve heard tons about coding and know that it has to do
					with computers and how they process the information we see.and how
					they process the information we see.</p>
				<header class="likes__comments">
					<div>
						<button name="likesBtn">
							<i class="fas fa-star"></i> like
						</button>
						<button name="commentsBtn">
							<i class="fas fa-comment-alt"></i> comment
						</button>
					</div>
					<div>
						<li name="numberComments">23</li>
						<li>comments</li>
					</div>
				</header>
				<section class="comments">
					<main>
						<div>
							<img src="/LinkedClubs/Images/profileImage.jpg"
								alt="profile picture"> <span>wowo that's uncridable
								!!</span>
						</div>
						<div>
							<img src="/LinkedClubs/Images/profileImage.jpg"
								alt="profile picture"> <span>that's amazing keep
								going !!</span>
						</div>
						<div>
							<img src="/LinkedClubs/Images/profileImage.jpg"
								alt="profile picture"> <span>wowo that's
								uncridable!!</span>
						</div>
						<div>
							<img src="/LinkedClubs/Images/profileImage.jpg"
								alt="profile picture"> <span>wowo that's
								uncridable!!</span>
						</div>
					</main>
					<form>
						<button name="publishBtn">Publish</button>
						<input type="text" name="commentInput"
							placeholder="Write a comment...">
					</form>
				</section>
			</div>
			<!--------------------Post of type Event-------------------------------->
			<div class="post event">
				<header>
					<div>
						<img src="/LinkedClubs/Images/profileImage.jpg"
							alt="profile image"> <span>
							<li>zakaria najib</li>
							<li>2h.</li>
						</span>
					</div>
					<div>
						<li name="numberLikes">36</li>
						<li><i class="fas fa-star"></i></li>
					</div>
				</header>
				<p>You’ve heard tons about coding and know that it has to do
					with computers and how they process the information we see.and how
					they process the information we see.</p>
				<img src="/LinkedClubs/Images/webDesign.jpg" alt="profile image">
				<header class="likes__comments">
					<div>
						<button name="likesBtn">
							<i class="fas fa-star"></i> like
						</button>
						<button name="commentsBtn">
							<i class="fas fa-comment-alt"></i> comment
						</button>
						<button name="ticketBtn" data-clicked="false" data-title="" data-date="">
							<i class="fas fa-scroll"></i> ticket
						</button>
					</div>
					<div>
						<li name="numberComments">23</li>
						<li>comments</li>
					</div>
				</header>
				<section class="comments">
					<main>
						<div>
							<img src="/LinkedClubs/Images/profileImage.jpg"
								alt="profile picture"> <span>wowo that's uncridable
								!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>that's amazing keep going !!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
						<div>
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable!!</span>
						</div>
					</main>
					<form>
						<button name="publishBtn">Publish</button>
						<input type="text" name="commentInput"
							placeholder="Write a comment...">
					</form>
				</section>
			</div>
		</div>
	</div>
	<!---------------Rminder small devices------------------------->
	<div id="reminder__contain__mobile">
		<div id="reminder__mobile">
			<section>
				<span style="color: #FF7556; font-size: 1.5em">Reminder</span> <span
					style="text-align: right;"><i id="closeNotificationBtn"
					class="fas fa-times"></i></span>
			</section>
			
			<div class="addReminder">
				<input type="text" placeholder="Title of the reminder...">
				<input type="date">
				<input type="submit" name="addReminder" value="Add reminder">
			</div>
			
			<c:forEach items="${reminders}" var="reminder" varStatus="status">

				<section>
					<span>${ reminder.title }</span> <span>${ reminder.reminderDate }</span>
				</section>

			</c:forEach>
			
		</div>
	</div>
	
	<!---------------Notification small devices------------------------->
	<div id="notification">
		<section>
			<span>Club social</span> <span>6/9/2021 21:20</span>
		</section>
		<section>
			<span>Club social</span> <span>6/9/2021 21:20</span>
		</section>
		<section>
			<span>Club social</span> <span>6/9/2021 21:20</span>
		</section>
		<section>
			<span>Club social</span> <span>6/9/2021 21:20</span>
		</section>
		<section>
			<span>Club social</span> <span>6/9/2021 21:20</span>
		</section>
	</div>
	
	<script src="/LinkedClubs/JS/ProfilePage.js"></script>
	<script src="/LinkedClubs/JS/AjaxCall.js"></script>
</body>
</html>