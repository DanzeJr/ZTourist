<%-- 
    Document   : payment
    Created on : Mar 29, 2019, 1:32:01 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <link rel="stylesheet" href="css/jquery-confirm.min.css">
        <title>Z Tourist - Payment</title>
    </head>
    <body class="tg-home tg-homevtwo">
        <%@include file="nav.jsp" %>
        <!--************************************
        Inner Banner Start
        *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1>Payment Info</h1>
                            <h2>Place your order</h2>
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
        <main id="tg-main" class="tg-main tg-haslayout">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="tg-content" class="tg-content">
                                <div class="tg-billingdetail">
                                    <s:if test="hasActionErrors()">
                                        <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
                                    </s:if>
                                    <s:form cssClass="tg-formtheme tg-formbillingdetail checkValidate" action="confirmBooking">
                                        <fieldset>
                                            <div class="tg-bookingdetail">
                                                <div class="tg-box">
                                                    <div class="tg-heading">
                                                        <h3>Payment Confirm</h3>
                                                    </div>
                                                    <div class="tg-dashboardcontent">
                                                        <div class="tg-content">
                                                            <ul class="tg-liststyle">
                                                                <li><span>Booking Code:</span></li>
                                                                <li><span><s:property value="%{bookingCode}"/></span></li>
                                                                <li><span>Your Name:</span></li>
                                                                <li><span style="text-transform: capitalize"><s:property value="%{firstName}"/> <s:property value="%{lastName}"/></span></li>
                                                                <li><span>Gender:</span></li>
                                                                <li><span><s:property value="%{gender}"/></span></li>
                                                                <li><span>Birth Date:</span></li>
                                                                <li><span><s:property value="%{birthDate}"/></span></li>
                                                                <li><span>Email Address:</span></li>
                                                                <li><span><s:property value="%{email}"/></span></li>
                                                                <li><span>Phone:</span></li>
                                                                <li><span><s:property value="%{phone}"/></span></li>
                                                                <li><span>Contact Address:</span></li>
                                                                <li><span><s:property value="%{address}"/></span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tg-bookingdetail">
                                                <div class="tg-box tg-addtionalinfo">
                                                    <div class="tg-heading">
                                                        <h3>Additional Information</h3>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Your Comment</label>
                                                        <s:textarea name="comment" placeholder="Notes about your order, e.g." value="%{comment}"/>
                                                    </div>
                                                </div>
                                                <div class="tg-box tg-yourorder">
                                                    <div class="tg-heading">
                                                        <h3>Your Order</h3>
                                                    </div>
                                                    <div class="tg-widgetpersonprice">
                                                        <div class="tg-widgetcontent">
                                                            <ul>
                                                                <li class="tg-personprice"><div class="tg-perperson"><span>Booking Price: </span></div></li>
                                                                <li><span>Sub Total</span><em><s:property value="%{total}"/>$</em></li>
                                                                <li><span>Coupon Code</span><em><s:property value="%{offPercent}"/>%</em></li>
                                                                <li class="tg-totalprice"><div class="tg-totalpayment"><span>Total Price</span><em><s:property value="%{total * (100 - offPercent) / 100}"/>$</em></div></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="tg-paymentarea">
                                            <div id="tg-accordion" class="tg-accordion" role="tablist" aria-multiselectable="true">
                                                <div class="tg-panel">
                                                    <h4 class="tg-radio">
                                                        <input type="radio" id="bank-transfer" name="paymenttype" checked>
                                                        <label for="bank-transfer">Direct Bank Transfer</label>
                                                    </h4>
                                                    <div class="tg-panelcontent">
                                                        <div class="tg-description">
                                                            <p>Transfer with content: Your full name - Booking Code</p>
                                                            <p>Example: <span style="text-transform: capitalize"><s:property value="%{firstName}"/> <s:property value="%{lastName}"/></span> - <s:property value="%{bookingCode}"/></p>
                                                            
                                                            <p><br/><br/>Account holder: ZTourist Travel Service 
                                                            <br/>
                                                            Account number: 0071370087213
                                                            <br/>
                                                            Bank in Vietnam: Vietcombank
                                                            <br/>
                                                            Swift code: BFTVVNVX</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <button id="accept" class="tg-btn" type="submit"><span>Accept Booking</span></button>
                                        </fieldset>
                                        <s:hidden name="bookingCode" value="%{bookingCode}" />
                                        <s:hidden name="couponCode" value="%{couponCode}"/>
                                    </s:form>
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
        <script src="js/jquery-confirm.min.js"></script>
        <script>
            $('#accept').confirm({
                title: "Payment Confirm",
                content: "Are you sure to place this order?",
                icon: "fa fa-money",
                buttons: {
                    "yes, i'm sure": function(){
                        $(".checkValidate").submit();
                    },
                    no: function (){
                        
                    }
                }
            });
            
            $(document).ready(function () {
                $(".checkValidate").each(function () {

                    $(this).validate({
                        rules: {
                            ticketAdult: {
                                required: true,
                                min: 1
                            },
                            ticketKid: {
                                required: true,
                                min: 0
                            }
                        },
                        messages: {
                            ticketAdult: {
                                required: "Please enter number of adult tickets",
                                min: "Number of adult tickets must be greater or equals to 1"
                            },
                            ticketKid: {
                                required: "Please enter number of kid tickets",
                                min: "Number of adult tickets must be greater or equals to 0"
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
