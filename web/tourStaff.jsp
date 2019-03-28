<%-- 
    Document   : tourStaff
    Created on : Mar 25, 2019, 10:31:47 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <%@include file="header.jsp" %>
        <style>
            #datetimepicker1 table tr td,
            #datetimepicker1 table tr th{
                color: black;
            }
        </style>
        <title>Z Tourist Staff - Tours</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
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
                <li><a href="homeStaff.jsp">Home</a></li>
                <li><a href="viewAllDestinationsStaff">Destinations</a>
                    <ul>
                        <s:if test="%{#session.ROLE == 'admin'}">
                        <li><a href="addDestination.jsp">Add new destination</a></li>                    
                        </s:if>
                        <li><a href="link">Search destination</a></li>
                    </ul>
                </li>
                <li><a href="viewAllToursStaff">Tours</a>
                    <s:if test="%{#session.ROLE == 'admin'}">
                    <ul>
                        <li><a href="addTour.jsp">Add new tour</a></li>
                    </ul>
                    </s:if>
                </li>
                <s:if test="%{#session.ROLE == 'guide'}">
                <li><a href="viewAllTasks">Schedule Task</a></li>
                </s:if>
                <s:if test="%{#session.ROLE == 'admin'}">
                <li><a href="viewAllStaffs">Staffs</a>
                    <ul>
                        <li><a href="addStaff.jsp">Add new staff</a></li>
                    </ul>
                </li>
                </s:if>                
                <s:if test="%{#session.ROLE == 'admin'}">
                <li><a href="viewAllCustomers">Customer</a>       
                    <ul>                  
                        <li><a href="viewWaitingBooking">Check Booking</a></li>     
                    </ul>         
                </li>
                </s:if>
                <s:if test="%{#session.ROLE == 'admin'}">
                <li><a href="viewAllSaleCodes">Promotion Codes</a></li>
                </s:if>
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
            <header id="tg-header" class="tg-header tg-headervthree tg-haslayout">
                <div class="container-fluid">
                    <div class="row">
                        <div class="tg-topbar">
                            <nav class="tg-infonav">
                                <ul>
                                    <li>
                                        <i><img src="images/icons/icon-01.png" alt="image destinations"></i>
                                        <span>0389 283 348</span>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tg-addnavcartsearch">
                                <nav class="tg-addnav">
                                    <ul>
                                        <li><a href="javascript:void(0);">about</a></li>
                                        <li><a href="javascript:void(0);">contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="tg-navigationarea tg-headerfixed">
                            <strong class="tg-logo"><a href="homeStaff.jsp"><img src="images/dbzlogo.png" alt="Z Tourist logo"></a></strong>
                            <div class="tg-socialsignin">
                                <ul class="tg-socialicons">
                                    <li><a href="http://www.facebook.com/Phi.Hoang99"><i class="icon-facebook-logo-outline"></i></a></li>
                                    <li><a href="http://www.instagram.com/danzejr/"><i class="icon-instagram-social-outlined-logo"></i></a></li>
                                    <li><a href="http://twitter.com/PhiHoangVo?"><i class="icon-twitter-social-outlined-logo"></i></a></li>
                                </ul>
                                <div class="tg-userbox">
                                    <a id="tg-btnsignin" class="tg-btn" href="#tg-loginsingup"><span>sign in</span></a>
                                    <div class="dropdown tg-dropdown">
                                        <button class="tg-btndropdown" id="tg-dropdowndashboard" type="button" data-toggle="dropdown">
                                            <img style="width: 35px; height: 35px;" src="<s:property value="%{#session.AVA}"/>" alt="avatar">
                                            <span><s:property value="%{#session.USER}"/></span>
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <ul class="dropdown-menu tg-dropdownusermenu" aria-labelledby="tg-dropdowndashboard">
                                            <li><a href="viewProfileStaff">Dashboard</a></li>
                                            <li><a href="editProfileStaff">Edit Profile</a></li>
                                            <li><a href="signOutStaff">Sign Out</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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
                                        <li class="menu-item-has-children"><a href="homeStaff.jsp">Home</a></li>
                                        <li class="menu-item-has-children"><a href="viewAllDestinationsStaff">Destinations</a>
                                            <ul class="sub-menu">
                                                <s:if test="%{#session.ROLE == 'admin'}">
                                                    <li><a href="addDestination.jsp">Add new destination</a></li>                    
                                                    </s:if>
                                                <li><a href="link">Search destination</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="viewAllToursStaff">Tours</a>
                                            <s:if test="%{#session.ROLE == 'admin'}">
                                                <ul class="sub-menu">
                                                    <li><a href="addTour.jsp">Add new tour</a></li>
                                                </ul>
                                            </s:if>
                                        </li>
                                        <s:if test="%{#session.ROLE == 'guide'}">
                                            <li><a href="viewAllTasks">Schedule Task</a></li>
                                        </s:if>
                                        <s:if test="%{#session.ROLE == 'admin'}">
                                            <li class="menu-item-has-children"><a href="viewAllStaffs">Staffs</a>
                                            <s:if test="%{#session.ROLE == 'admin'}">
                                                <ul class="sub-menu">
                                                    <li><a href="addStaff.jsp">Add new staff</a></li>
                                                </ul>
                                            </s:if>
                                            </li>
                                        </s:if>                
                                        <s:if test="%{#session.ROLE == 'admin'}">
                                            <li><a href="viewAllCustomers">Customer</a>     
                                                <ul>                       
                                                    <li><a href="viewWaitingBooking">Check Booking</a></li>       
                                                </ul>     
                                            </li>
                                        </s:if>
                                        <s:if test="%{#session.ROLE == 'admin'}">
                                            <li><a href="viewAllSaleCodes">Promotion Codes</a></li>
                                        </s:if>
                                    </ul>
                                </div>
                            </nav>
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
            <div class="tg-bannerholder">
                <div class="tg-slidercontent">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h1>Experience the Wonder</h1>
                                <h2>People don’t take trips, trips take People</h2>
                                <s:form cssClass="tg-formtheme tg-formtrip" action="searchTourStaff">
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
                                        <div class="form-group" style="height: 50px; margin-top: 10px">
                                            <s:textfield name="idSearch" style="height: 100%; width: 100%; font-size: 14px" placeholder="Tour ID"/>
                                        </div>
                                        <div class="form-group" style="height: 50px; margin-top: 10px">
                                            <s:textfield name="nameSearch" style="height: 100%; width: 100%; font-size: 14px" placeholder="Tour Name"/>
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
                <div id="tg-homeslider" class="tg-homeslider owl-carousel tg-haslayout">
                    <s:if test="%{#request.Ptour != null}">
                        <s:iterator value="%{#request.Ptour}">
                            <figure class="item" data-vide-bg="poster: <s:property value="%{titleImage}"/>" data-vide-options="position: 0% 50%"></figure>
                            </s:iterator>
                        </s:if>
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
                                        <h2>All Tours</h2>
                                    </div>
                                    <s:if test="%{listTour != null}">
                                        <s:if test="%{!listTour.isEmpty()}">
                                            <s:iterator value="%{listTour}">
                                                <div class="tg-populartour tg-populartourvtwo">
                                                    <s:url action="viewTourDetails" var="tourDetails">
                                                        <s:param name="tourID" value="%{id}" />
                                                    </s:url>
                                                    <figure>
                                                        <s:a href="%{tourDetails}"><img style="width: 401px; height: 285px;" src="<s:property value="%{titleImage}"/>" alt="tour image"></s:a>
                                                    </figure>
                                                        <div class="tg-populartourcontent">
                                                            <div class="tg-populartourtitle">
                                                                <h3 style="color: #00aff0"><s:a href="%{tourDetails}"><s:property value="%{name}"/></s:a></h3>
                                                                <br/>
                                                                <h5>
                                                                <s:iterator value="%{listPlace}" status="counter">
                                                                    <s:if test="%{#counter.count > 1}"> - </s:if>
                                                                    <s:property value="%{name}"/> 
                                                                </s:iterator>
                                                            </h5>
                                                        </div>
                                                        <div class="tg-description">
                                                            <p> - <s:property value="%{desc}"/> <s:a cssStyle="text-decoration:none;" href="%{tourDetails}">View more...</s:a></p>
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
                                                            <s:a cssClass="tg-btn" href="%{tourDetails}"><span>View Tour</span></s:a>
                                                            </div>
                                                        </div>
                                                    </div>                                                    
                                            </s:iterator>
                                            <nav class="tg-pagination">
                                                <ul>
                                                    <s:if test="%{totalPages >= 3}"> <%-- if there is 3 or more than 3 pages --%>
                                                        <s:url action="viewAllToursStaff" var="nextPage">
                                                            <s:param name="page" value="%{page + 1}" />
                                                            <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                        </s:url>
                                                        <s:url action="viewAllToursStaff" var="prePage">
                                                            <s:param name="page" value="%{page - 1}" />
                                                            <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                        </s:url>
                                                        <s:if test="%{page == 1}"> <%-- if first page is active --%>
                                                            <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                            <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                                <s:url action="viewAllToursStaff" var="toPage">
                                                                    <s:param name="page" value="%{page + 2}" />
                                                                    <s:param name="skipPage" value="%{skipPage + 10}"/>
                                                                </s:url>
                                                            <li><s:a href="%{toPage}"><s:property value="%{page + 2}"/></s:a></li>
                                                            <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                            </s:if>
                                                            <s:elseif test="%{page == totalPages}"> <%-- if last page is active --%>
                                                                <s:url action="viewAllToursStaff" var="toPage">
                                                                    <s:param name="page" value="%{page - 2}" />
                                                                    <s:param name="skipPage" value="%{skipPage - 10}"/>
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
                                                            <s:url action="viewAllToursStaff" var="nextPage">
                                                                <s:param name="page" value="%{page + 1}" />
                                                                <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                            </s:url>
                                                            <s:url action="viewAllToursStaff" var="prePage">
                                                                <s:param name="page" value="%{page - 1}" />
                                                                <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                            </s:url>
                                                            <s:if test="%{page == 1}"> <%-- if page 1 is active --%>
                                                            <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                            <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                            </s:if>
                                                            <s:else> <%-- if page 2 is active --%>
                                                            <li><s:a href="%{prePage}"><s:property value="%{page - 1}"/></s:a></li>                                 
                                                            <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                            </s:else>
                                                        </s:elseif>
                                                </ul>
                                            </nav>
                                        </s:if>
                                        <s:else>
                                            <h3 style="text-align: center">No tour found!</h3>
                                        </s:else>
                                    </s:if>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!--************************************
                            Main End
            *************************************-->
            <!--************************************
                            Footer Start
            *************************************-->
            <footer id="tg-footer" class="tg-footer tg-haslayout">
                <div class="tg-fourcolumns">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgettext">
                                    <div class="tg-widgettitle">
                                        <h3>About Z Tourist</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <div class="tg-description">
                                            <p>The best tour in the multiverses</p>
                                        </div>
                                        <span>038 928 3348</span>
                                        <a href="mailto:info@ztourist.com">info@ztourist.com</a>
                                        <ul class="tg-socialicons tg-socialiconsvtwo">
                                            <li><a href="http://www.facebook.com/Phi.Hoang99"><i class="icon-facebook-logo-outline"></i></a></li>
                                            <li><a href="http://www.instagram.com/danzejr/"><i class="icon-instagram-social-outlined-logo"></i></a></li>
                                            <li><a href="http://twitter.com/PhiHoangVo?"><i class="icon-twitter-social-outlined-logo"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgettext">
                                    <div class="tg-widgettitle">
                                        <h3>Pages</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <ul>
                                            <li><a href="javascript:void(0);">Home</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgetdestinations">
                                    <div class="tg-widgettitle">
                                        <h3>Address</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <ul>
                                            <li><a href="javascript:void(0);">84/11 Huynh Khuong An, Go Vap, Ho Chi Minh City, Vietnam</a></li>
                                            <li><a href="javascript:void(0);">223 Ba Trieu, District 1, Hanoi, Vietnam</a></li>
                                        </ul>                            
                                    </div>
                                </div>
                            </div>                
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgetnewsletter">
                                    <div class="tg-widgettitle">
                                        <!--                            <h3>Z Tourist was registered to GOV</h3>-->
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <s:a href="http://online.gov.vn/HomePage.aspx"><img src="images/gov_img.png" alt="image destinations"></s:a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tg-footerbar">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <p>Copyright &copy; 2019 ZTourist. All  rights reserved</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--************************************
                            Footer End
            *************************************-->
        </div>
        <!--************************************
                        Wrapper End
        *************************************-->
        <script src="js/vendor/jquery-library.js"></script>
        <script src="js/moment.js"></script>
        <script src="js/moment-with-locales.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/jquery-scrolltofixed.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.mmenu.all.js"></script>
        <script src="js/packery.pkgd.min.js"></script>
        <script src="js/jquery.vide.min.js"></script>
        <script src="js/scrollbar.min.js"></script>
        <script src="js/prettyPhoto.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/main.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            /* -------------------------------------
             Datetimepicker
             -------------------------------------- */
            $(function () {
                $('#datetimepicker1').datetimepicker({
                    showTodayButton: true,
                    format: 'Y-MM-DD HH:mm:ss'
                });
            });

            $('#datetimepicker2').mousedown(function () {
                $('#datetimepicker1').data('DateTimePicker').show();
            });
            $("#datetimepicker2").attr("placeholder", "From Date");

            /* -------------------------------------
             PRETTY PHOTO GALLERY
             -------------------------------------- */
            jQuery("a[data-rel]").each(function () {
                jQuery(this).attr("rel", jQuery(this).data("rel"));
            });
            jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({
                animation_speed: 'normal',
                theme: 'dark_square',
                slideshow: 3000,
                autoplay_slideshow: false,
                social_tools: false
            });

            /* ---------------------------------------
             MOBILE MENU
             --------------------------------------- */
            jQuery("#menu").mmenu({
                extensions: [
                    "border-full",
                    "pagedim-black"
                ]
            });
        </script>
    </body>
</html>
