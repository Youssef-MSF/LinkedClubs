//Getting html elements
const likesBtns = document.getElementsByName("likesBtn");

//Functions
const like = (event) => {
    const likeBtn=event. target;
	const isLiked=likeBtn.getAttribute("data-isLiked");
	const postId=likeBtn.getAttribute("data-id");
	if(isLiked=="false"){
		const xhr = new XMLHttpRequest();
        xhr.open("POST","http://localhost:8080/LinkedClubs/HandleLikes",true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.onload=()=>{
			if(xhr.readyState==4){
				const messageTag = xhr.responseXML.getElementsByTagName("message")[0];
      			const message = messageTag.childNodes[0].nodeValue;	
				console.log(message);
				if(message=="success"){
					likeBtn.style.color="#FF7556";
					likeBtn.setAttribute("data-isLiked","true");
				}else return;
			}
		};
		xhr.send("id="+postId+"&isClicked="+true);
	}else return;
};

//Event listeners
likesBtns.forEach(Element => {
    Element.addEventListener("click", (event) => like(event));
});