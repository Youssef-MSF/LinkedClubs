//Getting html elements
const likesBtns = document.getElementsByName("likesBtn");
const publishBtns = document.getElementsByName("publishBtn");
const addReminderBtns = document.getElementsByName("addReminder");


//Functions
const ajaxCall = (path, callBackSuccess,callBackFailure, params) => {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", path, true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send(params);
    xhr.onload = () => {
        if (xhr.readyState == 4) {
        	console.log("responseXML",xhr.responseXML);
            const messageTag = xhr.responseXML.getElementsByTagName("message")[0];
            const message = messageTag.childNodes[0].nodeValue;
            console.log(message);
            if (message == "success") {
                callBackSuccess();
            } else callBackFailure();
        }
    };
};

//Handling reminder
const addReminder=(event)=>{
	const parent=event.target.parentNode;
	const title=parent.children[0].value;
	const date=parent.children[1].value;
	const path="http://localhost:8080/LinkedClubs/HandleReminder";
	const params="title="+title+"&date="+date;
	ajaxCall(path, () => appendReminder(parent, title,date),()=>warningReminder(event), params);
};

const appendReminder=(parent, title,date)=>{
	//getting the whole container
	const parentNode=parent.parentNode;
	const section=document.createElement("section");
	const spanTitle=document.createElement("span");
	let textTitle=document.createTextNode(title);
	spanTitle.appendChild(textTitle);
	const spanDate=document.createElement("span");
	spanDate.style.textAlign="right";
	let textDate=document.createTextNode(date);
	spanDate.appendChild(textDate);
	section.appendChild(spanTitle);
	section.appendChild(spanDate);
	parent.after(section);
	
};

const warningReminder=(event)=>{
	const parent=event.target.parentNode;
	const div=document.createElement("div");
	div.style.textAlign="center";
	div.style.color="red";
	div.style.padding="5px 0px";
	const textNode=document.createTextNode("Check the title and date");
	div.append(textNode);
	parent.append(div);
};

//Handling Comment
const comment = (event) => {
    const submitBtn = event.target;
    const postId = submitBtn.getAttribute("data-id");
    const comment = submitBtn.parentNode.childNodes[3].value;
    const path = "http://localhost:8080/LinkedClubs/HandleComments";
    const params = "comment=" + comment + "&postId=" + postId;
    ajaxCall(path, () => appendComment(event, comment),()=>console.log("failed"), params);
};

const appendComment = (event, comment) => {
    const src = event.target.getAttribute("data-img");
    const commentContainer = event.target.parentNode.parentNode.firstElementChild;
    const div = `<div>
        <img src=${src} >
        <span>${comment}</span>
    </div>`;
    commentContainer.innerHTML = commentContainer.innerHTML + div;
};

//Handling like post
const like = (event) => {
    const likeBtn = event.target;
    const isLiked = likeBtn.getAttribute("data-isLiked");
    const postId = likeBtn.getAttribute("data-id");
    const path = "http://localhost:8080/LinkedClubs/HandleLikes";
    const params = "id=" + postId + "&isLiked=" + isLiked;
    if (isLiked == "false") ajaxCall(path, () => changeLikeBtn(likeBtn, "#FF7556", "true"), undefined, params);
    else ajaxCall(path, undefined, () => changeLikeBtn(likeBtn, "black", "false"),  params);
};

//Changing the style of like btn
const changeLikeBtn = (btn, color, isTrue) => {
    btn.style.color = color;
    btn.setAttribute("data-isLiked", isTrue);
};


//Event listeners
likesBtns.forEach(Element => {
    Element.addEventListener("click", (event) => like(event));
});
publishBtns.forEach(Element => {
    Element.addEventListener("click", (event) => comment(event));
});
addReminderBtns.forEach(Element => {
    Element.addEventListener("click", (event) => addReminder(event));
});