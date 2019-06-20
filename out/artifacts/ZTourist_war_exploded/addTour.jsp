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
            .checkValidate .form-group li {
                list-style: none;
            }
        </style>
        <title>Z Tourist Staff - New Tour</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <s:action name="initStaff"/>
        <%@include file="navStaff.jsp" %>
        <%@include file="sliderStaff.jsp" %>
        <main id="tg-main" class="tg-main tg-haslayout">
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <s:form cssClass="tg-formtheme tg-formdashboard checkValidate" action="addTour" method="POST" enctype="multipart/form-data">
                <div class="tg-imgholder" style="width: 100%; height: 10%">
                    <center>
                        <s:hidden name="titleImage" value="%{titleImage}"/>
                        <figure><img id="imgTitle" style="height: 100%; width: 80%" src="<s:if test="%{titleImage != null}"><s:property value="%{titleImage}"/></s:if><s:else>images/tours/default.jpg</s:else>" alt="Tour Image"></figure>
                            <s:file id="titleImg" cssStyle="display: none" name="photo"/>
                        <a class="tg-btn" href="javascript:void(0);" onclick="$('#titleImg').click();">Choose Tour Image</a>
                    </center>
                </div>
                <div style="padding: 10%">                        
                    <div class="form-group" id="idV">
                        <label>Tour ID <sup>*</sup></label>
                        <s:textfield cssClass="form-control" name="id" id="id" value="%{id}" required="true"/>
                        <s:fielderror fieldName="id"/>
                    </div>
                    <div class="form-group">
                        <label>Tour Name <sup>*</sup></label>
                        <s:textfield cssClass="form-control" name="name" value="%{name}" required="true"/>
                    </div>
                    <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>From Date <sup>*</sup></label>
                            <s:textfield id="fromDatePicker" cssClass="form-control" name="fromDate" value="%{fromDate}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>To Date <sup>*</sup></label>
                            <s:textfield id="toDatePicker" cssClass="form-control" name="toDate" value="%{toDate}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>Adult Fare <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="fareAdult" value="%{fareAdult}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Kid Fare <sup>*</sup></label>
                            <s:textfield cssClass="form-control" name="fareKid" value="%{fareKid}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group" style="width: 48%">
                            <label>Minimum Guest <sup>*</sup></label>
                            <s:textfield id="minGuest" cssClass="form-control" name="minGuest" value="%{minGuest}" required="true"/>
                        </div>
                        <div class="form-group" style="width: 48%; float: right">
                            <label>Maximum Guest <sup>*</sup></label>
                            <s:textfield id="maxGuest" cssClass="form-control" name="maxGuest" value="%{maxGuest}" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Transport <sup>*</sup></label>
                        <s:textfield cssClass="form-control" name="transport" value="%{transport}" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Description </label>
                        <s:textarea cssClass="form-control" name="des" value="%{des}"/>
                    </div>
                    <div class="form-group">
                        <h3 style="font-weight: bold">Destinations: </h3>
                    </div>
                    <div class="form-group" style="width: 48%">
                        <label>Departure <sup>*</sup></label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Departure" data-live-search="true" list="%{#request.Dest}" name="departure" required="true"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%; float: right">
                        <label>Destination 1 <sup>*</sup></label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 1" data-live-search="true" list="%{#request.Dest}" name="destination1" required="true"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%">
                        <label>Destination 2 </label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 2" data-live-search="true" list="%{#request.Dest}" name="destination2"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%; float: right">
                        <label>Destination 3 </label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Destination 3" data-live-search="true" list="%{#request.Dest}" name="destination3"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <h3 style="font-weight: bold">Guides: </h3>
                    </div>    
                    <div class="form-group" style="width: 48%">
                        <label>Guide 1 <sup>*</sup></label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 1" data-live-search="true" list="%{#request.Guide}" name="guide1" required="true"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%; float: right">
                        <label>Guide 2 </label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 2" data-live-search="true" list="%{#request.Guide}" name="guide2"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%">
                        <label>Guide 3 </label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 3" data-live-search="true" list="%{#request.Guide}" name="guide3"/>
                        </div>
                    </div>
                    <div class="form-group" style="width: 48%; float: right">
                        <label>Guide 4 </label>
                        <div>
                            <s:select cssClass="form-control selectpicker" headerKey="-1" headerValue="Guide 4" data-live-search="true" list="%{#request.Guide}" name="guide4"/>
                        </div>
                    </div>
                    <center>
                        <button class="tg-btn" type="submit"><span>Add Tour</span></button>
                    </center>                       
                </div>
            </s:form>
        </main>
        <%@include file="footerStaff.jsp" %>
        <script type="text/javascript">
            $('#fromDatePicker').datetimepicker({
                format: 'Y-MM-DD HH:mm:ss'
            });
            $('#toDatePicker').datetimepicker({
                useCurrent: false,
                format: 'Y-MM-DD HH:mm:ss'
            });
            $("#fromDatePicker").on("dp.change", function (e) {
                $('#toDatePicker').data("DateTimePicker").minDate(e.date);
            });
            $("#toDatePicker").on("dp.change", function (e) {
                $('#fromDatePicker').data("DateTimePicker").maxDate(e.date);
            });

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
                $.validator.addMethod("price", function (value, element) { //validate price
                    return this.optional(element) || /^(\d{1,18})(\.\d{1,2})*?$/.test(value);
                });
                $.validator.addMethod("selected", function (value, element) {
                    return this.optional(element) || value !== '-1';
                });
                $.validator.addMethod("ge", function (value, element, param) {
                    return this.optional(element) || parseInt(value) >= parseInt($(param).val());
                });
                $.validator.addMethod("le", function (value, element, param) {
                    return this.optional(element) || parseInt(value) <= parseInt($(param).val());
                });
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
                            fromDate: {
                                required: true
                            },
                            toDate: {
                                required: true
                            },
                            des: {
                                maxlength: 200
                            },
                            fareAdult: {
                                required: true,
                                price: true
                            },
                            fareKid: {
                                required: true,
                                price: true
                            },
                            transport: {
                                required: true,
                                maxlength: 50
                            },
                            minGuest: {
                                required: true,
                                digits: true,
                                range: [0, 100],
                                le: "#maxGuest"
                            },
                            maxGuest: {
                                required: true,
                                digits: true,
                                range: [1, 100],
                                ge: "#minGuest"
                            },
                            departure: {
                                selected: true
                            },
                            destination1: {
                                selected: true
                            },
                            guide1: {
                                selected: true
                            }
                        },
                        messages: {
                            id: {
                                required: "Please enter tour ID",
                                maxlength: "Tour ID must not be greater than 30 characters long"
                            },
                            name: {
                                required: "Please enter tour name",
                                maxlength: "Tour name must not be greater than 50 characters long"
                            },
                            fromDate: {
                                required: "Please choose when tour start"
                            },
                            toDate: {
                                required: "Please choose when tour end"
                            },
                            des: {
                                maxlength: "Description must not be greater than 200 characters long"
                            },
                            fareAdult: {
                                required: "Please enter adult fare",
                                price: "Adult fare must be a float number with maximum 2 decimal places"
                            },
                            fareKid: {
                                required: "Please enter kid fare",
                                price: "Kid fare must be a float number with maximum 2 decimal places"
                            },
                            transport: {
                                required: "Please enter the transport of this tour",
                                maxlength: "Transport must not be greater than 50 characters long"
                            },
                            minGuest: {
                                required: "Please enter minimum guest of this tour",
                                digits: "Minimum guest must be digits",
                                range: "Minimum guest must be in range from 0 to 100",
                                le: "Minimum guest must be lesser or equals to maximum guest"
                            },
                            maxGuest: {
                                required: "Please enter maximum guest of this tour",
                                digits: "Maximum guest must be digits",
                                range: "Maximmum guest must be in range from 1 to 100",
                                ge: "Maximum guest must be greater or equals to minimum guest"
                            },
                            departure: {
                                selected: "Please select departure of this tour"
                            },
                            destination1: {
                                selected: "Please select the destination of this tour"
                            },
                            guide1: {
                                selected: "Please select tour guide"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
