<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/LinkedClubs/CSS/styleAdmin.css">
    <title>admin</title>
</head>
<body>
    <div class="login-page">
        <div class="form">
          
          <form class="login-form" action="CreateClub" method="post">
            <input type="text" placeholder="clubId" name="ClubId"/>
            <input type="password" placeholder="password" name="password"/>
            <input type="password" placeholder="confirtionmation" name="confirmPassword" />
            <button>Create</button>
          
          </form>
        </div>
      </div>
</body>
</html>