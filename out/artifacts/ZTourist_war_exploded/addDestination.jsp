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
        <%@include file="navStaff.jsp" %>
        <%@include file="sliderStaff.jsp" %>
        <main id="tg-main" class="tg-main tg-haslayout">
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="addDestination" method="POST" enctype="multipart/form-data">
                <div class="tg-imgholder" style="width: 100%; height: 10%">
                    <center>
                        <s:hidden name="titleImage" value="%{titleImage}"/>
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
        <%@include file="footerStaff.jsp" %>
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
            $('#id').keyup(function () {
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
