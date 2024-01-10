<%-- 
    Document   : Home
    Created on : Jun 23, 2023, 12:34:01 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dta.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="css/cssforhome.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script>
            function search() {
                var searchTerm = document.getElementById("search-input1").value;

                window.location.href = "searchByDescription?condition=" + searchTerm;
            }
            function AddToCard(i) {
                if (window.confirm("Are you add product to cart")) {
                    window.location.href = "AddToCart?id=" + i;
                }
            }
            function BuyProduct(i) {

                window.location.href = "buy?id=" + i;

            }


        </script>
        <style>
            a{
                text-decoration: none;
                color: black;
            }
            li{
                list-style-type: none;
            }
            .header{
                background-color: aqua;
                padding: 10px;
            }
            .header ul{
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                align-items: center;
                margin: 0;
            }
            input{
                border-radius: 5px 0 0 5px;
                padding: 5px;
            }
            .search-button {
               height: 38px;
               border-radius: 0 5px 5px 0;
               border: 1px solid black;
               padding: 0 10px;
            }
            .login {
                margin-right: 10px;
            }
            .mr-10px{
                margin-right: 10px;
            }
        </style>
    </head>
</head>
<body>
    <div class="header">
        <ul class="item-list">
            <li class="logo">
                <a href="#">Xstore </a>
            </li>
            <li class="home">
                <a href="listcategory">Trang chủ</a>
            </li>
            <li class="contact">
                <a href="contact.jsp">Liên hệ</a>
            </li>
            <li class="search">
                <div class="search-container">
                    <input type="text" class="search-input" id="search-input1" placeholder="Search..." name="condition">
                    <button onclick="search()" class="search-button">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </li>
            <li class="cart">
                <a href="cartservlet">
                    <i class="fa fa-shopping-cart"></i>
                    Giỏ hàng
                </a>
            </li>
            <li class="login1" >

                <%-- Kiểm tra thuộc tính "account" trong session --%>

                <%-- Nếu thuộc tính "account" là null --%>
                <c:if test="${sessionScope.account == null}">
                    <div class="user">
                        <a  class="login" href="login.jsp">Đăng nhập</a>
                        <a class="logout" href="registor.jsp">Đăng kí</a>
                    </div>
                </c:if>
                <%-- Nếu thuộc tính "account" không null --%>
                <c:if test="${sessionScope.account != null}">
                    <div>
                        <div class="user-avatar">
                            <img src="images/user.jpg" alt="User Avatar">
                            <div class="dropdown-content">
                                <c:if test="${sessionScope.account.getRole()== 1}">
                                    <a class="mr-10px" href="manage" id="mangage">Quản lí sản phẩm</a>
                                </c:if>

                                <a href="logout" id="logout">Đăng xuất</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </li>
        </ul>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h2>Danh mục</h2>
                <!-- Nội dung danh mục -->
                <ul class="list-group">

                    <c:forEach items="${requestScope.listCategory}" var="i">
                        <li class="list-group-item"><a href="search?condition=${i.id}">${i.name}</a></li>
                        </c:forEach>
                    <li class="list-group-item"><a href="search?condition=0">Tất cả</a></li>
                </ul>
            </div>
            <div class="col-md-9">

                <!-- đoạn này dùng để chọn category xong in ra product -->
                <c:if test="${ requestScope.listProduct == null}">
                    <ul class="item">
                        <c:forEach items="${requestScope.listPr}" var="i">
                            <li class="product-container">
                                <div class="product mt-4 d-flex" href="#">
                                    <img class="img-thumbnail w-25 rounded" src="${i.image}" />
                                    <div class="ml-4 d-flex flex-column">
                                        <p class="h2">${i.name}</p>
                                        <small class="oldprice">Gia goc: <span class="old">${i.price*3}</span></small>   
                                        <small>Gia ban: ${i.price}</small>
                                        <div>
                                            <button class="buy-button btn btn-primary" onclick="BuyProduct('${i.id}')" >Buy</button>
                                            <button class="buy-button btn btn-success" onclick="AddToCard('${i.id}')">Add to cart</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <c:set var="page" value="${requestScope.page1}"/>
                    <c:forEach begin="${1}" end="${num1}" var="i">
                        <li ><a class="badge badge-info" href="listcategory?page=${i}&condition=${requestScope.id_raw}">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${ requestScope.listProduct != null}">
                    <ul class="item">
                        <c:forEach items="${requestScope.listProduct}" var="i">

                            <li class="product-container">
                                <div class="product" href="#">
                                    <img src="${i.image}" />
                                    <p>${i.name}</p>
                                    <p class="oldprice">Gia goc:<span class="old">${i.price*3}</span></p>   
                                    <p>Gia ban:${i.price}</p>
                                    <button class="buy-button" onclick="BuyProduct('${i.id}')">Buy</button>
                                    <button class="buy-button" onclick="AddToCard('${i.id}')">Add to cart</button>
                                </div>
                            </li>

                        </c:forEach>
                    </ul>

                </div>
            </div>
            <c:set var="page" value="${requestScope.page}"/>
            <ul class="button-container">
                <c:forEach begin="${1}" end="${num}" var="i">
                    <li class="button-box"><a class="button-page" href="search?page=${i}&condition=${requestScope.id_raw}">${i}</a></li>
                    </c:forEach>
            </ul>
        </c:if>
    </div>

</body>
</html>
