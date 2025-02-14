<%@ page import="dao.CategoryDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="bo.CategoryBO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.*" %>
<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <%
        CategoryBO cb = new CategoryBO();
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
        if(shoppingCart==null){
            shoppingCart = new ShoppingCart();
        }
    %>


</head>
<style>
    /* Thay đổi giao diện toàn bộ widget */
    #google_translate_element {
        padding: 10px;
        display: inline-block;
        border: 1px solid #ddd;
        border-radius: 4px;
        background-color: #f9f9f9;
        margin-bottom:10px;
    }
</style>
<body>
<!-- Page Preloder -->
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="HomePageController"><img src="assets/img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>

            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <!-- <div class="header__cart__price">Số dư tài khoản: <span>200.000₫</span></div> -->
    </div>
    <div class="humberger__menu__widget">
        <!-- <div class="header__top__right__language">
            <img src="assets/img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div> -->
        <div class="header__top__right__auth">
            <a href="login"><i class="fa fa-user"></i> Tài khoản</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li><a href="HomePageController">Trang chủ</a></li>
            <li class="active"><a href="ProductController">Cửa hàng</a></li>
            <li><a href="blog-details.jsp">Các bài viết</a>
            </li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="lien-he.jsp">Liên hệ</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> vuonpho@gmail.com</li>
            <li>Miễn phí giao hàng cho đơn đặt hàng trị giá trên 500.000đ</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul class="d-flex align-items-center">
                            <li class="d-flex align-items-center"><i class="fa fa-envelope"></i> vuonpho@gmail.com</li>
                            <li class="d-flex align-items-center">Miễn phí giao hàng cho đơn đặt hàng trị giá trên 500.000đ</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <!-- <div class="header__top__right__language">
                            <img src="assets/img/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Spanis</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div> -->
                        <div class="header__top__right__auth">
                            <%User auth = (User) session.getAttribute("user");%>
                            <% if(auth != null){ %>
                            <div class="openBtn">
                                <div class="header__top__right__social">
                                    <a class="#" href="logout"><i class="fa fa-user"></i> Đăng xuất </a>
                                </div>
                                <a class="#" href="user-profile.jsp"> Xin chào <%= auth.getUsername() %></a>
                            </div>
                            <% }else { %>
                            <div class="openBtn">
                                <a class="#" href="login"><i class="fa fa-user"></i> Tài khoản</a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row d-flex align-items-center">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="HomePageController"><img src="assets/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="HomePageController">Trang chủ</a></li>
                        <li><a href="StoreProductHome">Cửa hàng</a></li>
                        <li><a href="blog-details.jsp">Các bài viết</a></li>
                        <li><a href="lien-he.jsp">Liên hệ</a></li>
                    </ul>
                </nav>
                <div id="google_translate_element" ></div>

            </div>
            <div class="col-lg-2"> <a href="OrderHistoryCL" class="btn btn-primary d-block">Lịch sử mua hàng</a></div>
            <div class="col-lg-2">
                <div class="header__cart">
                    <a href="ShoppingCartCL">
                        <ul>
                            <span class="cart-word" style="font-weight: bold;">Giỏ hàng</span>
                            <li><i class="fa-solid fa-cart-shopping"></i> <span id="badge" class="cart-count"></span></li>
                        </ul>
                        <!--có thể xóa-->


                    </a>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>

</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh mục sản phẩm</span>
                    </div>
                    <ul>
                        <li><a href="ProductController">Tất cả sản phẩm</a></li>
                        <% for(Category cate : cb.getListCategory()) {%>
                        <li><a href="ProductController?id_category=<%=cate.getId()%>"><%= cate.getNameCategory() %></a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
            <%
                String words = session.getAttribute("words")!= null? (String)session.getAttribute("words") : "";
            %>
            <div class="col-lg-9">
                <div class="hero__search">
<%--                    <div class="hero__search__form">--%>
<%--                        <form action="ProductController" method="post">--%>
<%--                            <input type="text" name="search" placeholder="Bạn cần tìm thứ gì?" value="${sessionScope.words == null ? '' : sessionScope.words}">--%>
<%--                            <button type="submit" class="site-btn"><i class="fa-solid fa-magnifying-glass"></i></button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
    <div class="hero__search__form">
        <form style="display: flex; align-items: center; width: 100%; gap: 10px" action="ProductController" method="GET">

            <input type="hidden" id="searchTypeValue" name="action" value="By Name" />

            <input id="search-panel" style="flex: 1; border: none; padding-left: 12px; margin-right: 10px; outline: none; border-right: 1px solid #ccc"
                   type="text" name="search" placeholder="Bạn cần tìm thứ gì?" value="<%=words%>">
            <input type="hidden" name="order" value="<%=session.getAttribute("order")%>">
            <!-- Submit button -->
            <button type="submit" class="site-btn"><i class="fa fa-search"></i></button>
        </form>
    </div>

    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 123456789</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<%
    Integer totalItems = (Integer) session.getAttribute("totalItems");
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart != null) {
        if (cart.getCartItemList().isEmpty()) totalItems = 0;
    } else {
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
        if(totalItems == null) totalItems = 0;
    }
%>
<script>
    const badge = document.getElementById('badge');
    if (badge.innerHTML === '') badge.innerHTML = '<%=totalItems%>';
</script>
<script type="text/javascript">
    function googleTranslateElementInit() {
        new google.translate.TranslateElement(
            {pageLanguage: 'vi', includedLanguages: 'vi,en,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE},
            'google_translate_element'
        );
    }
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</body>
</html>