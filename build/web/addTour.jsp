<%-- 
    Document   : addDestination
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
            .checkValidate label.error, .checkValidate sup, .checkValidate .errorMessage {
                color: red !important;
                font-size: 12px !important;
            }
            .checkValidate .form-group li {
                list-style: none;
            }
            .checkValidate .form-group {
                clear: none;
            }
        </style>
        <title>Z Tourist Staff - New Tour</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <s:action name="initStaff"/>
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
                                        <li class="menu-item-has-children current-menu-item"><a href="viewAllToursStaff">Tours</a>
                                            <s:if test="%{#session.ROLE == 'admin'}">
                                                <ul class="sub-menu">
                                                    <li class="current-menu-item"><a href="addTour.jsp">Add new tour</a></li>
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
            <main id="tg-main" class="tg-main tg-haslayout">
                <s:if test="hasActionErrors()">
                    <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
                </s:if>
                <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="addTour" method="POST" enctype="multipart/form-data">
                    <div class="tg-imgholder" style="width: 100%; height: 10%">
                        <center>
                        <figure><img id="imgTitle" style="height: 100%; width: 80%" src="<s:if test="%{titleImage != null}"><s:property value="%{titleImage}"/></s:if><s:else>images/tours/default.jpg</s:else>" alt="Tour Image"></figure>
                        <s:file id="titleImg" cssStyle="display: none" name="photo"/>
                        <a class="tg-btn" href="javascript:void(0);" onclick="$('#titleImg').click();">Choose Tour Image</a>
                        </center>
                    </div>
                    <div style="padding: 10%">                        
                        <div class="form-group" id="idV">
                            <label>Tour ID <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="id" id="id" value="%{id}" required="true"/>
                            <s:fielderror fieldName="id"/>
                        </div>
                        <div class="form-group">
                            <label>Tour Name <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="name" value="%{name}" required="true"/>
                        </div>
                        <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>From Date <sup>*</sup></label>
                            <s:textfield id="fromDatePicker" cssClass="form-control" name="fromDate" value="%{fromDate}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>To Date <sup>*</sup></label>
                            <s:textfield id="toDatePicker" cssClass="form-control" name="toDate" value="%{toDate}" required="true"/>
                        </div>
                        </div>
                        <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>Adult Fare <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="fareAdult" value="%{fareAdult}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Kid Fare <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="fareKid" value="%{fareKid}" required="true"/>
                        </div>
                        </div>
                        <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>Minimum Guest <sup>*</sup></label>
                            <s:textfield id="minGuest" cssClass="form-control" name="minGuest" value="%{minGuest}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Maximum Guest <sup>*</sup></label>
                            <s:textfield id="maxGuest" cssClass="form-control" name="maxGuest" value="%{maxGuest}" required="true"/>
                        </div>
                        </div>
                        <div class="form-group">
                            <label>Transport <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="transport" value="%{transport}" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Description </label>
                            <s:textarea cssClass="form-control" name="des" value="%{des}"/>
                        </div>
                        <div class="form-group">
                            <h3 style="font-weight: bold">Destinations: </h3>
                        </div>
                        <div class="form-group" style="width: 48%">
                            <label>Departure <sup>*</sup></label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Departure" data-live-search="true" list="%{#request.Dest}" name="departure" required="true"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Destination 1 <sup>*</sup></label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 1" data-live-search="true" list="%{#request.Dest}" name="destination1" required="true"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%">
                            <label>Destination 2 </label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 2" data-live-search="true" list="%{#request.Dest}" name="destination2"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Destination 3 </label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 3" data-live-search="true" list="%{#request.Dest}" name="destination3"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <h3 style="font-weight: bold">Guides: </h3>
                        </div>    
                        <div class="form-group" style="width: 48%">
                            <label>Guide 1 <sup>*</sup></label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 1" data-live-search="true" list="%{#request.Guide}" name="guide1" required="true"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Guide 2 </label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 2" data-live-search="true" list="%{#request.Guide}" name="guide2"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%">
                            <label>Guide 3 </label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 3" data-live-search="true" list="%{#request.Guide}" name="guide3"/>
                            </div>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Guide 4 </label>
                            <div>
                                <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 4" data-live-search="true" list="%{#request.Guide}" name="guide4"/>
                            </div>
                        </div>
                    <center>
                        <button class="tg-btn" type="submit"><span>Add Tour</span></button>
                    </center>                       
                    </div>
                </s:form>
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
        <script src="js/countrypicker.min.js"></script>
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
            
            $('#fromDatePicker').datetimepicker({
                format: 'Y-MM-DD HH:mm:ss'
            });
            $('#toDatePicker').datetimepicker({
                useCurrent: false,
                format: 'Y-MM-DD HH:mm:ss'
            });
            $("#fromDatePicker").on("dp.change", function (e) {
                $('#toDatePicker').data("DateTimePicker").minDate(e.date);
            });
            $("#toDatePicker").on("dp.change", function (e) {
                $('#fromDatePicker').data("DateTimePicker").maxDate(e.date);
            });
            
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
        <script type="text/javascript">

                $('#titleImg').change(function () { //show preview avatar
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#imgTitle').attr('src', e.target.result);
                        },
                        reader.readAsDataURL(this.files[0]);
                    }
                });
                
                var u = $('#id').val();
                $('#id').change(function () {
                    if (u.toString().toLowerCase() === $('#id').val().toString().toLowerCase()) {
                        $('#idV > .errorMessage').show();
                    } else {
                        $('#idV > .errorMessage').hide();
                    }
                });
                
                $.validator.addMethod("price", function (value, element) { //validate price
                    return this.optional(element) || /^(\d{1,18})(\.\d{1,2})*?$/.test(value);;
                });
                $.validator.addMethod("selected", function (value, element) {
                    return this.optional(element) || value !== '-1';;
                });
                $.validator.addMethod("ge", function (value, element, param) {
                    return this.optional(element) || parseInt(value) >= parseInt($(param).val());
                });
                $.validator.addMethod("le", function (value, element, param) {
                    return this.optional(element) || parseInt(value) <= parseInt($(param).val());
                });
                                
                $(document).ready(function () {
                    $(".checkValidate").each(function () {

                        $(this).validate({
                            rules: {
                                id: {
                                    required: true,
                                    maxlength: 30
                                },
                                name: {
                                    required: true,
                                    maxlength: 100
                                },
                                fromDate: {
                                    required: true
                                },
                                toDate: {
                                    required: true
                                },
                                des: {
                                    maxlength: 200
                                },
                                fareAdult: {
                                    required: true,
                                    price: true
                                },
                                fareKid: {
                                    required: true,
                                    price: true
                                },
                                transport: {
                                    required: true,
                                    maxlength: 50
                                },
                                minGuest: {
                                    required: true,
                                    number: true,
                                    range: [0, 100],
                                    le: "#maxGuest"
                                },
                                maxGuest: {
                                    required: true,
                                    number: true,
                                    range: [1, 100],
                                    ge: "#minGuest"
                                },
                                departure: {
                                    selected: true
                                },
                                destination1: {
                                    selected: true
                                },
                                guide1: {
                                    selected: true
                                }
                            },
                            messages: {
                                id: {
                                    required: "Please enter tour ID",
                                    maxlength: "Tour ID must not be greater than 30 characters long"
                                },
                                name: {
                                    required: "Please enter tour name",
                                    maxlength: "Tour name must not be greater than 50 characters long"
                                },
                                fromDate: {
                                    required: "Please choose when tour start"
                                },
                                toDate: {
                                    required: "Please choose when tour end"
                                },
                                des: {
                                    maxlength: "Description must not be greater than 200 characters long"
                                },
                                fareAdult: {
                                    required: "Please enter adult fare",
                                    price: "Adult fare must be a float number with maximum 2 decimal places"
                                },
                                fareKid: {
                                    required: "Please enter kid fare",
                                    price: "Kid fare must be a float number with maximum 2 decimal places"
                                },
                                transport: {
                                    required: "Please enter the transport of this tour",
                                    maxlength: "Transport must not be greater than 50 characters long"
                                },
                                minGuest: {
                                    required: "Please enter minimum guest of this tour",
                                    number: "Minimum guest must be a number",
                                    range: "Minimum guest must be in range from 0 to 100",
                                    le: "Minimum guest must be lesser or equals to maximum guest"
                                },
                                maxGuest: {
                                    required: "Please enter maximum guest of this tour",
                                    number: "Maximum guest must be a number",
                                    range: "Maximmum guest must be in range from 1 to 100",
                                    ge: "Maximum guest must be greater or equals to minimum guest"
                                },
                                departure: {
                                    selected: "Please select departure of this tour"
                                },
                                destination1: {
                                    selected: "Please select the destination of this tour"
                                },
                                guide1: {
                                    selected: "Please select tour guide"
                                }
                            }
                        });
                    });
                });
            </script>
    </body>
</html>
