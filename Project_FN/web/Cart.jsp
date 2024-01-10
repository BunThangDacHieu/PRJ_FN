<%-- 
    Document   : Cart
    Created on : Jun 30, 2023, 2:56:52 PM
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
        <link rel="stylesheet" href="css/CssForCart.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <form action="listcategory mb-5">
            <input class="form-control btn btn-primary" class="Submit" type="submit" value="Back to Home" >
        </form>
        <div class="d-flex justify-content-center">
            <table class="cart-table table table-striped w-100 align-middle">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Quantity</th>
                    <th>Price Product</th>
                    <th>Total Price</th>                    
                    <th></th>
                </tr>
                <tr>
                        <td>${c.getProductID()}</td>
                        <td>${c.getProductName()}</td>
                        <td><img style="width: 75px" class="cart-image rounded" src="${c.getProductImage()}" alt="alt" /></td>
                        <td>
                            <div class="quantity-container" data-productid="${c.getProductID()}">
                                <button class="quantity-button decrease btn btn-danger" >-</button>
                                <input type="number" style="width: 75px" class="quantity-input form-control d-inline" value="${c.getQuantity()}" min="1" max="10">
                                <button class="quantity-button increase btn btn-success" >+</button>
                            </div>
                        </td>
                        <td>${c.getPriceProduct()}</td>
                        <td>${c.getTotalPrice()}</td>
                        <td><i class="delete-icon fas fa-trash" onclick="deleteProduct('${c.getProductName()}')"></i></td>
                    </tr>
                <c:forEach items="${requestScope.cart}" var="c">
                    <tr>
                        <td>${c.getProductID()}</td>
                        <td>${c.getProductName()}</td>
                        <td><img src="${c.getProductImage()}" alt="alt" class="cart-image" /></td>
                        <td>
                            <div class="quantity-container" data-productid="${c.getProductID()}">
                                <button class="quantity-button decrease" >-</button>
                                <input type="number" class="quantity-input" value="${c.getQuantity()}" min="1" max="10">
                                <button class="quantity-button increase" >+</button>
                            </div>
                        </td>
                        <td>${c.getPriceProduct()}</td>
                        <td>${c.getTotalPrice()}</td>
                        <td><i class="delete-icon fas fa-trash" onclick="deleteProduct('${c.getProductName()}')"></i></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <script>
            function deleteProduct(productName) {
                if (window.confirm("Are you want to delete " + productName)) {

                    window.location.href = "deleteFromCart?productName=" + productName;
                }
            }
            const decreaseButtons = document.querySelectorAll('.decrease');
            const increaseButtons = document.querySelectorAll('.increase');
            const quantityInputs = document.querySelectorAll('.quantity-input');
           
            decreaseButtons.forEach((button, index) => {
                const productID = button.parentNode.getAttribute('data-productid');
                button.addEventListener('click', () => {
                    if (parseInt(quantityInputs[index].value) > 1) {
                        quantityInputs[index].value = parseInt(quantityInputs[index].value) - 1;
                          window.location.href = 'quantity?ac='+quantityInputs
                          [index].value+'&productID='+productID;
                    }
                });
                 
            });

            increaseButtons.forEach((button, index) => {    
                 const productID = button.parentNode.getAttribute('data-productid');
                button.addEventListener('click', () => {
                    if (parseInt(quantityInputs[index].value) < 10) {
                        quantityInputs[index].value = parseInt(quantityInputs[index].value) + 1;
                          window.location.href = 'quantity?ac='+quantityInputs
                          [index].value+'&productID='+productID;
                    }
                });
            });

        </script>
    </body>
</html>
