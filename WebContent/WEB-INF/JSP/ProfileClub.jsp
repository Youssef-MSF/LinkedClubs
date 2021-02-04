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
	href="/LinkedClubs/CSS/ProfileClub1.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/LinkedClubs/CSS/ProfileClub2.css" media="screen" />

<title>Profile Club</title>
</head>
<body>

	<nav id="navBar">
		<main>
			<a href="/LinkedClubs">LinkedClubs</a>
			<button>
				<input type="text" placeholder="search"> <i
					class="fab fa-searchengin"></i>
			</button>
			<div>
				<button id="notificationBtn">
					<i class="fas fa-sticky-note"></i>
				</button>
				<span>63</span>
				<button>
					<i class="fas fa-bell"></i>
				</button>
				<span>63</span> <img
					src="/LinkedClubs/Images/clubProfileImages/<c:out value="${sessionScope.club.image}"/>"
					alt="profile picture"> <span id="fullName"><c:out
						value="${sessionScope.club.clubName}" /></span>
			</div>
		</main>
	</nav>
	<!----------------Personnal info sections--------------------->
	<!----------------Personnal info sections--------------------->
	<section id="personal__info"
		style="background-image: url('/LinkedClubs/Images/clubCoverImages/<c:out value="${sessionScope.club.coverImage}"/>')">
		<main>
			<img
				src="/LinkedClubs/Images/clubProfileImages/<c:out value="${sessionScope.club.image}"/>"
				alt="profile picture">
			<div>
				<ul>
					<li><c:out value="${sessionScope.club.clubName}" /></li>
					<li><i class="fab fa-facebook"></i><span><c:out
								value="${sessionScope.club.facebook}" /></span></li>
					<li><i class="fab fa-instagram"></i><span><c:out
								value="${sessionScope.club.instagram}" /></span></li>
					<li><i class="fab fa-twitter"></i><span><c:out
								value="${sessionScope.club.clubBio}" /></span></li>
				</ul>
				<span>Members<span id="nbrClubsJoined"
					style="color: #FF7556;"><c:out
							value="${sessionScope.club.membersNumber}" /></span></span>
			</div>
		</main>
	</section>
	<!--------------Post && Reminder section----------------------->
	<nav>
		<div class="nav__container">
			<ul>
				<li><button onclick="wow();">Club</button></li>
				<li><button onclick="show();">Members</button></li>
				<li><button onclick="how();">About</button></li>
				<li><button onclick="dow();">Setting</button></li>
			</ul>
		</div>
	</nav>
	<!--------------Post && Reminder section----------------------->
	<div id="posts__reminder">
		<div id="reminder">
			<section>
				<span style="color: #FF7556; font-size: 1.5em">Reminder</span> <span
					style="text-align: right;"><i class="fas fa-sticky-note"></i></span>
			</section>
			<section>


				<div class="sideb">
					<div class="header">
						<i class="fa fa-angle-left" aria-hidden="true"></i><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="month"> </span><span class="year"></span></span><i
							class="fa fa-angle-right" aria-hidden="true"></i>
					</div>
					<div class="calender">
						<table>
							<thead>
								<tr class="weedays">
									<th data-weekday="sun" data-column="0">Sun</th>
									<th data-weekday="mon" data-column="1">Mon</th>
									<th data-weekday="tue" data-column="2">Tue</th>
									<th data-weekday="wed" data-column="3">Wed</th>
									<th data-weekday="thu" data-column="4">Thu</th>
									<th data-weekday="fri" data-column="5">Fri</th>
									<th data-weekday="sat" data-column="6">Sat</th>
								</tr>
							</thead>
							<tbody>
								<tr class="days" data-row="0">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
								<tr class="days" data-row="1">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
								<tr class="days" data-row="2">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
								<tr class="days" data-row="3">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
								<tr class="days" data-row="4">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
								<tr class="days" data-row="5">
									<td data-column="0"></td>
									<td data-column="1"></td>
									<td data-column="2"></td>
									<td data-column="3"></td>
									<td data-column="4"></td>
									<td data-column="5"></td>
									<td data-column="6"></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>



			</section>

		</div>
		<div id="posts">
			<!---------------------Normal post with picture----------->

			<div class="messageSender">


				<img
					src="/LinkedClubs/Images/clubProfileImages/<c:out value="${sessionScope.club.image}"/>"
					alt="profile image">

				<form action="ProfileClub" method="post"
					enctype="multipart/form-data">

					<input class="messageSender__input" name="description" type="text"
						placeholder="your post here :)"> <label for="real_file">Chose
						file</label>
					<!-- <button type="button" id="custom_button"><i class="fas fa-search"></i></button> -->
					<span id="custom_text">No image chosen</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="file" name="postFile" id="real_file" hidden="hidden">
					<button type="submit">Post</button>
					<span style="color: red;">${err.get("errPost")}</span>

				</form>


			</div>

			<div id="update-post-container" class="hide-post-update">

				<form action="UpdatePost" method="post"
					enctype="multipart/form-data">

					<img src="" width="100px" height="100px" id="post-image"><br>

					<input type="text" name="description" id="description"
						placeholder="Description"><br> <input type="text"
						name="post_id" id="post-id" value=""> <input type="file"
						name="fileLink" id="file_input"><br> <input
						type="submit" value="Update">

				</form>

			</div>

			<c:forEach items="${posts}" var="post" varStatus="status">

				<div class="post event">
					<header>
						<div id="messangerSender">
							<img
								src="/LinkedClubs/Images/clubProfileImages/<c:out value="${sessionScope.club.image}"/>"
								alt="profile image"> <span>
								<li><c:out value="${sessionScope.club.clubName}" /></li>
								<li>${ post.publishedDate }</li>
							</span>
						</div>

						<div>
							<li><button>
									<i class="fas fa-cog" style="font-size: 20px;"
										class="toggle-btn-update-post"
										onclick="toggle_update_post(${ status.index })">${ status.index }</i>
								</button></li>
							<li name="numberLikes">${ post.likeNumber }</li>

							<li><i class="fas fa-star"></i></li>
						</div>

						<input type="text" value="${ post.id }" class="current_post_id"
							hidden>

					</header>
					<p class="current_post_decription">${ post.postDescription }</p>
					<img class="current_post_image"
						src="/LinkedClubs/Images/postFiles/<c:out value="${post.fileLink}"/>"
						alt="picture">
					<header class="likes__comments">
						<div>
							<button name="commentsBtn">
								<i class="fas fa-comment-alt"></i> comments
							</button>
						</div>
						<div>
							<li name="numberComments">${ post.commentNumber }</li>
							<li>comments</li>
						</div>
					</header>
					<section class="comments">
						<main>
							<div>
								<img
									src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
									alt="profile picture"> <span>wowo that's
									uncridable !!</span>
							</div>
							<div>
								<img
									src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
									alt="profile picture"> <span>that's amazing keep
									going !!</span>
							</div>
							<div>
								<img
									src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
									alt="profile picture"> <span>wowo that's
									uncridable!!</span>
							</div>
							<div>
								<img
									src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
									alt="profile picture"> <span>wowo that's
									uncridable!!</span>
							</div>
						</main>
					</section>
				</div>

			</c:forEach>


			<!---------------------Normal post without picture----------->
			<div class="post event">
				<header>
					<div>
						<img
							src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
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
							<img
								src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
								alt="profile picture"> <span>wowo that's uncridable
								!!</span>
						</div>
						<div>
							<img
								src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
								alt="profile picture"> <span>that's amazing keep
								going !!</span>
						</div>
						<div>
							<img
								src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
								alt="profile picture"> <span>wowo that's
								uncridable!!</span>
						</div>
						<div>
							<img
								src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
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
						<img src="../Images/profileImage.jpg" alt="profile image"> <span>
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
				<img src="../Images/webDesign.jpg" alt="profile image">
				<header class="likes__comments">
					<div>
						<button name="likesBtn">
							<i class="fas fa-star"></i> like
						</button>
						<button name="commentsBtn">
							<i class="fas fa-comment-alt"></i> comment
						</button>
						<button name="ticketBtn">
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
							<img src="../Images/profileImage.jpg" alt="profile picture">
							<span>wowo that's uncridable !!</span>
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

	<!--------------------Listes of members-------------------------------->

	<div id="grid__container" style="display: none;">
		<c:forEach items="${members}" var="member" varStatus="status">

			<div class="card">
				<div class="top__container">
					<div class="cover__image">
						<img
							src="/LinkedClubs/Images/coverImages/<c:out value="${member.coverImage}"/>">
					</div>
					<div class="profile__image">
						<img
							src="/LinkedClubs/Images/profileImages/<c:out value="${member.profileImage}"/>">
					</div>
				</div>
				<div class="law__container">
					<div>
						<h3>${member.fullName}</h3>
						<h4>Payed : ${membersCNE.get(status.index).payed}</h4>
					</div>

					<form action="">
						<input name="accept" type="button" value="Accept" class="btn1" data-studentId="${member.CNE}" />
						<input name="decline" type="button" value="Decline" class="btn2" data-studentId="${member.CNE}" />
					</form>

				</div>
				<br> <br>
			</div>

		</c:forEach>

	</div>


	<!--------------------About Club-------------------------------->
	<div id="About__container" style="display: none;">


		<form action="">
			<div class="form_container">
				<div class="left__cantainer" id="left__cantainer">

					<img
						src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.club.image}"/>"
						alt="">

				</div>
				<div class="general_info" id="general_info">

					<h2 class="title">General information</h2>
					<div class="content">
						<h3>Club Name :</h3>
						<h2
							style="padding-right: 50px; font-family: cursive; color: rgb(55, 55, 56);">
							<i>APPSCLUB</i>
						</h2>
					</div>
					<br />
					<div class="content">
						<h3>Description :</h3>
						<p>lsjdsdsjdfksdfhksdf ksjefksdefken dkqhdksqhdfksfhksd
							sjfhusdf hfuisdqfufhihus sksqjhdksufhis khsdfusdgfujgdsuygfkfjds
							jugdusyfudhfjsdbn</p>
					</div>
					<br />
					<div class="content">
						<h3>Description :</h3>
						<h2 style="padding-top: 5px;">60</h2>
					</div>
				</div>



			</div>
		</form>

	</div>

	<div id="Club_sett" style="display: none;">
		<h1>Club Setting</h1>
		<form action="ClubSetting" method="post" enctype="multipart/form-data">
			<div class="form_container">

				<div class="sett_info" id="general_info">


					<div class="input-container">
						<span>ClubName :</span> <input required type="text" name="ClubName"
							class="input" value="<c:out value="${sessionScope.club.clubName}"/>" />

					</div>
					<div class="input-container">
						<span>Password :</span> <input required type="password" name="password"
							class="input"  />


					</div>
					<div class="input-container">
						<span>Confirm password :</span> <input required type="password"
							name="confirmPassword" class="input" />


					</div>


					<div class="input-container">
						<span>Facebook</span> <input required type="text" name="Facebook"
							class="input" value="<c:out value="${sessionScope.club.facebook}"/>" />


					</div>

					<div class="input-container">
						<span>Instagram</span> <input required type="text" name="Instagram"
							class="input" value="<c:out value="${sessionScope.club.instagram}"/>" />


					</div>

				</div>

				<div class="signup_info" id="signup_info">


					<div class="input-container">
						<span>Image</span> <input type="file" name="image" class="input" />


					</div>
					<div class="input-container">
						<span>Cover</span> <input type="file" name="cover" class="input" />


					</div>
					<div class="input-container textarea">
						<span id="sp_mess" style="padding-bottom: 6px;">ClubBio :</span>
						<textarea name="ClubBio" class="input"><c:out value="${sessionScope.club.clubBio}"/></textarea>


					</div>

					<input type="submit" value="Send" class="btn" />

				</div>

			</div>
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script src="/LinkedClubs/JS/ProfileClub1.js"></script>
	<script src="/LinkedClubs/JS/ProfileClub2.js"></script>
	<script src="/LinkedClubs/JS/AjaxCall.js"></script>


	<script>
	
		// Toggle post container
		var update_post_container = document
				.getElementById('update-post-container');
		
		// Get list of information
		var post_ids = document.getElementsByClassName('current_post_id');
		
		var post_descriptions = document.getElementsByClassName('current_post_decription');
		
		var post_images = document.getElementsByClassName('current_post_image');
		
		// Get Inputs of update form
		var input_id = document.getElementById('post-id');
		
		var input_description = document.getElementById('description');
		
		var input_image = document.getElementById('post-image');
		
		var input_file = document.getElementById('file_input');

		// Toggle function
		function toggle_update_post(index) {
			
			console.log(typeof index);
			
			update_post_container.classList.toggle("hide-post-update");
			
			input_id.value = post_ids[index].value ;
			input_description.value = post_descriptions[index].textContent;
			input_image.src = post_images[index].src ;
			
			input_file.value = post_images[index].src ;
			
		}
	</script>


</body>
</html>