<%-- 
    Document   : buy
    Created on : Jul 1, 2023, 10:07:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <style>
            body{
  display: flex;
  height: 100vh;
  justify-content: center;
  align-items: center;
  
}
.container{
  display: flex;
  width: 40%;
  text-align: center;
 
  
}
.content-product{
  margin-left: 150px;
  margin-top: 20px;
  font-size: 20px;
  
}

  .Submit {
  background-color: #4CAF50; /* Màu nền */
  border: none; /* Xóa đường viền */
  color: white; /* Màu chữ */
  padding: 10px 10px; /* Kích thước đệm */
  text-align: center; /* Căn giữa chữ */
  text-decoration: none; /* Xóa gạch chân */
  display: inline-block; /* Hiển thị là một khối inline */
  font-size: 20px; /* Cỡ chữ */
  margin: 4px 2px; /* Khoảng cách giữa nút */
  cursor: pointer; /* Hiển thị con trỏ khi di chuột qua nút */
  border-radius: 4px; /* Bo góc nút */
}

.Submit:hover {
  background-color: #45a049; /* Màu nền khi di chuột qua */
}

.Submit:active {
  background-color: #3e8e41; /* Màu nền khi nút được nhấn */
}


        </style>
    </head>
    <body>
       
        
        <c:set var="c" value="${requestScope.product}"/>
            <div class="container">
                <div class="img-product">
                    <!--<img src="${c.getImage()}" alt="alt"/>-->                    
                    <img style="width: 400px" class="cart-image rounded" src="https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80" alt="alt"/>
                </div>
                <div class="content-product">
                    <p class="h1">${c.name}</p>
                    <p class="h3">${c.price}</p>
                    <p>Quantity: 1</p>
                    <button class="Submit" onclick="buy()" >Thanh toán</button>
                </div>
            </div>
                        <script>
                            function buy(){
                               if(window.prompt("The store will contact you in a few minutes, please enter your phone number")){
                        window.location.href="listcategory";
                        }
                               
                            }
                        </script>
    </body>
</html>
