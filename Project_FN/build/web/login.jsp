<%-- 
    Document   : login
    Created on : Jun 23, 2023, 12:44:54 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body{
           
            background-image: url("images/back.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
        }
        .box-login{
          
        width: 100%; /* Đặt chiều rộng của .box-login */
        height: 75%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 150px;
        margin-left: auto; /* Căn giữa theo chiều ngang */
        margin-right: auto; /* Căn giữa theo chiều ngang */
       
}
            
        
        .welcome{
           font-size: 60px;
           margin-right: 100px;
           color: chocolate;
          
          
        }
       
        .login{
            font-size: 25px;
        }
        .login input{
            width: 250px;
            font-size: 25px;
            outline: none;
            padding: 15px;
        }
        .Submit:hover{
            color: gray;
            border: 3px solid gray;    
        }
        .Submit{
            
           margin-left: 105px;
           border-radius: 6px;
           outline: none;
           border: 3px solid white;
           margin-bottom: 30px;
        }
        /* Định dạng checkbox */
input[type="checkbox"] {
  
  width: 20px; /* Chiều rộng checkbox */
  height: 20px;
  border: 2px solid #999; /* Đường viền checkbox */
  border-radius: 4px; /* Bo góc checkbox */
  outline: none; /* Loại bỏ viền xung quanh khi focus */
  transition: all 0.3s ease; /* Hiệu ứng chuyển đổi mềm mượt */
  cursor: pointer; /* Hiển thị con trỏ khi hover */
}

/* Định dạng checkbox khi được chọn */


/* Định dạng văn bản "Remember me" */
span {
  font-family: Arial, sans-serif; /* Font chữ */
  font-size: 16px; /* Kích thước chữ */
  color: #333; /* Màu chữ */
  margin-left: 5px; /* Khoảng cách với checkbox */
  font-weight: bold; 
}

/* Định dạng khi hover vào checkbox */
input[type="checkbox"]:hover {
  border-color: #999; /* Màu viền khi hover */
}

/* Định dạng khi checkbox được chọn và hover */


    </style>
    </head>
    <body>
        <div class="box-login container rounded" style="background-color: beige">
        <h1 class="welcome">Welcome shop</h1>
        <c:set value="${pageContext.request.cookies}" var="cookie"/>
        <div class="login">
            <h3>${requestScope.error}</h3>
            <form action="login" method="post">
            <p>Tài khoản: <input class="login_taikhoan form-control w-100 p-1" type="text" name="username" placeholder="username"
                                value="${cookie.cuser.value}"><br/></p>
            <p>Mật khẩu: <input class="login_matkhau form-control w-100 p-1" type="password" name="password" placeholder="password"
                               value="${cookie.cpass.value}"><br/></p>
            <div>
                <input type="checkbox" name="rem" value="ON" ${(cookie.crem !=null?'checked':'')}>  
                <span>Remember me</span> <br/>
            </div>
            
            <input class=" btn btn-primary p-2" type="submit" value="Login" name="login">
            <input class=" btn btn-danger p-2" type="submit" value="Registor" name="registor">
            </form>
        </div>
    </div>
    </body>
</html>
