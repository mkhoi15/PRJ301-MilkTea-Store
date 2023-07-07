<%-- 
    Document   : usPage
    Created on : May 29, 2023, 11:06:54 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>amour Milk Tea</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--===============================================================================================-->	
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--===============================================================================================-->	
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--===============================================================================================-->	
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="./assets/css/shopping.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="./assets/css/base.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="./assets/css/grid.css">
        <!--===============================================================================================-->	
    </head>
    <body>
        <div class="main">

            <div class="header">

                <div class="grid wide">

                    <div class="header__navbar hide-on-mobile-tablet">

                        <ul class="header__navbar-list">
                            <li class="pos header__navbar-item header__navbar-item--hasQR header__navbar-item--separate">
                                Have milk tea with amour</li>

                            <li class="header__navbar-item">
                                <span class="header__navbar-title--no-pointer">Connect</span>
                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa fa-facebook-square header__navbar-icon"></i>
                                </a>

                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa fa-instagram header__navbar-icon"></i>
                                </a>
                            </li>

                        </ul>

                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-hasNotify">
                                <a href="" class="header__navbar-item-link">
                                    <i class="fa fa-bell-o header__navbar-icon"></i>
                                    Notification
                                </a>
                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link">
                                    <i class="fa-regular fa-circle-question header__navbar-icon"></i>
                                    Help
                                </a>
                            </li>
                            <c:choose>
                                <c:when test="${not empty sessionScope.LOGIN_USER}">
                                    <!--Logged in--> 
                                    <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                                        <a href="usPage.jsp" class="header__navbar-item-link">${sessionScope.LOGIN_USER.fullName}</a>
                                    </li>
                                        <c:url var="logoutLink" value="MainController" >
                                            <c:param name="action" value="Logout"></c:param>
                                        </c:url>
                                    <li class="header__navbar-item header__navbar-item--strong">
                                        <a href="${logoutLink}" class="header__navbar-item-link">Logout</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                                        <a href="login.html"  class="header__navbar-item-link" >Login</a>
                                    </li>
                                    <li class="header__navbar-item header__navbar-item--strong">
                                        <a href="MainController?action=CreatePage"  class="header__navbar-item-link">Sign in</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </div>

                    <div class="header-with-search">

                        <label for="mobile-search-checkbox" class="header__mobile-search  hide-on-tablet">
                            <i class="fa-solid fa-magnifying-glass header__mobile-search-icon" style="color: #fff;"></i>
                        </label>

                        <div class="header__logo hide-on-tablet">
                            <a href="#" class="header__logo-link">
                                <img src="./assets/img/my_logo.png" style="height: 100x; width: 100px;">
                            </a>
                        </div>

                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">

                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Find your product">
                            </div>

                            <button class="header__search-btn">
                                <i class="header__search-btn-icon fa fa-search"></i>
                            </button>
                        </div>

                        <!-- Cart -->
                        <div class="header__cart">
                            <a href="MainController?action=View">
                                <div class="header__cart-wrap">

                                    <i class="fa fa-shopping-cart header__cart-icon"></i>
                                    <span class="header__cart-notice">
                                        <c:set var="cart" value="${sessionScope.CART}"/>
                                        ${cart.getCart().size()}
                                    </span>  
                                </div>
                            </a>

                        </div>
                    </div>


                </div>
                <ul class="header__sort-bar">
                    <li class="header__sort-item header__sort-item--active">
                        <a href="" class="header__sort-link ">Relate</a>
                    </li>
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Newest</a>
                    </li>
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Hot </a>
                    </li>
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Price</a>
                    </li>
                </ul>
            </div>



            <div class="container">
                <div class="grid wide">
                    <div class="row app-content sm-gutter">
                        <div class="col l-2 m-0 c-0">
                            <nav class="category">
                                <h3 class="category-heading">
                                    <i class="fa fa-bars category-heading-icon"></i>
                                    Category
                                </h3>

                                <ul class="category-list ">
                                    <li class="category-item category-item--active">
                                        <a href="#" class="category-item-link ">All Product</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="#" class="category-item-link">Traditional </a>
                                    </li>
                                    <li class="category-item">
                                        <a href="#" class="category-item-link">Modern</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col l-10 m-12 c-12">
                            <div class="home-filter hide-on-mobile-tablet">
                                <h3 class="home-filter-message">${requestScope.MESSAGE}</h3>
                            </div>



                            <div class="home-product">
                                <!-- Grid > row > col -->
                                <div class="row sm-gutter">
                                    <c:forEach items="${requestScope.LIST_TEA}" var="tea">
                                        <div class="col l-4 m-6 c-6">
                                            <form action="MainController" method="POST" >
                                                <input type="hidden" name="id" value="${tea.id}"/>
                                                <span class="home-product-item" href="#">
                                                    <div class="home-product-item__img"
                                                         style="background-image: url(${tea.imgPath});">
                                                    </div>
                                                    <input type="hidden" name="imgPath" value="${tea.imgPath}" />
                                                    <h4 class="home-product-item__name">${tea.name}</h4>
                                                    <input type="hidden" name="name" value="${tea.name}"/>
                                                    <div class="home-product-item__price">
                                                        <span class="home-product-item__priceCurrent">${tea.price}$</span>
                                                        <input type="hidden" name="price" value="${tea.price}"/>
                                                    </div>
                                                    <div class="custom-select" style="width:100%;">
                                                        <select name="quantity">
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select> 
                                                    </div>
                                                    <input type="hidden" name="page" value="${requestScope.CURRENT_PAGE}"/>
                                                    <input class="button" type="submit" name="action" value="Add">
                                                    <div class="home-product-item__Mall">
                                                        <span>Mall</span>
                                                    </div>
                                                    <div class="home-product-item__saleoff">
                                                        <span class="home-product-item__saleoff-percent">20%</span>
                                                        <span class="home-product-item__saleoff-label">OFF</span>
                                                    </div>
                                                </span>
                                            </form>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>

                            <ul class="pagination home-product__pagination">
                                <c:url var="firstPageLink" value="MainController">
                                    <c:param name="action" value="ShoppingPage"></c:param>
                                    <c:param name="page" value="${requestScope.CURRENT_PAGE - 1}"></c:param>
                                </c:url>
                                <c:if test="${requestScope.CURRENT_PAGE != 1}">
                                    <li class="pagination-item">
                                        <a href="${firstPageLink}" class="pagination-item_link" tabindex="-1" aria-disabled="true">
                                            <i class=" fa fa-arrow-left pagination-item_linkIcon"></i>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.NUMBER_OF_PAGES}" var="i">
                                    <c:choose>
                                        <c:when test="${CURRENT_PAGE eq i}">
                                            <li class="pagination-item pagination-item--active" aria-current="page">
                                                <a class="pagination-item_link" href="MainController?action=ShoppingPage&page=${i}">
                                                    ${i}
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="pagination-item">
                                                <a class="pagination-item_link" href="MainController?action=ShoppingPage&page=${i}">
                                                    ${i}
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>  
                                <c:url var="lastPageLink" value="MainController">
                                    <c:param name="action" value="ShoppingPage"></c:param>
                                    <c:param name="page" value="${requestScope.CURRENT_PAGE + 1}"></c:param>
                                </c:url>
                                <c:if test="${requestScope.CURRENT_PAGE lt requestScope.NUMBER_OF_PAGES}">
                                    <li class="pagination-item">
                                        <a href="${lastPageLink}" class="pagination-item_link">
                                            <i class=" fa fa-arrow-right pagination-item_linkIcon"></i>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>


                    </div>
                </div>
            </div>

            <div class="footer">
                <div class="grid wide footer__content">
                    <div class="row">
                        <div class="col l-2-4 m-4 c-6">
                            <h3 class="footer-heading">Customer care</h3>
                            <ul class="footer-list">
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Help Center</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shoppe Blog</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shoppe Mall</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shopping Guide</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Selling Guide</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Sign in Guide</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Payment</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shoppe Coin</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shipping</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Returns & Refunds</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Customer Care</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Warranty Policy</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <h3 class="footer-heading">About Shoppe</h3>
                            <ul class="footer-list">
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">About Shoppe Viet Nam</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Recruitment</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shopee Terms</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Privacy Policy</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Genuine </a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Seller Channel</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Flash Sales</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Shopee Affiliate Program</a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">Contact Media</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <h3 class="footer-heading">Payment</h3>
                            <ul class="footer-payment-list">
                                <li class="footer-payment-app">
                                    <a href="" class="footer-payment-app-link">
                                        <img src="./assets/img/icons/icon-pay-02.png" alt="Visa" class="footer-payment-app">
                                    </a>
                                </li>
                                <li class="footer-payment-app">
                                    <a href="" class="footer-payment-app-link">
                                        <img src="./assets/img/icons/icon-pay-03.png" alt="MasterCard" class="footer-payment-app">
                                    </a>
                                </li>
                                <li class="footer-payment-app">
                                    <a href="" class="footer-payment-app-link">
                                        <img src="./assets/img/icons/icon-pay-01.png" alt="Paypal" class="footer-payment-app">
                                    </a>
                                </li>
                                <li class="footer-payment-app">
                                    <a href="" class="footer-payment-app-link">
                                        <img src="./assets/img/icons/icon-pay-04.png" alt="American Express"
                                             class="footer-payment-app">
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <h3 class="footer-heading">Follow us on</h3>
                            <ul class="footer-list">
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">
                                        <i class="fa fa-facebook-square" style="color: #4a4a4a;"></i>
                                        Facebook
                                    </a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">
                                        <i class="fa fa-instagram"
                                           style="color: #4a4a4a;"></i>
                                        Instagram
                                    </a>
                                </li>
                                <li class="footer-list-item">
                                    <a href="#" class="footer-list-item-link">
                                        <i class="fa fa-linkedin-square" style="color: #4a4a4a;"></i>
                                        Linkedin
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-2-4 m-8 c-12 ">
                            <h3 class="footer-heading footer-heading-lastChild">Download Shoppe</h3>
                            <div class="footer_content-lastChild">
                                <div class="footer__download">
                                    <img src="./assets/img/icons/qrCode.png" alt="QR Code" class="footer__download-qr">
                                    <div class="footer__download-apps">
                                        <a href="" class="footer__download-link">
                                            <img src="./assets/img/icons/ggplay.png" alt="Google Play"
                                                 class="footer__download-app-img">
                                        </a>
                                        <a href="" class="footer__download-link">
                                            <img src="./assets/img/icons/appStore.png" alt="App Store"
                                                 class="footer__download-app-img">
                                        </a>
                                        <a href="" class="footer__download-link">
                                            <img src="./assets/img/icons/appGallery.png" alt="App Gallery "
                                                 class="footer__download-app-img">
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="grid wide">

                        <h3 class="footer-text"> HAPPY SUGAR LIFE <3 </h3>

                    </div>

                </div>
            </div>
        </div>

        <script>
            var x, i, j, l, ll, selElmnt, a, b, c;
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select");
            l = x.length;
            for (i = 0; i < l; i++) {
                selElmnt = x[i].getElementsByTagName("select")[0];
                ll = selElmnt.length;
                /*for each element, create a new DIV that will act as the selected item:*/
                a = document.createElement("DIV");
                a.setAttribute("class", "select-selected");
                a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                x[i].appendChild(a);
                /*for each element, create a new DIV that will contain the option list:*/
                b = document.createElement("DIV");
                b.setAttribute("class", "select-items select-hide");
                for (j = 1; j < ll; j++) {
                    /*for each option in the original select element,
                     create a new DIV that will act as an option item:*/
                    c = document.createElement("DIV");
                    c.innerHTML = selElmnt.options[j].innerHTML;
                    c.addEventListener("click", function (e) {
                        /*when an item is clicked, update the original select box,
                         and the selected item:*/
                        var y, i, k, s, h, sl, yl;
                        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                        sl = s.length;
                        h = this.parentNode.previousSibling;
                        for (i = 0; i < sl; i++) {
                            if (s.options[i].innerHTML == this.innerHTML) {
                                s.selectedIndex = i;
                                h.innerHTML = this.innerHTML;
                                y = this.parentNode.getElementsByClassName("same-as-selected");
                                yl = y.length;
                                for (k = 0; k < yl; k++) {
                                    y[k].removeAttribute("class");
                                }
                                this.setAttribute("class", "same-as-selected");
                                break;
                            }
                        }
                        h.click();
                    });
                    b.appendChild(c);
                }
                x[i].appendChild(b);
                a.addEventListener("click", function (e) {
                    /*when the select box is clicked, close any other select boxes,
                     and open/close the current select box:*/
                    e.stopPropagation();
                    closeAllSelect(this);
                    this.nextSibling.classList.toggle("select-hide");
                    this.classList.toggle("select-arrow-active");
                });
            }
            function closeAllSelect(elmnt) {
                /*a function that will close all select boxes in the document,
                 except the current select box:*/
                var x, y, i, xl, yl, arrNo = [];
                x = document.getElementsByClassName("select-items");
                y = document.getElementsByClassName("select-selected");
                xl = x.length;
                yl = y.length;
                for (i = 0; i < yl; i++) {
                    if (elmnt == y[i]) {
                        arrNo.push(i)
                    } else {
                        y[i].classList.remove("select-arrow-active");
                    }
                }
                for (i = 0; i < xl; i++) {
                    if (arrNo.indexOf(i)) {
                        x[i].classList.add("select-hide");
                    }
                }
            }
            /*if the user clicks anywhere outside the select box,
             then close all select boxes:*/
            document.addEventListener("click", closeAllSelect);
        </script>
    </body>

</html>

