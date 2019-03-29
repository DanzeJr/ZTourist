<%-- 
    Document   : tourBooking
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
            .myform .tg-select:after {
                content: '';
            }
            .checkValidate span.tg-select label.error{
                text-transform: lowercase !important;
                color: red !important;
                font-size: 12px !important;
            }
            .checkValidate span.tg-select label.error:first-letter{
                text-transform: uppercase;
            }
        </style>
        <title>Z Tourist - Tour Details</title>
    </head>
    <body class="tg-home tg-homevtwo">
        <%@include file="nav.jsp" %>
        <!--************************************
                            Inner Banner Start
        *************************************-->
        <div class="tg-parallax tg-innerbanner" data-appear-top-offset="600" data-parallax="scroll" data-image-src="<s:property value="%{titleImage}"/>">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--************************************
                        Inner Banner End
        *************************************-->
        <!--************************************
                        Main Start
        *************************************-->
        <main id="tg-main" class="tg-main tg-haslayout">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="tg-content" class="tg-content">
                            <div class="tg-tourbookingdetail">
                                <div class="tg-bookinginfo">
                                    <h2><s:property value="%{name}"/></h2>
                                    <h4 style="text-transform: uppercase">Tour ID: <s:property value="%{id}"/></h4>
                                    <div class="tg-pricearea">
                                        <span>From</span>                                        
                                        <h4><s:property value="%{fareAdult}"/>$<sub>/ per adult</sub></h4>
                                        <br/>
                                        <span>And</span>  
                                        <h4><s:property value="%{fareKid}"/>$<sub>/ per kid</sub></h4>
                                        <s:hidden id="fareKid" value="%{fareKid}"/>
                                        <s:hidden id="fareAdult" value="%{fareAdult}"/>
                                        <s:hidden id="leftSpot" value="%{leftSpot}"/>
                                    </div>
                                    <s:if test="%{outDate == false}">
                                        <div class="tg-description">
                                            <s:if test="%{leftSpot > 0}">
                                                <p>There’s only <s:property value="%{leftSpot}"/> spot left. <s:if test="%{takenSpot > 4}">Join <s:property value="%{takenSpot}"/> others at Z Tourist’s experience.</s:if></p>
                                            </s:if>
                                            <s:else>
                                                <p>There's no spot left.</p>
                                            </s:else>
                                        </div>
                                        <s:form action="addToCart" cssClass="tg-formtheme tg-formbookingdetail checkValidate">
                                            <fieldset>                                                
                                                <div class="form-group myform">
                                                    <div class="tg-formicon"><i class="icon-users"></i></div>
                                                    <span class="tg-select">
                                                        <s:textfield id="ticketAdult" name="ticketAdult" value="%{ticketAdult}" placeholder="Adult tickets" required="true"/>
                                                    </span>
                                                </div>
                                                <div class="form-group myform">
                                                    <div class="tg-formicon"><i class="fa fa-child"></i></div>
                                                    <span class="tg-select">
                                                        <s:textfield id="ticketKid" name="ticketKid" value="%{ticketKid}" placeholder="Kid tickets" required="true"/>
                                                    </span>
                                                </div>
                                                <s:if test="%{leftSpot != 0}">
                                                    <div class="form-group">
                                                        <button type="submit" class="tg-btn tg-btn-lg"><span>add to cart</span></button>
                                                    </div>
                                                </s:if>
                                            </fieldset>
                                            <div class="tg-pricearea" id="total" style="margin-top: 5%">
                                                <h4>Total: 0$</h4>
                                            </div>                                        
                                            <s:hidden name="id" value="%{id}"/>
                                            <s:hidden name="fromDate" value="%{fromDate}"/>
                                        </s:form>
                                    </s:if>
                                    <s:else>
                                        <fieldset>
                                        <div class="tg-pricearea" style="margin-top: 5%">
                                            <h4>Tour has started! Booking is not available</h4>
                                        </div>
                                        </fieldset>
                                    </s:else>
                                    <s:if test="hasActionErrors()">
                                        <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
                                    </s:if>
                                    <ul class="tg-tripinfo">
                                        <li><span class="tg-tourduration"><s:property value="%{duration}"/> day(s)</span></li>
                                        <li><span class="tg-tourduration tg-availabilty">From <s:property value="%{fromDate}"/></span></li>
                                        <li>
                                            <span class="tg-tourduration tg-location">
                                                <s:iterator value="%{listPlace}" status="counter">
                                                    <s:if test="%{#counter.count > 1}"> - </s:if>
                                                    <s:property value="%{name}"/>
                                                </s:iterator>
                                            </span>
                                        </li>
                                        <li><span class="tg-tourduration tg-peoples"><s:property value="%{takenSpot}"/> People in this tour</span></li>
                                    </ul>
                                    <div class="tg-refundshare">
                                        <div class="tg-refund">
                                            <figure><img src="images/img-03.jpg" alt="image description"></figure>
                                            <div class="tg-refundinfo">
                                                <h3>100% refundable</h3>
                                                <div class="tg-description">
                                                    <p>Cancel up to 12 days before your trip and get a full refund, including service fees.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!--************************************
                        Main End
        *************************************-->
        <%@include file="footer.jsp" %>
        <script>

            var fareAdult = parseFloat($("#fareAdult").val());
            var fareKid = parseFloat($("#fareKid").val());
            if (!$.isEmptyObject($("#ticketAdult").val()) || !$.isEmptyObject($("#ticketKid").val())) { //khi load trang
                var numAdult = $("#ticketAdult").val();
                var numKid = $("#ticketKid").val();
                if ($.isNumeric(numAdult) && $.isEmptyObject(numKid)) {
                    var total = fareAdult * parseInt(numAdult);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isEmptyObject(numAdult) && $.isNumeric(numKid)) {
                    var total = fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isNumeric(numAdult) && $.isNumeric(numKid)) {
                    var total = fareAdult * parseInt(numAdult) + fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else {
                    $("#total h4").html("Total: 0$");
                }
            }
            $('#ticketAdult').keyup(function () { //khi number of adult ticket duoc bam phim            
                var numAdult = $("#ticketAdult").val();
                var numKid = $("#ticketKid").val();
                if ($.isNumeric(numAdult) && $.isEmptyObject(numKid)) {
                    var total = fareAdult * parseInt(numAdult);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isEmptyObject(numAdult) && $.isNumeric(numKid)) {
                    var total = fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isNumeric(numAdult) && $.isNumeric(numKid)) {
                    var total = fareAdult * parseInt(numAdult) + fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else {
                    $("#total h4").html("Total: 0$");
                }
            });
            $('#ticketKid').keyup(function () { //khi number of kid ticket duoc bam phim 
                var numAdult = $("#ticketAdult").val();
                var numKid = $("#ticketKid").val();
                if ($.isNumeric(numAdult) && $.isEmptyObject(numKid)) {
                    var total = fareAdult * parseInt(numAdult);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isEmptyObject(numAdult) && $.isNumeric(numKid)) {
                    var total = fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else if ($.isNumeric(numAdult) && $.isNumeric(numKid)) {
                    var total = fareAdult * parseInt(numAdult) + fareKid * parseInt(numKid);
                    $("#total h4").html("Total: " + total + "$");
                } else {
                    $("#total h4").html("Total: 0$");
                }
            });

            $.validator.addMethod("exceed", function (value, element) {
                var leftSpot = parseInt($("#leftSpot").val());
                var numAdult = $("#ticketAdult").val();
                var numKid = $("#ticketKid").val();
                var total;
                if ($.isNumeric(numAdult) && $.isEmptyObject(numKid)) {
                    total = parseInt(numAdult);
                } else if ($.isEmptyObject(numAdult) && $.isNumeric(numKid)) {
                    total = parseInt(numKid);
                } else if ($.isNumeric(numAdult) && $.isNumeric(numKid)) {
                    total = parseInt(numAdult) + parseInt(numKid);
                } else {
                    total = 0;
                }
                return this.optional(element) || total <= leftSpot;
            });

            $(document).ready(function () {
                $(".checkValidate").each(function () {

                    $(this).validate({
                        rules: {
                            ticketAdult: {
                                required: true,
                                digits: true,
                                min: 1,
                                exceed: true
                            },
                            ticketKid: {
                                required: true,
                                digits: true,
                                min: 0,
                                exceed: true
                            }
                        },
                        messages: {
                            ticketAdult: {
                                required: "Please enter number of adult tickets",
                                digits: "Number of tickets must be digits",
                                min: "Number of adult tickets must be greater or equals to 1",
                                exceed: "Not enough spots left"
                            },
                            ticketKid: {
                                required: "Please enter number of kid tickets",
                                digits: "Number of tickets must be digits",
                                min: "Number of adult tickets must be greater or equals to 0",
                                exceed: "Not enough spots left"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
