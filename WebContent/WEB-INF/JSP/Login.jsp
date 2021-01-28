<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="/LinkedClubs/CSS/Login.css">
    <title>Sign in</title>
</head>

<body>

    <h1>Sign in for LinkedClubs</h1>
    <h2>${err.get("errLogin")}</h2>

    <form action="/LinkedClubs/Login" method="post">
        <div class="form_container">

            <div class="general_info" id="general_info">
                <input type="text" name="cne" id="email" placeholder="Type your CNE" value=${student.CNE} required><br>
                <span class="erreur">${err.get("errCNE")}</span>
                <input type="password" name="password" id="password" placeholder="Password" value=${student.password} required><br>
                <span class="erreur">${err.get("errPassword")}</span>
            </div>
            <input type="submit" value="Sign in" id="sign_in">
        </div>
    </form>
</body>

</html>