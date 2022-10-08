<%-- 
    Document   : homepage
    Created on : Jun 12, 2022, 2:41:33 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/css/foodPage.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/LIB.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <title>Cơm Mẹ Nấu</title>
        <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>

    </head>
    <body>
        <div id="jump"></div>
        <div class="container">
            <form action="<c:url value="/food/search.do"/>" class="search" id="search">
                <div class="search-info">
                    <span class="search-logo"> <i class="fa fa-search"></i></span>
                    <input  oninput="searchByName(this)"class="search-bar"  placeholder="Nhập thông tin.." type="search" name="Search"
                           value="${Search}"/>
                    <button class="search-btn" type="submit" ">
                        Tìm Kiếm
                    </button>
                </div>
            </form>
            <div class="grid">
                <div class="row">
                    <div class="col l-4 category">
                        <ul class="category-list">
                            <li class="category-item category-title">DANH MỤC</li> 
                            <li class="divider-under"></li>
                                <c:forEach items="${categoryList}" var="category">
                                   <button class="category-name" onclick="showFood(this)" value="${category}">${category}</button>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col l-8" id="showFood">
                        <div class="grid" >
                            <div class="row " id="content">
                                <c:forEach items="${foodList}" var="food">
                                    <div class="col l-4 c-12 m-6">
                                        <div class="card">
                                            <div class="card-top">
                                                <a class="card-btn-small" href="<c:url value="/home/detail.do?food=${food.id}"/>">
                                                    <img src="<c:url value="/images/${food.images[0]}"/>" class="card-img-big">
                                                </a>
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title">${food.name}</h5>
                                                <p class="card-text">
                                                    <fmt:formatNumber
                                                    value="${food.price}"
                                                    pattern="#,### "/><i class="fa-solid fa-dong-sign dong-icon"></i>
                                                </p>
<!--                                                <button class="btn btn-outline-success cart-btn">
                                                    <a href="<c:url value="/home/buy.do?productID=${food.id}"/>"
                                                       class="text-decoration-none cart-link">
                                                        <i class="fa fa-cart-plus"></i>
                                                        Thêm vào mâm cơm
                                                    </a>
                                                </button>-->
                                            </div>
                                        </div>
                                    </div> 
                                </c:forEach>
                            </div>
                        </div>
                        <nav aria-label="Page navigation example" class="d-flex align-items-end justify-content-center">
                            <ul class="pagination" id="pagination">
                                <c:forEach begin="1" end="${endPages}" var="i">
                                    <li class="page-item">
                                        <c:if test="${ empty Search}">
                                            <c:if test="${empty categoryName }">
                                                <a class="page-link" href="<c:url value="/home/homePage.do?index=${i}"/>">${i}</a>
                                            </c:if>
                                            <c:if test="${not empty categoryName}">
                                                <a class="page-link"
                                                   href="<c:url value="/home/homePage.do?index=${i}&categoryName=${ categoryName}"/>">${i}</a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${not empty Search}">
                                            <a class="page-link"
                                               href="<c:url value="/home/search.do?index=${i}&Search=${Search}"/>">${i}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="time-show shadow-sm text-decoration-none text-center">
            <span id="hour">00</span> : <span id="minutes">00</span>
        </div>
        <a href="#jump" class="to-header-link shadow-sm text-decoration-none text-center">
            <i id="up" class="fa-solid fa-arrow-up display-none"></i>
            <i id="down" class="fa-solid fa-arrow-down"></i>
        </a>
        <a href="<c:url value="/home/showCart.do"/>" class="text-decoration-none">
            <div class="cart shadow-sm cart-border">
                <div class="quantity text-center">
                    <i class="fa fa-cart-arrow-down me-1"></i>
                    <span>
                        <c:if test="${empty cart}">
                            0
                        </c:if>
                        <c:if test="${not empty cart}">
                            ${quantity}
                        </c:if>
                    </span>
                </div>
            </div>
        </a>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function searchByName(param){
            var txtSearch = param.value;
            $.ajax({
                    url: "/comMeNau/food/searchAjax.do",
                    type: "get",
                    data: {
                        Search : txtSearch
                    },
            success: function(data){
               var row = document.getElementById("content");
               row.innerHTML = data;
               var page = document.getElementById("pagination");
               page.style.display = "none";
            },
            error: function(){
            }
            });
            }
            function showFood(param){
            var category = param.value;
            $.ajax({
                    url: "/comMeNau/food/foodPageAjax.do",
                    type: "get",
                    data: {
                        categoryName : category
                    },
            success: function(data){
               var row = document.getElementById("showFood");
               row.innerHTML = data;
            },
            error: function(){
            }
            });
            }
            
            const upBtn = document.getElementById("up");
        const downBtn = document.getElementById("down");

        downBtn.addEventListener("click", function () {
            
            if (downBtn.classList.contains("display-none")) {
                downBtn.classList.remove('display-none')
                upBtn.classList.add('display-none')
            }
        })
        window.addEventListener("scroll", function () {
            if (window.pageYOffset >= 690.4000244140625) {
                downBtn.classList.add('display-none')
                upBtn.classList.remove('display-none')
            } else {
                downBtn.classList.remove('display-none')
                upBtn.classList.add('display-none')
            }
        })
        </script>
    </body>
</html>
