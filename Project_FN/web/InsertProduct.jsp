<%-- 
    Document   : InsertProduct
    Created on : Jul 6, 2023, 10:21:48 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <!--        <form action="insert">
                    id:<input type="text" name="id"><br/>
                    Name:<input type="text" name="name"><br/>
                    Quantity:<input type="text" name="Quantity"><br/>
                    Price:<input type="text" name="price"><br/>
                    ReleaseDate:<input type="text" name="releaseDate"><br/>
                    Describe:<input type="text" name="describe"><br/>
                    Category:<input type="text" name="category"><br/>
                    <input type="file" name="file" /><br/>
                     <input type="submit" value="Upload" /><br/>
                </form>-->
        <div class="container mt-5">
            <h1> Insert Product: </h1>
            <form  action="insert" method="post" enctype="multipart/form-data">
                        id:<input class="form-control" type="text" name="id"><br/>
                        Name:<input class="form-control" type="text" name="name"><br/>
                        Quantity:<input class="form-control" type="number" name="quantity"><br/>
                        Price:<input class="form-control" type="number" name="price"><br/>
                        ReleaseDate:<input class="form-control" type="date" name="releaseDate"><br/>
                        Describe:<input class="form-control" type="text" name="describe"><br/>
                        Category:
                        <div class="d-flex justify-content-start">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <div class="input-group-text">
                                    <input type="radio" name="Category" value="1" />Nokia
                                  </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <div class="input-group-text">
                                    <input type="radio" name="Category" value="2" />Samsung
                                  </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <div class="input-group-text">
                                    <input type="radio" name="Category" value="3" />Iphone
                                  </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <div class="input-group-text">
                                    <input type="radio" name="Category" value="4" />Galaxy
                                  </div>
                                </div>
                            </div>
                        </div>
                        
                        Upload image:
                        <input class="form-control" type="file" name="file" /><br/>
                        <div class="d-flex justify-content-center">
                            <input class="form-control btn btn-primary w-25" type="submit" value="Upload" /><br/>
                        </div>
            </form>
        </div>
    </body>
</html>
