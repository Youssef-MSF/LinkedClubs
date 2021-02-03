<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="navBar">
    <main>
        <a href="">LinkedClubs</a>
        <button>
            <input type="text" placeholder="search">
            <i class="fab fa-searchengin"></i>
        </button>
        <div>
            <button id="notificationBtn"><i class="fas fa-sticky-note"></i></button><span>63</span>
            <button id="notifyBtn"><i class="fas fa-bell"></i></button><span id="nbrNotificattion" >68</span>
            <img src="/LinkedClubs/Images/profileImages/<c:out value="${sessionScope.student.profileImage}"/>" alt="profile picture">
            <span id="fullName"><c:out value="${sessionScope.student.fullName}"/></span>
        </div>
    </main>
</nav>