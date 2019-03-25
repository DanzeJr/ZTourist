<%-- 
    Document   : index
    Created on : Mar 12, 2019, 1:32:01 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <title>Z Tourist - Dashboard</title>
    </head>
    <body class="tg-home tg-homevtwo">
        <s:action name="init"/>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <!--************************************
                                Loader Start
        *************************************-->
        <div class="loader">
            <div class="span">
                <div class="location_indicator"></div>
            </div>
        </div>
        <!--************************************
                                Loader End
        *************************************-->
        <!--************************************
                        Mobile Menu Start
        *************************************-->
        <nav id="menu">
            <ul>
                <li><s:a href="index.jsp">Home</s:a></li>
                    <li><a href="destinations.html">Destinations</a></li>
                    <li><a href="javascript:void(0);">Tour Packages</a>
                        <div>
                            <ul>
                                <li><a href="vietnameTour.jsp">Vietnam Tour</a></li>
                                <li><a href="skoreaTour.jsp">South Korea Tour</a></li>
                                <li><a href="japanTour.jsp">Japan Tour</a></li>
                                <li><a href="chinaTour.jsp">China Tour</a></li>
                                <li><a href="singaporeTour.jsp">Singapore Tour</a></li>
                            </ul>
                            <div class="tg-sliderarea">
                                <h2>Popular Tours</h2>
                                <div class="tg-trendingtripsslider tg-trendingtrips owl-carousel">                                
                                <s:if test="%{#request.Ptour != null}">
                                    <s:iterator value="%{#request.Ptour}">
                                        <div class="item tg-trendingtrip">
                                            <figure>
                                                <s:a href="tourbookingdetail.jsp">
                                                    <img style="height: 180px;" src="<s:property value="%{titleImage}"/>" alt="image destinations">
                                                    <div class="tg-hover">
                                                        <span class="tg-tourduration"><s:property value="%{duration}"/> Days</span>
                                                        <span class="tg-locationname"><s:if test="%{!listPlace.isEmpty()}"><s:property value="%{listPlace[listPlace.size() - 1].getName()}"/></s:if></span>
                                                            <div class="tg-pricearea">
                                                                <span>from</span>
                                                                <h4><s:property value="%{fareAdult}"/>$</h4>
                                                        </div>
                                                    </div>
                                                </s:a>
                                            </figure>
                                        </div> 
                                    </s:iterator>
                                </s:if>
                            </div>
                        </div>
                    </div>
                </li>
                <li><a href="javascript:void(0);">Pages</a>
                    <ul>
                        <li><a href="faqs.html">FAQ’s</a></li>
                        <li><a href="packages.html">Table</a></li>
                        <li><a href="aboutus.html">About Us</a></li>
                        <li><a href="contactus.html">Contact us</a></li>
                        <li><a href="billingdetail.html">Billing Detail</a></li>
                        <li><a href="404error.html">404 Error</a></li>
                        <li><a href="comingsoon.html">Coming Soon</a></li>
                        <li><a href="cart.html">cart</a></li>
                        <li>
                            <a href="javascript:void(0);">Tours</a>
                            <ul>
                                <li><a href="tourcatagory.html">Tour Catagory</a></li>
                                <li><a href="tourbookingdetail.html">Tour Detail</a></li>
                                <li><a href="tourpaymentdetail.html">Tour Payment</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!--************************************
                        Mobile Menu End
        *************************************-->
        <!--************************************
                        Wrapper Start
        *************************************-->
        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!--************************************
                            Header Start
            *************************************-->
            <header id="tg-header" class="tg-header tg-headervtwo tg-headerfixed tg-haslayout">
                <div class="container-fluid">
                    <div class="row">
                        <strong class="tg-logo"><a href="index.html"><img src="images/dbzlogo.png" alt="company logo here"></a></strong>
                        <nav class="tg-infonav" style="padding: 0;">
                            <ul>
                                <li>
                                    <button class="mytg-btndropdown" id="tg-dropdowndashboard" type="button" data-toggle="dropdown">
                                        <img style="width: 35px; height: 35px;" src="<s:property value="%{#session.AVA}"/>" alt="image description">
                                    <span><s:property value="%{#session.USER}"/></span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <ul class="dropdown-menu tg-dropdownusermenu" id="dropdownUser" aria-labelledby="tg-dropdowndashboard">
                                    <li><a href="viewProfile">Dashboard</a></li>
                                    <li><a href="editProfile">Edit Profile</a></li>
                                    <li><a href="signOut">Sign Out</a></li>
                                </ul>
                            </li>
                            <li>
                                <a style="line-height: 35px" href="javascript:void(0);"><img src="images/icons/icon-03.png" alt="image destinations"></a>
                                <div class="tg-cartitems">
                                    <div class="tg-cartlistitems">
                                        <h3>Shopping Cart</h3>
                                        <div class="tg-cartitem">
                                            <figure class="tg-itemimg"><img src="images/products/img-11.jpg" alt="image description"></figure>
                                            <div class="tg-contentbox">
                                                <div class="tg-producthead">
                                                    <em>x 2</em>
                                                    <h4><a href="javascript:void(0);">Switzerland – 12 Days<span>Hiking Tour</span></a></h4>
                                                </div>
                                                <span>$600</span>
                                            </div>
                                        </div>
                                        <div class="tg-cartitem">
                                            <figure class="tg-itemimg"><img src="images/products/img-11.jpg" alt="image description"></figure>
                                            <div class="tg-contentbox">
                                                <div class="tg-producthead">
                                                    <em>x 2</em>
                                                    <h4><a href="javascript:void(0);">Switzerland – 12 Days<span>Hiking Tour</span></a></h4>
                                                </div>
                                                <span>$600</span>
                                            </div>
                                        </div>
                                        <div class="tg-subtotal">
                                            <h2>Subtotal</h2>
                                            <span>$830</span>
                                        </div>
                                    </div>
                                    <div class="tg-btnarea">
                                        <a class="tg-btn" href="#"><span>view cart</span></a>
                                    </div>
                                </div>
                            </li>
                            <%--<li><a href="#tg-search"><img src="images/icons/icon-04.png" alt="image destinations"></a></li> --%>
                        </ul>
                        </nav>
                        <div class="tg-navigationarea">
                            <div class="tg-navigationholder">
                                <nav id="tg-nav" class="tg-nav">
                                    <div class="navbar-header">
                                        <a href="#menu" class="navbar-toggle collapsed">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </a>
                                    </div>
                                    <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                                        <ul>
                                            <li class="menu-item-has-children"><a href="javascript:void(0);">Home</a>
                                            </li>
                                            <li><a href="destinations.html">destinations</a></li>
                                            <li class="menu-item-has-children menu-item-has-mega-menu"><a href="javascript:void(0);">tour packages</a>
                                                <div class="mega-menu">
                                                    <ul>
                                                        <li><a href="vietnameTour.jsp">Vietnam Tour</a></li>
                                                        <li><a href="skoreaTour.jsp">South Korea Tour</a></li>
                                                        <li><a href="japanTour.jsp">Japan Tour</a></li>
                                                        <li><a href="chinaTour.jsp">China Tour</a></li>
                                                        <li><a href="singaporeTour.jsp">Singapore Tour</a></li>
                                                    </ul>
                                                    <div class="tg-sliderarea">
                                                        <h2>Popular Tours</h2>
                                                        <div class="tg-trendingtripsslider tg-trendingtrips owl-carousel">                                                            
                                                            <s:if test="%{#request.Ptour != null}">
                                                                <s:iterator value="%{#request.Ptour}">
                                                                    <div class="item tg-trendingtrip">
                                                                        <figure>
                                                                            <s:a href="tourbookingdetail.jsp">
                                                                                <img style="height: 180px;" src="<s:property value="%{titleImage}"/>" alt="image destinations">
                                                                                <div class="tg-hover">
                                                                                    <span class="tg-tourduration"><s:property value="%{duration}"/> Days</span>
                                                                                    <span class="tg-locationname"><s:if test="%{!listPlace.isEmpty()}"><s:property value="%{listPlace[listPlace.size() - 1].getName()}"/></s:if></span>
                                                                                        <div class="tg-pricearea">
                                                                                            <span>from</span>
                                                                                            <h4><s:property value="%{fareAdult}"/>$</h4>
                                                                                    </div>
                                                                                </div>
                                                                            </s:a>
                                                                        </figure>
                                                                    </div> 
                                                                </s:iterator>
                                                            </s:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="menu-item-has-children"><a href="javascript:void(0);">pages</a>
                                                <ul class="sub-menu">
                                                    <li><a href="faqs.html">FAQ’s</a></li>
                                                    <li><a href="packages.html">Table</a></li>
                                                    <li><a href="aboutus.html">About Us</a></li>
                                                    <li><a href="contactus.html">Contact us</a></li>
                                                    <li><a href="billingdetail.html">Billing Detail</a></li>
                                                    <li><a href="404error.html">404 Error</a></li>
                                                    <li><a href="comingsoon.html">Coming Soon</a></li>
                                                    <li><a href="cart.html">cart</a></li>
                                                    <li class="menu-item-has-children">
                                                        <a href="javascript:void(0);">Tours</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="tourcatagory.html">Tour Catagory</a></li>
                                                            <li><a href="tourbookingdetail.html">Tour Detail</a></li>
                                                            <li><a href="tourpaymentdetail.html">Tour Payment</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                                <ul class="tg-socialicons">
                                    <li><a href="http://www.facebook.com/Phi.Hoang99"><i class="icon-facebook-logo-outline"></i></a></li>
                                    <li><a href="http://www.instagram.com/danzejr/"><i class="icon-instagram-social-outlined-logo"></i></a></li>
                                    <li><a href="http://twitter.com/PhiHoangVo?"><i class="icon-twitter-social-outlined-logo"></i></a></li>
                                    <li><i><img src="images/icons/icon-01.png" alt="image destinations"> </i><span style="color: white">0389 283 348</span></li>
                                </ul>
                            </div>
                        </div>                
                    </div>
                </div>
            </header>
            <!--************************************
                            Header End
            *************************************-->
            <!--************************************
                                Inner Banner Start
                *************************************-->
            <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
                <div class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h1>Dashboard</h1>
                                <h2><s:property value="%{#session.USER}"/></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--************************************
                            Inner Banner End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->    
            <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div id="tg-twocolumns" class="tg-twocolumns">
                            <form class="tg-formtheme tg-formdashboard">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <aside id="tg-sidebar" class="tg-sidebar">
                                        <div class="tg-widget tg-widgetdashboard">
                                            <div class="tg-widgettitle">
                                                <h3>My Account</h3>
                                            </div>
                                            <div class="tg-widgetcontent">
                                                <ul>
                                                    <li class="selected"><a href="viewProfile"><i class="icon-user"></i><span>Dashboard</span></a></li>
                                                    <li><a href="editProfile"><i class="icon-pen2"></i><span>Edit Profile</span></a></li>
                                                    <li><a href="changePassword.jsp"><i class="icon-lock-open3"></i><span>Change Password</span></a></li>
                                                    <li><a href="viewMyBooking"><i class="icon-basket3"></i><span>My Booking</span></a></li>
                                                    <li><a href="signOut"><i class="icon-lock"></i><span>Sign Out</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                    <div id="tg-content" class="tg-content">
                                        <div class="tg-dashboard">
                                            <div class="tg-box tg-profile">
                                                <div class="tg-heading">
                                                    <h3>My Profile</h3>
                                                    <a class="tg-btnedit" href="editProfile">Edit Profile</a>
                                                </div>
                                                <s:if test="hasActionMessages()">
                                                    <h4 style="text-align: center; color: green;"><s:actionmessage/></h4>
                                                </s:if>
                                                <s:if test="hasActionErrors()">
                                                    <h4 style="text-align: center; color: red;"><s:actionerror/></h4>
                                                </s:if>
                                                <div class="tg-dashboardcontent">
                                                    <figure><img style="width: 87px; height: 87px;" src="<s:property value="%{avatar}"/>" alt="avatar"></figure>
                                                    <div class="tg-content">
                                                        <ul class="tg-liststyle">
                                                            <li><span>Name</span></li>
                                                            <li><span style="text-transform: capitalize"><s:property value="%{firstName}"/> <s:property value="%{lastName}"/></span></li>
                                                            <li><span>Gender</span></li>
                                                            <li><span><s:property value="%{gender}"/></span></li>
                                                            <li><span>Birth Date</span></li>
                                                            <li><span><s:property value="%{birthDate}"/></span></li>
                                                            <li><span>Email Address</span></li>
                                                            <li><span><s:property value="%{email}"/></span></li>
                                                            <li><span>Phone</span></li>
                                                            <li><span><s:property value="%{phone}"/></span></li>
                                                            <li><span>Contact Address</span></li>
                                                            <li><span><s:property value="%{address}"/></span></li>
                                                            <li><span>Job</span></li>
                                                            <li><span><s:property value="%{job == null || job.isEmpty() ? '...' : job}"/></span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
            <%@include file="footer.jsp" %>
    </body>
</html>
