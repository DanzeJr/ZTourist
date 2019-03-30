<%-- 
    Document   : addStaff
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
        </style>
        <title>Z Tourist Staff - New Employee</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <%@include file="navStaff.jsp" %>
        <%@include file="sliderStaff.jsp" %>
        <main id="tg-main" class="tg-main tg-haslayout">
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="addStaff" method="POST" enctype="multipart/form-data">
                <div class="tg-imgholder" style="width: 100%; height: 10%">
                    <center>
                        <s:hidden name="avatar" value="%{avatar}" />
                        <figure><img id="imgAvatar" style="height: 30%; width: 30%" src="<s:if test="%{avatar != null}"><s:property value="%{avatar}"/></s:if><s:else>images/staffs/ZAvatar.png</s:else>" alt="Avatar Image"></figure>
                            <s:file id="avatarImg" cssStyle="display: none" name="photo"/>
                        <a class="tg-btn" href="javascript:void(0);" onclick="$('#avatarImg').click();">Choose Profile Image</a>
                    </center>
                </div>
                <div style="padding: 10%">
                    <div class="form-group">
                        <div class="form-group" id="usernameV" style="width: 48%">
                            <label>Username <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="username" id="username" value="%{username}" required="true"/>
                            <s:fielderror fieldName="username"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Password  <sup>*</sup></label>
                            <s:password cssClass="form-control" name="password" id="Password" value="%{password}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>First Name <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="firstName" value="%{firstName}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Last Name <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="lastName" value="%{lastName}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" id="emailV" style="width: 48%">
                            <label>Email Address <sup>*</sup></label>
                            <s:textfield cssClass="form-control" type="email" name="email" id="email" value="%{email}" required="true"/>
                            <s:fielderror fieldName="email"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Phone Number <sup>*</sup></label>
                            <s:textfield cssClass="form-control" type="tel" name="phone" value="%{phone}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>Gender <sup>*</sup></label>
                            <s:select cssClass="form-control" name="gender" list="#@java.util.LinkedHashMap@{'Male':'Male', 'Female':'Female', 'Others':'Others'}"/>
                        </div>               
                        <div class="form-group" id="yob" style="width: 48%; float: right">
                            <label>Birth Date <sup>*</sup></label>
                            <s:textfield id="datetimepicker3" cssClass="form-control" name="birthDate" value="%{birthDate}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact Address <sup>*</sup></label>
                        <s:textfield cssClass="form-control" name="address" value="%{address}" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Role <sup>*</sup></label>
                        <s:select cssClass="form-control" name="role" list="#@java.util.LinkedHashMap@{'guide':'Guide', 'admin':'Admin'}"/>
                    </div>
                    <center>
                        <button class="tg-btn" type="submit"><span>Add Staff</span></button>
                    </center>
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

            $('#avatarImg').change(function () { //show preview avatar
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imgAvatar').attr('src', e.target.result);
                    },
                            reader.readAsDataURL(this.files[0]);
                }
            });

            var u = $('#usename').val();
            $('#username').keyup(function () {
                if (u.toString().toLowerCase() === $('#username').val().toString().toLowerCase()) {
                    $('#usernameV > .errorMessage').show();
                } else {
                    $('#usernameV > .errorMessage').hide();
                }
            });

            var e = $('#email').val();
            $('#email').keyup(function () {
                if (u.toString().toLowerCase() === $('#email').val().toString().toLowerCase()) {
                    $('#emailV > .errorMessage').show();
                } else {
                    $('#emailV > .errorMessage').hide();
                }
            });            

            $(document).ready(function () {
                $.validator.methods.email = function (value, element) {
                    return this.optional(element) || /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value);
                };
                $.validator.addMethod("maxDate", function (value, element) {
                    var now = new Date();
                    var myDate = new Date(value);
                    return this.optional(element) || now.getFullYear() - myDate.getFullYear() >= 18;
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
                            email: {
                                required: true,
                                email: true
                            }
                        },
                        messages: {
                            username: {
                                required: "Please enter staff username",
                                rangelength: "Username must be 4 to 30 characters long"
                            },
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
                                maxDate: "Staff age must be from 18 year olds"
                            },
                            address: {
                                required: "Please enter staff address",
                                maxlength: "Address must not be greater than 200 characters long"
                            },
                            phone: {
                                required: "Please enter staff phone number",
                                rangelength: "Phone number must be from 9 to 30 characters long"
                            },
                            password: {
                                required: "Please provide a password",
                                rangelength: "Password must be from 6 to 30 characters long"
                            },
                            email: {
                                required: "Please enter staff email",
                                email: "Invalid email"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
