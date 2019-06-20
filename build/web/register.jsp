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
        <%@include file="nav.jsp" %>
        <%@include file="slider.jsp" %>
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

                            <%--<a class="forgot" href="#">Forgot password?</a>--%>

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
            $('#username').keyup(function () {
                if (u.toString().toLowerCase() === $('#username').val().toString().toLowerCase()) {
                    $('#userV > .errorMessage').show();
                } else {
                    $('#userV > .errorMessage').hide();
                }
            });
            $('#email').keyup(function () {
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
                                required: "Please enter your username",
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

