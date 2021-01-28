//Graping elements
const commentBtns=document.getElementsByName("commentsBtn");
const notificationBtn=document.getElementById("notificationBtn");
const closeBtn=document.getElementById("closeNotificationBtn");

//Fucntions
const displayComments=(event)=>{
    //getting post div
    const post=event.target.parentNode.parentNode.parentNode;
    const commentSection=post.querySelector(".comments");
    commentSection.style.display="block";
};

const displayReminder=()=>{
    const reminderContainer=document.getElementById("reminder__contain__mobile");
    reminderContainer.style.display="block";
};

const hidReminder=()=>{
    const reminderContainer=document.getElementById("reminder__contain__mobile");
    reminderContainer.style.display="none";
};  

//Atach to event listeners
commentBtns.forEach(element=>{
    element.addEventListener("click",displayComments);
});
notificationBtn.addEventListener("click",displayReminder);
closeBtn.addEventListener("click",hidReminder);

