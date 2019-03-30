<%-- 
    Document   : staffProfile
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
            #yob li {
                list-style: none;
            }
            #yob table tr td,
            #yob table tr th{
                padding:10px 0;
                text-align:center;
            }
        </style>
        <title>Z Tourist Staff - Edit Employee</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <%@include file="navStaff.jsp" %>
        <!--************************************
                            Inner Banner Start
            *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1 style="text-transform: uppercase"><s:property value="%{username}"/></h1>
                            <h2>Role: <s:property value="%{role}"/></h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--************************************
                        Inner Banner End
        *************************************-->
        <main id="tg-main" class="tg-main tg-haslayout">
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="updateStaffProfile" method="POST" enctype="multipart/form-data">
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
                                                <label>First Name <sup>*</sup></label>
                                                <s:textfield cssClass="form-control" name="firstName" value="%{firstName}" required="true"/>
                                            </div>
                                            <div class="form-group" style="float: right">
                                                <label>Last Name <sup>*</sup></label>
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
                                                <label>Language </label>
                                                <s:textfield cssClass="form-control" name="language" value="%{language}"/>
                                            </div>
                                        </div>
                                        <div class="form-group" style="width: 100%">
                                            <div class="form-group">
                                                <label>Job </label>
                                                <s:textfield cssClass="form-control" name="job" value="%{job}"/>
                                            </div>
                                            <div class="form-group" style="float: right">
                                                <label>Salary <sup>*</sup></label>
                                                <s:textfield cssClass="form-control" name="salary" value="%{salary}" required="true"/>
                                            </div>
                                        </div>
                                                <s:if test="%{isYou == false}">
                                                    <div class="form-group" style="width: 25%;">
                                                        <label>Role <sup>*</sup></label>
                                                        <s:select cssClass="form-control" name="role" list="#@java.util.LinkedHashMap@{'guide':'Guide', 'admin':'Admin', 'deactive':'Deactive'}"/>
                                                    </div>
                                                </s:if>
                                        <button class="tg-btn" type="submit"><span>update profile</span></button>
                                        <s:hidden name="username" value="%{username}"/>
                                        <s:hidden name="startDate" value="%{startDate}"/>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </s:form>
        </main>
        <%@include file="footerStaff.jsp" %>
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
                    return this.optional(element) || now.getFullYear() - myDate.getFullYear() >= 18;
                });
                $.validator.addMethod("price", function (value, element) { //validate price
                    return this.optional(element) || /^(\d{1,18})(\.\d{1,2})*?$/.test(value);
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
                            salary: {
                                required: true,
                                price: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            language: {
                                maxlength: 500
                            },
                            job: {
                                maxlength: 100
                            }
                        },
                        messages: {
                            lastName: {
                                required: "Please enter staff last name",
                                maxlength: "Last name must not be greater than 50 characters long"
                            },
                            firstName: {
                                required: "Please enter staff first name",
                                maxlength: "First name must not be greater than 50 characters long"
                            },
                            birthDate: {
                                required: "Please choose staff date of birth",
                                maxDate: "Your age must be from 18 year olds"
                            },
                            address: {
                                required: "Please enter staff address",
                                maxlength: "Address must not be greater than 200 characters long"
                            },
                            phone: {
                                required: "Please enter staff phone number",
                                rangelength: "Phone number must be from 9 to 30 characters long"
                            },
                            salary: {
                                required: "Please enter staff phone number",
                                price: "Salary must be a float number with maximum 2 decimal places"
                            },
                            email: {
                                required: "Please enter your email",
                                email: "Invalid email"
                            },
                            language: {
                                maxlength: "Language must not be greater than 500 characters long"
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
