<%-- 
    Document   : nav
    Created on : Mar 28, 2019, 5:11:18 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<s:action name="init"/>
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
                                        <s:url action="viewTourDetails" var="viewTourLink">
                                            <s:param name="id" value="%{id}"/>
                                        </s:url>
                                        <s:a href="%{viewTourLink}">
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
                <s:if test="%{#session.ROLE == null}">
                    <li><a href="loginStaff.jsp">For Staff Only</a></li>
                </s:if>
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
                        <s:if test="%{#session.ROLE == null || #session.ROLE != 'customer'}">
                            <li><a style="line-height: 40px"  id="tg-btnsignin" href="#tg-loginsingup">sign in</a></li>
                        </s:if>
                        <s:else>
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
                                <s:a cssStyle="line-height: 35px" href="viewCart"><img src="images/icons/icon-03.png" alt="Cart image"></s:a>
                                <s:if test="%{#session.CART != null && !#session.CART.isEmpty()}">
                                <div class="tg-cartitems">
                                    <div class="tg-cartlistitems">
                                        <h3>Shopping Cart</h3>         
                                        <s:action name="initCart"/>
                                        <s:iterator value="%{#request.TourCart}" status="counter">
                                        <div class="tg-cartitem">
                                            <figure class="tg-itemimg"><img style="width: 57px; height: 57px;" src="<s:property value="%{titleImage}"/>" alt="image description"></figure>
                                            <div class="tg-contentbox">
                                                <div class="tg-producthead">
                                                    <em>x <s:property value="%{ticketKid + ticketAdult}"/></em>
                                                    <s:url action="viewTourDetails" var="viewTourLink">
                                                        <s:param name="id" value="%{id}"/>
                                                    </s:url>
                                                    <h4><s:a href="%{viewTourLink}"><s:property value="%{name}"/></s:a></h4>
                                                </div>
                                                <span><s:property value="%{fareKid}"/>$ - <s:property value="%{fareAdult}"/>$</span>
                                            </div>
                                        </div>
                                        </s:iterator>
                                        <div class="tg-subtotal">
                                            <h2>Subtotal</h2>
                                            <span><s:property value="%{#request.TotalCart}"/>$</span>
                                        </div>
                                    </div>
                                    <div class="tg-btnarea">
                                        <s:a cssClass="tg-btn" href="viewCart"><span>view cart</span></s:a>
                                    </div>
                                </div>
                                </s:if>
                            </li>
                        </s:else>                        
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
                                                                    <s:url action="viewTourDetails" var="viewTourLink">
                                                                        <s:param name="id" value="%{id}"/>
                                                                    </s:url>
                                                                    <s:a href="%{viewTourLink}">
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
                                            <s:if test="%{#session.ROLE == null}">
                                                <li><a href="loginStaff.jsp">For Staff Only</a></li>
                                            </s:if>
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
