<%-- 
    Document   : searchTour
    Created on : Mar 17, 2019, 12:50:09 AM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <title>Z Tourist - Search</title>
    </head>
    <body class="tg-home tg-homevtwo">
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
                                </s:else>
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
            <!--************************************
                            Home Slider Start
            *************************************-->
            <div id="tg-homebannerslider" class="tg-homebannerslider tg-haslayout">
                <div id="tg-homeslider" class="tg-homeslider tg-homeslidervtwo owl-carousel tg-haslayout">
                    <s:if test="%{#request.Ptour != null}">
                        <s:iterator value="%{#request.Ptour}">
                            <figure class="item" data-vide-bg="poster: <s:property value="%{titleImage}"/>" data-vide-options="position: 0% 50%">
                                <figcaption>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
                                                <div class="tg-slidercontent">
                                                    <h1>Planning a Trip to <s:iterator value="%{listPlace}" status="counter"><s:if test="%{#counter.count > 2}">, </s:if><s:if test="%{#counter.count > 1}"><s:property value="%{name}"/></s:if></s:iterator>?</h1>
                                                            <h2>You Choose the Adventure We make it happen</h2>
                                                    <s:a cssClass="tg-btn" href="tourbookingdetail.jsp"><span>Explore Tour</span></s:a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                        </s:iterator>
                    </s:if>                        
                </div>
                <div class="tg-findtour">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <s:form cssClass="tg-formtheme tg-formtrip" action="searchTour">
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="destSearch" headerKey="-1" headerValue="Destinations" list="%{#request.Dest}" data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group date" id="datetimepicker1" style="height: 50px">
                                                <s:textfield name="dateSearch" id="datetimepicker2" cssClass="form-control" title="From Date" style="height: 100%; font-size: 14px" required="true"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="durationSearch" headerKey="-1" headerValue="Duration" 
                                                          list="#@java.util.LinkedHashMap@{2:'Below or in 2 Days', 5:'Below or in 5 Days', 7:'Below or in 1 Weeks', 8:'More than 1 week'}" 
                                                          data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>							
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="priceSearch" headerKey="-1" headerValue="Price" 
                                                          list="#@java.util.LinkedHashMap@{1:'Below 50$', 2:'50$ - 250$', 3:'250$ - 500$', 4:'500$ - 1000$',
                                                          5:'1000$ - 1500$', 6:'1500$ - 2000$', 7:'2000$ - 2500$', 8:'Upper 2500$'}" 
                                                          data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="tg-btn" type="submit"><span>find tours</span></button>
                                        </div>
                                    </fieldset>
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--************************************
                            Home Slider End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************--> 
        <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout tg-bglight">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="tg-content" class="tg-content">
                            <div class="tg-listing tg-listingvthree">
                                <div class="tg-sectiontitle">
                                    <h2>Search Result</h2>
                                </div>
                                <s:if test="%{listTour != null}">
                                    <s:if test="%{!listTour.isEmpty()}">
                                        <s:iterator value="%{listTour}">
                                            <div class="tg-populartour tg-populartourvtwo">                                      
                                                <figure>
                                                    <s:a href="tourbookingdetail.jsp"><img style="width: 401px; height: 285px;" src="<s:property value="%{titleImage}"/>" alt="image destinations"></s:a>
                                                    </figure>
                                                    <div class="tg-populartourcontent">
                                                        <div class="tg-populartourtitle">
                                                            <h3 style="color: #00aff0"><s:a href="tourbookingdetail.jsp"><s:property value="%{name}"/></s:a></h3>
                                                            <br/>
                                                            <h5>
                                                            <s:iterator value="%{listPlace}" status="counter">
                                                                <s:if test="%{#counter.count > 1}"> - </s:if>
                                                                <s:property value="%{name}"/> 
                                                            </s:iterator>
                                                        </h5>
                                                    </div>
                                                    <div class="tg-description">
                                                        <p> - <s:property value="%{desc}"/> <s:a cssStyle="text-decoration:none;" href="toorbookingdetail.jsp">View more...</s:a></p>
                                                        </div>
                                                        <div class="tg-populartourfoot">
                                                            <div class="tg-durationrating">
                                                                <span class="tg-tourduration"><s:property value="%{duration}"/> Day(s)</span>
                                                            <p>Transport: <s:property value="%{transport}"/></p>                                                                                                                                  
                                                        </div>
                                                    </div>
                                                    <div class="tg-priceavailability">
                                                        <div class="tg-availhead">
                                                            <time><s:property value="%{fromDate}"/> - <s:property value="%{toDate}"/></time>
                                                        </div>
                                                        <div class="tg-pricearea">
                                                            <span>From</span>
                                                            <h4><s:property value="%{fareAdult}"/>$</h4>
                                                        </div>
                                                        <s:a cssClass="tg-btn" href="tourbookingdetail.jsp"><span>Explore Tour</span></s:a>
                                                    </div>
                                                </div>
                                            </div>                                                    
                                        </s:iterator>
                                        <nav class="tg-pagination">
                                            <ul>
                                                <s:if test="%{totalPages >= 3}"> <%-- if there is 3 or more than 3 pages --%>
                                                    <s:url action="searchTour" var="nextPage">
                                                        <s:param name="page" value="%{page + 1}" />
                                                        <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                        <s:param name="destSearch" value="%{destSearch}"/>
                                                        <s:param name="dateSearch" value="%{dateSearch}"/>
                                                        <s:param name="durationSearch" value="%{durationSearch}"/>
                                                        <s:param name="priceSearch " value="%{priceSearch}"/>
                                                    </s:url>
                                                    <s:url action="searchTour" var="prePage">
                                                        <s:param name="page" value="%{page - 1}" />
                                                        <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                        <s:param name="destSearch" value="%{destSearch}"/>
                                                        <s:param name="dateSearch" value="%{dateSearch}"/>
                                                        <s:param name="durationSearch" value="%{durationSearch}"/>
                                                        <s:param name="priceSearch " value="%{priceSearch}"/>
                                                    </s:url>
                                                    <s:if test="%{page == 1}"> <%-- if first page is active --%>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                        <s:url action="searchTour" var="toPage">
                                                            <s:param name="page" value="%{page + 2}" />
                                                            <s:param name="skipPage" value="%{skipPage + 10}"/>
                                                            <s:param name="destSearch" value="%{destSearch}"/>
                                                            <s:param name="dateSearch" value="%{dateSearch}"/>
                                                            <s:param name="durationSearch" value="%{durationSearch}"/>
                                                            <s:param name="priceSearch " value="%{priceSearch}"/>
                                                        </s:url>
                                                        <li><s:a href="%{toPage}"><s:property value="%{page + 2}"/></s:a></li>
                                                        <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                    </s:if>
                                                    <s:elseif test="%{page == totalPages}"> <%-- if last page is active --%>
                                                        <s:url action="searchTour" var="toPage">
                                                            <s:param name="page" value="%{page - 2}" />
                                                            <s:param name="skipPage" value="%{skipPage - 10}"/>
                                                            <s:param name="destSearch" value="%{destSearch}"/>
                                                            <s:param name="dateSearch" value="%{dateSearch}"/>
                                                            <s:param name="durationSearch" value="%{durationSearch}"/>
                                                            <s:param name="priceSearch " value="%{priceSearch}"/>
                                                        </s:url>    
                                                        <li class="tg-prevpage"><s:a href="%{toPage}"><i class="fa fa-angle-left"></i></s:a></li>
                                                        <li><s:a href="%{toPage}"><s:property value="%{page - 2}"/></s:a></li>                                                
                                                        <li><s:a href="%{prePage}"><s:property value="%{page - 1}"/></s:a></li>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                    </s:elseif>
                                                    <s:else> <%-- if neither first and last page is active --%>
                                                    <li class="tg-prevpage"><s:a href="%{prePage}"><i class="fa fa-angle-left"></i></s:a></li>
                                                        <li><s:a href="%{prevPage}"><s:property value="%{page - 1}"/></s:a></li>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                        <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                    </s:else>
                                                </s:if>
                                                <s:elseif test="%{totalPages == 1}"> <%-- else if only one page show --%>
                                                    <li class="tg-active"><s:a href="javascript:void(0);">1</s:a></li>
                                                </s:elseif>
                                                <s:elseif test="%{totalPages == 2}"> <%-- else if only two pages show --%>
                                                    <s:url action="searchTour" var="nextPage">
                                                        <s:param name="page" value="%{page + 1}" />
                                                        <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                        <s:param name="destSearch" value="%{destSearch}"/>
                                                        <s:param name="dateSearch" value="%{dateSearch}"/>
                                                        <s:param name="durationSearch" value="%{durationSearch}"/>
                                                        <s:param name="priceSearch " value="%{priceSearch}"/>
                                                    </s:url>
                                                    <s:url action="searchTour" var="prePage">
                                                        <s:param name="page" value="%{page - 1}" />
                                                        <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                        <s:param name="destSearch" value="%{destSearch}"/>
                                                        <s:param name="dateSearch" value="%{dateSearch}"/>
                                                        <s:param name="durationSearch" value="%{durationSearch}"/>
                                                        <s:param name="priceSearch " value="%{priceSearch}"/>
                                                    </s:url>
                                                    <s:if test="%{page == 1}"> <%-- if page 1 is active --%>
                                                    <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                    <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                    </s:if>
                                                    <s:else> <%-- if page 2 is active --%>
                                                        <li><s:a href="%{prePage}"><s:property value="%{page - 1}"/></s:a></li>                                 
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page - 1}"/></s:a></li>
                                                    </s:else>
                                                </s:elseif>
                                            </ul>
                                        </nav>
                                    </s:if>
                                </s:if>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
