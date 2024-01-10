<%-- 
    Document   : contact
    Created on : Jun 23, 2023, 9:51:07 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/CssForContact.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="d-flex justify-content-center align-items-center" style="height: 100vh">
        <div class="container text-center" style="background-color: beige; border-radius: 10px; padding: 100px 20px">
            <h1>Contact</h1>
            <h3>Email: bunthang204gmail.com</h3>
            <h4>Số điện thoại liên hệ: 0335413680</h4>
            <h2>Gửi yêu cầu</h2>
            <form class="forma"  action="listcategory" >
                <input class="form-control" class="abc" type="textarea" name="textarea"><br/>
                <input class="btn btn-primary" type="submit" value="sent">
            </form>
        </div>
    </body>
</html>
