<%-- 
    Document   : Manage
    Created on : Jul 6, 2023, 4:24:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "dal.*" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/CssForManage.css"/>
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    </head>
    <body>
       
       <form action="listcategory">
            <input class="Submit form-control btn btn-primary" type="submit" value="Back to Home" >
        </form>
        <a class="badge badge-info" href="InsertProduct.jsp"><button>Insert product</button></a>
        <table class="cart-table table table-striped w-100 align-middle">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Quantity</th>
                <th>Price Product</th>                
                <th></th>
            </tr>
            <c:forEach items="${requestScope.listProduct}" var="c">
                <tr>
                    <td>${c.getId()}</td>
                    <td>${c.getName()}</td>
                    <td><img style="width: 75px" class="cart-image rounded" src="${c.getImage()}l" alt="alt" class="cart-image" /></td>
                    <td><span max="50">${c.getQuantity()}</span></td>
                    <td>${c.getPrice()}</td>
                   
                    <td><i class="delete-icon fas fa-trash" onclick="deleteProduct('${c.getId()}')"></i></td>
                </tr>
            </c:forEach>
        </table>
        <script >
            function deleteProduct(id){
                window.location.href = "deleteProduct?id="+id;
            }
        </script>
    </body>
</html>
