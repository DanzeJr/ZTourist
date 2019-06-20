<%-- 
    Document   : changePassword
    Created on : Mar 12, 2019, 1:32:01 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <style>
            .tg-content label.error {
                color: red !important;
                font-size: 12px !important;
            }
            #yob li {
                list-style: none;
            }
            #yob table tr td,
            #yob table tr th{
                padding:10px 0;
                text-align:center;
            }
        </style>
        <title>Z Tourist - Edit Profile</title>
    </head>
    <body class="tg-home tg-homevtwo">
        <%@include file="nav.jsp" %>
        <!--************************************
                            Inner Banner Start
            *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1>Edit Profile</h1>
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
                        <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="changePassword">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <aside id="tg-sidebar" class="tg-sidebar">
                                    <div class="tg-widget tg-widgetdashboard">
                                        <div class="tg-widgettitle">
                                            <h3>My Account</h3>
                                        </div>
                                        <div class="tg-widgetcontent">
                                            <ul>
                                                <li><a href="viewProfile"><i class="icon-user"></i><span>Dashboard</span></a></li>
                                                <li><a href="editProfile"><i class="icon-pen2"></i><span>Edit Profile</span></a></li>
                                                <li class="selected"><a href="changePassword"><i class="icon-lock-open3"></i><span>Change Password</span></a></li>
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
                                        <div class="tg-box tg-changepassword">
                                            <div class="tg-heading">
                                                <h3>Change Password</h3>
                                            </div>
                                            <s:if test="hasActionMessages()">
                                                <h4 style="text-align: center; color: green;"><s:actionmessage/></h4>
                                            </s:if>
                                            <s:if test="hasActionErrors()">
                                                <h4 style="text-align: center; color: red;"><s:actionerror/></h4>
                                            </s:if>
                                            <div class="tg-dashboardcontent">
                                                <div class="tg-content">
                                                    <fieldset>
                                                        <div class="form-group">
                                                            <label>Old Password<sup>*</sup></label>
                                                            <s:password name="oldPassword" cssClass="form-control" placeholder="" required="true"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>New Password<sup>*</sup></label>
                                                            <s:password name="newPassword" cssClass="form-control" id="Password" placeholder="" required="true"/>
                                                        </div>
                                                        <div class="form-group" style="float: right">
                                                            <label>Confirm Password<sup>*</sup></label>
                                                            <s:password name="cfPassword" cssClass="form-control" placeholder="" required="true"/>
                                                        </div>
                                                        <button class="tg-btn" type="submit"><span>update password</span></button>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
        <script type="text/javascript">

            $(document).ready(function () {
                $(".checkValidate").each(function () {

                    $(this).validate({
                        rules: {
                            oldPassword: {
                                required: true,
                                rangelength: [6, 30]
                            },
                            newPassword: {
                                required: true,
                                rangelength: [6, 30]
                            },
                            cfPassword: {
                                required: true,
                                rangelength: [6, 30],
                                equalTo: "#Password"
                            }
                        },
                        messages: {
                            oldPassword: {
                                required: "Please enter your old password",
                                rangelength: "Password must be from 6 to 30 characters long"
                            },
                            newPassword: {
                                required: "Please provide a new password",
                                rangelength: "Password must be from 6 to 30 characters long"
                            },
                            cfPassword: {
                                required: "Please confirm your new password",
                                rangelength: "Confirm password must be from 6 to 30 characters long",
                                equalTo: "Password mismatch"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
