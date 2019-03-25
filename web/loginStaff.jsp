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
        <title>Z Tourist - Staff Login</title>
    </head>
    <body class="tg-home tg-homevone">
        <!--************************************
                                Inner Banner Start
                *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1>Welcome back</h1>
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
        <main id="tg-main" class="tg-main tg-haslayout" style="padding: 15%">
            <s:if test="hasActionMessages()">
                <h4 style="text-align: center; color: green; padding-top: 4%;"><s:actionmessage/></h4>
            </s:if>
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
                <s:form cssClass="tg-formtheme tg-formlogin" action="signInStaff">
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
        <%@include file="footer.jsp" %>
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

