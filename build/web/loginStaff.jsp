<%-- 
    Document   : loginStaff
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
        <style>
            .tg-btn-lg:hover {
                background-color: black;
            }
            .tg-formlogin label.error {
                color: white !important;
            }
            .form-group label {
                color: white;
            }
        </style>
        <title>Z Tourist - Staff Login</title>
    </head>
    <body class="tg-home tg-homevthree tg-login" style="background-image: url(images/Citybynightbr.jpg); background-repeat: no-repeat; background-size: auto">
        <div class="tg-navigationarea tg-headerfixed" style="background-color: transparent">
            <strong class="tg-logo"><a href="index.html"><img src="images/dbzlogo.png" alt="company logo here"></a></strong>
        </div>
        <!--************************************
                        Main Start
        *************************************--> 
        <h1 style="text-align: center; font-weight: bold; color: white">Welcome to Z Tourist Staff</h1>
        <main id="tg-main" class="tg-main tg-haslayout" style="padding: 15%">
            <s:if test="hasActionMessages()">
                <h4 style="text-align: center; color: green; padding-top: 4%;"><s:actionmessage/></h4>
            </s:if>
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <s:form cssClass="tg-formtheme tg-formlogin checkValidate" action="signInStaff">
                <fieldset>
                    <div class="form-group">
                        <label>Username<sup style="color: red">*</sup></label>
                        <s:textfield cssClass="form-control" name="username" placeholder="" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Password <sup style="color: red">*</sup></label>
                        <s:password cssClass="form-control" name="password" placeholder="" required="true"/>
                    </div>
                    <div class="form-group">
                        <div class="tg-checkbox">
                        </div>
                        <span><a href="#">Lost your password?</a></span>
                    </div>
                    <button class="tg-btn tg-btn-lg" type="submit"><span>Sign In</span></button>
                </fieldset>
            </s:form>
        </main>
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
        <script src="js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".checkValidate").each(function () {

                    $(this).validate({
                        rules: {
                            username: {
                                required: true,
                                rangelength: [4, 30]
                            },
                            password: {
                                required: true,
                                rangelength: [6, 30]
                            }
                        },
                        messages: {
                            username: {
                                required: "Please enter your user name",
                                rangelength: "Username must be 4 to 30 characters long"
                            },
                            password: {
                                required: "Please provide a password",
                                rangelength: "Password must be from 6 to 30 characters long"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>

