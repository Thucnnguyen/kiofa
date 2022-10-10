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
        <link href="${pageContext.request.contextPath}/css/homePage.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/LIB.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <title>Cơm Mẹ Nấu</title>
    </head>
    <body>
        <div class="body">
            <div class="grid">
                <div class="row mt-16 w-100">
                    <div class="best-seller">
                        <h2 class="best-seller-content">
                            BEST SELLER
                        </h2>
                        <div class="best-seller-bottom"></div>
                    </div>
                    <div class="col l-8 pl-144">
                        <img class="preview-img-food" src="${pageContext.request.contextPath}/images/${MealHot.images[0]}" alt=""/>
                        <div class="d-flex justify-content-between">
                            <h2 class="preview-intro-price">Chỉ
                                <span class="preview-price"><fmt:formatNumber
                                        value="${MealHot.price}"
                                        pattern="#,### "/>VND</span>
                            </h2>
                            <button class="btn btn-outline-success cart-btn-top" onclick="addToCart(this)" value="${meal.id}">
                                Xem Thêm
                            </button>
                        </div>
                    </div>
                    <div class="col l-4 ml-16">
                        <h1 class="preview-title">
                            ${MealHot.name}
                        </h1>
                        <hr class="preview-border"/>
                        <c:forEach items="${MealHot.foods}" var="food">
                            <div class="preview-food-list">
                                <img class="preview-img-small" src="${pageContext.request.contextPath}/images/${food.images[0]}" alt=""/>
                                <span class="preview-food">${food.name}</span><br/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="preview" >
                <div class="preview-content">
                    <h1 class="preview-heading">
                        Cơm Mẹ Nấu
                    </h1>
                    <div class="preview-description">
                        Một nơi bạn có thể tìm được cảm giác quê hương ngay trong lòng thành phố
                    </div>
                </div>
                <img class="preview-img" src="${pageContext.request.contextPath}/images/food.jpg" alt=""/>
            </div>
            <div id="jump" class="jump"></div>
            <form action="<c:url value="/home/search.do"/>" class="search" id="search">
                <div class="search-info" >
                    <span class="search-logo"> <i class="fa fa-search"></i></span>
                    <input class="search-bar"  placeholder="Nhập thông tin.." type="search" name="Search"
                           value="${Search}"/>
                    <button class="search-btn" type="submit">
                        Tìm Kiếm
                    </button>
                </div>
            </form>
            <div class="grid wide">
                <div class="row">
                    <div class="col l-12 m-6 c-12">
                        <div class="row">
                            <div class="timeline">
                                <ul class="timeline-list">
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Hai</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Ba</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Tư</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Năm</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Sáu</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Thứ Bảy</button></li>
                                    <li class="timeline-item"><button class="timeline-btn">Chủ Nhật</button></li>
                                </ul>
                            </div>
                            <div class="sort">
                                <span class="sort-bar-label">Lựa Chọn Khung Giờ</span>
                                <button class="sort-option">11 - 13</button>
                                <button class="sort-option">17 - 19</button>
                            </div>
                            <c:forEach items="${mealList}" var="meal">
                                <div class="col l-4 c-12 m-6">
                                    <div class="card">
                                        <div class="card-top">
                                            <a class="card-btn-big" href="<c:url value="/home/detail.do?productid=${meal.id}"/>">
                                                <img src="${pageContext.request.contextPath}/images/${meal.images[0]}" class="card-img-big">
                                            </a>
                                            <h5 class="card-title">${meal.name}</h5>
                                        </div>
                                        <div class="card-body row">
                                            <div class="col l-6">
                                                <p class="card-price">
                                                    <span class="card-price-pre">Từ</span>
                                                    <fmt:formatNumber
                                                        value="${meal.price}"
                                                        pattern="#,### VND"/>
                                                </p>
                                            </div>  
                                            <div class="col l-6 ta-r pt-10">
                                                <button class="btn btn-outline-success cart-btn" onclick="addToCart(this)" value="${meal.id}">
                                                    Xem Thêm
                                                </button>
                                            </div>
                                            <p class="card-chef">
                                                <span class="card-chef-pre">Đầu Bếp: </span>
                                                Nguyễn Thị A
                                            </p>

                                        </div>
                                    </div>
                                </div> 
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="time-show shadow-sm text-decoration-none text-center">
            <span id="hour">00</span> : <span id="minutes">00</span>
        </div>
        <a href="#jump" class="to-header-link shadow-sm text-decoration-none text-center ">
            <i id="up" class="fa-solid fa-arrow-up display-none"></i>
            <i id="down" class="fa-solid fa-arrow-down"></i>
        </a>   
                    
    </body>
    <script>
        const upBtn = document.getElementById("up");
        const downBtn = document.getElementById("down");

        downBtn.addEventListener("click", function () {
            if (downBtn.classList.contains("display-none")) {
                downBtn.classList.remove('display-none')
                upBtn.classList.add('display-none')
            }
        })
        window.addEventListener("scroll", function () {
            if (window.pageYOffset >= 2180) {
                downBtn.classList.add('display-none')
                upBtn.classList.remove('display-none')
            } else {
                downBtn.classList.remove('display-none')
                upBtn.classList.add('display-none')
            }
        })
    </script>
</html>
