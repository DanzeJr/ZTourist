<%-- 
    Document   : editProfile
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
                        <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="updateProfile" method="POST" enctype="multipart/form-data">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <aside id="tg-sidebar" class="tg-sidebar">
                                    <div class="tg-widget tg-widgetdashboard">
                                        <div class="tg-widgettitle">
                                            <h3>My Account</h3>
                                        </div>
                                        <div class="tg-widgetcontent">
                                            <ul>
                                                <li><a href="viewProfile"><i class="icon-user"></i><span>Dashboard</span></a></li>
                                                <li class="selected"><a href="editProfile"><i class="icon-pen2"></i><span>Edit Profile</span></a></li>
                                                <li><a href="changePassword.jsp"><i class="icon-lock-open3"></i><span>Change Password</span></a></li>
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
                                        <div class="tg-box tg-ediprofile">
                                            <div class="tg-heading">
                                                <h3>Edit Profile</h3>
                                            </div>
                                            <div class="tg-dashboardcontent">
                                                <div class="tg-imgholder">
                                                    <figure><img id="avatarImg" style="width: 87px; height: 87px;" src="<s:property value="%{avatar}"/>" alt="avatar"></figure>
                                                        <s:file id="avatar" cssStyle="display: none" name="photo"/>
                                                    <a class="tg-btn" href="javascript:void(0);" onclick="$('#avatar').click();">Change Profile Picture</a>
                                                </div>
                                                <div class="tg-content">
                                                    <fieldset>
                                                        <div class="form-group" style="width: 100%">
                                                            <div class="form-group">
                                                                <label>First name <sup>*</sup></label>
                                                                <s:textfield cssClass="form-control" name="firstName" value="%{firstName}" required="true"/>
                                                            </div>
                                                            <div class="form-group" style="float: right">
                                                                <label>Last name <sup>*</sup></label>
                                                                <s:textfield cssClass="form-control" name="lastName" value="%{lastName}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="width: 100%">
                                                            <div class="form-group">
                                                                <label>Gender <sup>*</sup></label>
                                                                <s:select cssClass="form-control" name="gender" list="#@java.util.LinkedHashMap@{'Male':'Male', 'Female':'Female', 'Others':'Others'}"/>
                                                            </div>
                                                            <div class="form-group" id="yob" style="float: right">
                                                                <label>Birth date <sup>*</sup></label>
                                                                <s:textfield id="datetimepicker3" cssClass="form-control" name="birthDate" value="%{birthDate}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="width: 100%">
                                                            <div class="form-group">
                                                                <label>Email Address <sup>*</sup></label>
                                                                <s:textfield cssClass="form-control" type="email" name="email" value="%{email}" required="true"/>
                                                            </div>
                                                            <div class="form-group" style="float: right">
                                                                <label>Phone Number <sup>*</sup></label>
                                                                <s:textfield type="tel" name="phone" cssClass="form-control" value="%{phone}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="width: 100%">
                                                            <div class="form-group">
                                                                <label>Contact Address <sup>*</sup></label>
                                                                <s:textfield name="address" cssClass="form-control" value="%{address}" required="true"/>
                                                            </div>
                                                            <div class="form-group" style="float: right">
                                                                <label>Job </label>
                                                                <s:textfield cssClass="form-control" name="job" value="%{job}"/>
                                                            </div>
                                                        </div>
                                                        <button class="tg-btn" type="submit"><span>update profile</span></button>
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
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'DD/MMM/YYYY'
                });
            });

            $('#avatar').change(function () { //show preview avatar
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#avatarImg').attr('src', e.target.result);
                    },
                            reader.readAsDataURL(this.files[0]);
                }
            });

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
                            email: {
                                required: true,
                                email: true
                            },
                            job: {
                                maxlength: 100
                            }
                        },
                        messages: {
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
                            email: {
                                required: "Please enter your email",
                                email: "Invalid email"
                            },
                            job: {
                                maxlength: "Job must not be greater than 100 characters long"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
