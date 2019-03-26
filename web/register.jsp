<%-- 
    Document   : register
    Created on : Mar 19, 2019, 7:47:01 AM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <link rel="stylesheet" href="css/registerform.css">
        <title>Z Tourist - <s:property value="%{reg}"/></title>
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
                <li><s:a href="index.jsp">Home</s:a>
                    </li>
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
                                <li><a style="line-height: 40px"  id="tg-btnsignin" href="#tg-loginsingup">sign in</a></li>
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
                                            <li class="menu-item-has-children"><a href="javascript:void(0);">Home</a></li>
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
                                            <s:hidden name="page" value="1" />
                                            <s:hidden name="skipPage" value="0" />
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
            <main id="tg-main" class="tg-main tg-haslayout">
                <s:if test="hasActionMessages()">
                    <h4 style="text-align: center; color: green; padding-top: 4%;"><s:actionmessage/></h4>
                </s:if>
                <s:if test="hasActionErrors()">
                    <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
                </s:if>
                <div class="register-form">
                    <ul class="tab-group clearfix">
                        <s:if test="%{reg == 'Sign Up'}">                        
                            <li class="tab" id="sin"><a href="#signin">Sign In</a></li>
                            <li class="tab active"><a href="#signup">Sign Up</a></li>
                            </s:if>
                            <s:else>                        
                            <li class="tab active" id="sin"><a href="#signin">Sign In</a></li>
                            <li class="tab"><a href="#signup">Sign Up</a></li>
                            </s:else>
                    </ul>
                    <div class="tab-content">
                        <div id="signup">   
                            <h1>Register</h1>
                            <s:form cssClass="checkValidate" action="signUp_register">
                                <div class="form-group" id="userV" style="width: 45%; float: left">
                                    <label for="username">Username</label>
                                    <s:textfield cssClass="form-control" name="username" id="username" placeholder="Username" required="true"/>
                                    <s:fielderror fieldName="username"/>
                                </div>

                                <div class="form-group" style="width: 45%; float: right; margin-top: 3%">
                                    <label class="radio-inline"><s:radio name="gender" list="#@java.util.LinkedHashMap@{'Male':'Male', 'Female':'Female', 'Others':'Others'}"/></label>
                                    <label for="gender" class="error" style="display:none;"></label>
                                </div>

                                <div class="form-group" style="clear: both; width: 45%; float: left">
                                    <label for="firstname">First Name</label>
                                    <s:textfield cssClass="form-control" name="firstName" id="firstname" placeholder="First Name" required="true"/>
                                </div>

                                <div class="form-group" style="width: 45%; float: right">
                                    <label for="lastname">Last Name</label>
                                    <s:textfield cssClass="form-control" name="lastName" id="lastname" placeholder="Last Name" required="true"/>
                                </div>

                                <div class="form-group" style="clear: both; width: 45%; float: left">
                                    <label for="yob">Birth date</label>
                                    <div class="input-group date" id="datetimepicker3">
                                        <s:textfield name="birthDate" id="yob" cssClass="form-control" title="Birth Date" placeholder="Birth Date" required="true"/>                                    
                                    </div>
                                </div>

                                <div class="form-group" style="width: 50%; float: right;">
                                    <label for="address">Address</label>
                                    <s:textfield cssClass="form-control" name="address" id="address" placeholder="" required="true"/>
                                </div>

                                <div class="form-group" id="emailV" style="clear: both">
                                    <label for="email">Email</label>
                                    <s:textfield type="email" cssClass="form-control" name="email" id="email" placeholder="email@example.com" required="true"/>
                                    <s:fielderror fieldName="email"/>
                                </div>

                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <s:textfield type="tel" name="phone" cssClass="form-control" id="phone" placeholder="" required="true"/>
                                </div>

                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <s:password name="password" cssClass="form-control" id="Password" placeholder="Password" required="true"/>
                                </div>

                                <div class="form-group">
                                    <label for="CfPassword">Confirm Password</label>
                                    <s:password name="cfpassword" cssClass="form-control" id="CfPassword" placeholder="Password" required="true"/>
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="termCheck" name="termCheck" required>
                                    <label class="form-check-label" for="termCheck">&ensp;I agree to the <a href="#termModal" data-toggle="modal">Terms & Privacy</a></label>
                                    <label for="termCheck" class="error" style="padding-right: 55%; float: left; display:none;"></label>
                                </div>
                                <!--                             Modal 
                                                            <div class="modal fade" id="termModal" tabindex="-1" role="dialog" aria-labelledby="termModalTitle" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h2 class="modal-title" id="termModalTitle">
                                                                                Terms & Privacy<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                            </h2>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <p>Conditions of Use<br>
                                                                                Last updated: May 21, 2018</p>
                                
                                                                            <p>Welcome to Amazon.com. Amazon Services LLC and/or its affiliates ("Amazon") provide website features and other products and services to you when you visit or shop at Amazon.com, use Amazon products or services, use Amazon applications for mobile, or use software provided by Amazon in connection with any of the foregoing (collectively, "Amazon Services"). Amazon provides the Amazon Services subject to the following conditions.</p>
                                
                                                                            <p>By using Amazon Services, you agree to these conditions. Please read them carefully.
                                                                                We offer a wide range of Amazon Services, and sometimes additional terms may apply. When you use an Amazon Service (for example, Your Profile, Gift Cards, Amazon Video, Your Media Library, Amazon devices, or Amazon applications) you also will be subject to the guidelines, terms and agreements applicable to that Amazon Service ("Service Terms"). If these Conditions of Use are inconsistent with the Service Terms, those Service Terms will control.</p>
                                
                                                                            <p>PRIVACY<br>
                                                                                Please review our Privacy Notice, which also governs your use of Amazon Services, to understand our practices.</p>
                                
                                                                            <p>ELECTRONIC COMMUNICATIONS<br>
                                                                                When you use Amazon Services, or send e-mails, text messages, and other communications from your desktop or mobile device to us, you may be communicating with us electronically. You consent to receive communications from us electronically, such as e-mails, texts, mobile push notices, or notices and messages on this site or through the other Amazon Services, such as our Message Center, and you can retain copies of these communications for your records. You agree that all agreements, notices, disclosures, and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.</p>
                                
                                                                            <p>COPYRIGHT<br>
                                                                                All content included in or made available through any Amazon Service, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software is the property of Amazon or its content suppliers and protected by United States and international copyright laws. The compilation of all content included in or made available through any Amazon Service is the exclusive property of Amazon and protected by U.S. and international copyright laws.</p>
                                
                                                                            <p>TRADEMARKS<br>
                                                                                Click here to see a non-exhaustive list of Amazon trademarks. In addition, graphics, logos, page headers, button icons, scripts, and service names included in or made available through any Amazon Service are trademarks or trade dress of Amazon in the U.S. and other countries. Amazon's trademarks and trade dress may not be used in connection with any product or service that is not Amazon's, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits Amazon. All other trademarks not owned by Amazon that appear in any Amazon Service are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by Amazon.</p>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">I've read</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>-->

                                <button type="submit" class="regbtn">Sign Up</button>
                            </s:form>

                        </div>

                        <div id="signin">
                            <h1>Welcome Back!</h1>
                            <s:form cssClass="checkValidate" action="signIn">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <s:textfield cssClass="form-control" name="username" id="username" placeholder="Username" required="true"/>
                                </div>

                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <s:password name="password" cssClass="form-control" id="Password" placeholder="Password" required="true"/>
                                </div>

                                <a class="forgot" href="#">Forgot password?</a>

                                <button type="submit" class="regbtn">Sign In</button>
                            </s:form>
                        </div>
                    </div><!-- tab-content -->
                </div>
            </main>
            <%@include file="footer.jsp" %>
            <script src="js/registerswitch.js"></script>
            <script type="text/javascript">
                $(function () {
                    $('#datetimepicker3').datetimepicker({
                        format: 'YYYY-MM-DD'
                    });
                });
                $('#yob').mousedown(function () {
                    $('#datetimepicker3').data('DateTimePicker').show();
                });

                var u = $('#username').val();
                var e = $('#email').val();
                $('#username').change(function () {
                    if (u.toString().toLowerCase() === $('#username').val().toString().toLowerCase()) {
                        $('#userV > .errorMessage').show();
                    } else {
                        $('#userV > .errorMessage').hide();
                    }
                });
                $('#email').change(function () {
                    if (u.toString().toLowerCase() === $('#email').val().toString().toLowerCase()) {
                        $('#emailV > .errorMessage').show();
                    } else {
                        $('#emailV > .errorMessage').hide();
                    }
                });

                if ($('#sin').hasClass('active')) {
                    $('#signup').hide();
                    $('#signin').show();
                }
                $('html, body').animate({
                    scrollTop: $('.register-form').offset().top
                }, 500, 'linear');
                $(document).ready(function () {
                    //sua lai ham xac dinh loi email de email chi valid khi co ca dau cham sau @ va sau dau cham chi co 2 chu
                    $.validator.methods.email = function (value, element) {
                        return this.optional(element) || /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value);
                    };
                    $.validator.addMethod("maxDate", function (value, element) {
                        var now = new Date();
                        var myDate = new Date(value);
                        return this.optional(element) || now.getFullYear() - myDate.getFullYear() >= 12;
                    });
                    $(".checkValidate").each(function () {

                        $(this).validate({
                            rules: {
                                username: {
                                    required: true,
                                    rangelength: [4, 30]
                                },
                                lastName: {
                                    required: true,
                                    maxlength: 50
                                },
                                firstName: {
                                    required: true,
                                    maxlength: 50
                                },
                                birthDate: {
                                    required: true,
                                    maxDate: true
                                },
                                address: {
                                    required: true,
                                    maxlength: 200
                                },
                                phone: {
                                    required: true,
                                    rangelength: [9, 30]
                                },
                                password: {
                                    required: true,
                                    rangelength: [6, 30]
                                },
                                cfpassword: {
                                    required: true,
                                    rangelength: [6, 30],
                                    equalTo: "#Password"
                                },
                                email: {
                                    required: true,
                                    email: true
                                },
                                termCheck: "required",
                                gender: "required"
                            },
                            messages: {
                                username: {
                                    required: "Please enter your user name",
                                    rangelength: "Username must be 4 to 30 characters long"
                                },
                                lastName: {
                                    required: "Please enter your last name",
                                    maxlength: "Last name must not be greater than 50 characters long"
                                },
                                firstName: {
                                    required: "Please enter your first name",
                                    maxlength: "First name must not be greater than 50 characters long"
                                },
                                birthDate: {
                                    required: "Please choose your date of birth",
                                    maxDate: "Your age must be from 12 year olds"
                                },
                                address: {
                                    required: "Please enter your address",
                                    maxlength: "Address must not be greater than 200 characters long"
                                },
                                phone: {
                                    required: "Please enter your phone number",
                                    rangelength: "Phone number must be from 9 to 30 characters long"
                                },
                                password: {
                                    required: "Please provide a password",
                                    rangelength: "Password must be from 6 to 30 characters long"
                                },
                                cfpassword: {
                                    required: "Please confirm your password",
                                    rangelength: "Confirm password must be from 6 to 30 characters long",
                                    equalTo: "Password mismatch"
                                },
                                email: {
                                    required: "Please enter your email",
                                    email: "Invalid email"
                                },
                                termCheck: "Please accept Terms & Privacy to continue",
                                gender: "Please choose your gender"
                            }
                        });
                    });
                });
            </script>
    </body>
</html>

