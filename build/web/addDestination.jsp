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
            .countrypicker li{
                list-style: none;
            }
        </style>
        <title>Z Tourist Staff - New Destination</title>
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
                <li><a href="viewAllTour">Tours</a>
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
                <li><a href="checkBooking">Check Booking</a></li>
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
                                        <li class="menu-item-has-children current-menu-item"><a href="viewAllDestinationsStaff">Destinations</a>
                                            <ul class="sub-menu">
                                                <s:if test="%{#session.ROLE == 'admin'}">
                                                <li class="current-menu-item"><a href="addDestination.jsp">Add new destination</a></li>                    
                                                </s:if>
                                                <li><a href="link">Search destination</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="viewAllTour">Tours</a>
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
                                            <li><a href="checkBooking">Check Booking</a></li>
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
                <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="addDestination" enctype="multipart/form-data">
                    <div class="tg-imgholder" style="width: 100%; height: 10%">
                        <center>
                        <figure><img id="imgTitle" style="height: 100%; width: 80%" src="<s:if test="%{titleImage != null}"><s:property value="%{titleImage}"/></s:if><s:else>images/places/default.jpg</s:else>" alt="Destination Image"></figure>
                        <s:file id="titleImg" cssStyle="display: none" name="photo"/>
                        <a class="tg-btn" href="javascript:void(0);" onclick="$('#titleImg').click();">Choose Destination Image</a>
                        </center>
                    </div>
                    <div style="padding: 10%">                        
                        <div class="form-group" id="idV">
                            <label>Destination ID <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="id" id="id" value="%{id}" required="true"/>
                            <s:fielderror fieldName="id"/>
                        </div>
                        <div class="form-group">
                            <label>Destination Name <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="name" value="%{name}" required="true"/>
                        </div>
                        <div class="form-group">
                            <label>Country <sup>*</sup></label>
                            <div>
                                <s:select cssClass="form-control selectpicker countrypicker" data-flag="true" data-default="Viet Nam" data-live-search="true" list="#@java.util.LinkedHashMap@{}" name="country"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Description </label>
                            <s:textarea cssClass="form-control" name="des"/>
                        </div>
                        <center>
                        <button class="tg-btn" type="submit"><span>Add Destination</span></button>
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
                                des: {
                                    maxlength: 200
                                }
                            },
                            messages: {
                                id: {
                                    required: "Please enter destination ID",
                                    maxlength: "Destination ID must not be greater than 30 characters long"
                                },
                                name: {
                                    required: "Please enter destination name",
                                    maxlength: "First name must not be greater than 50 characters long"
                                },
                                des: {
                                    maxlength: "Description must not be greater than 200 characters long"
                                }
                            }
                        });
                    });
                });
            </script>
    </body>
</html>
