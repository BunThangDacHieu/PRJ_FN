<%-- 
    Document   : registor
    Created on : Jun 24, 2023, 11:48:58 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/CssForRegistor.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class = "registor d-flex justify-content-center align-items-center" style="height: 100vh">
        <div class="container d-flex justify-content-center align-items-center flex-column">
            <h2 style="color: red">${requestScope.msg}</h2>
            <h1>Register</h1>
            <form class="w-50" action="registor" method="post" >
                <p>Username: <input class="form-control" type="text" name="username" placeholder="username"></p>
                <p>Password: <input class="form-control" type="password" name="password" placeholder="password"></p>
                <p>Confirm Password: <input type="password" class="form-control" name="confirmPassword" placeholder="confirm password"></p>
                <div class="d-flex justify-content-center">
                    <input class=" btn btn-primary p-2" type="submit" value="Register" name="registor">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
