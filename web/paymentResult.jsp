<%-- 
    Document   : paymentResult
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
        <title>Z Tourist - Payment Result</title>
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
                            <h1>Payment Result</h1>
                            <h2>Order Result</h2>
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
                                    <s:form cssClass="tg-formtheme tg-formbillingdetail checkValidate" action="confirmBooking">
                                        <fieldset>
                                            <div class="tg-bookingdetail">
                                                <div class="tg-box">
                                                    <div class="tg-heading">
                                                        <h3>Payment Result</h3>
                                                    </div>
                                                    <div class="tg-dashboardcontent">
                                                        <div class="tg-content">
                                                            <ul class="tg-liststyle">
                                                                <li><span>Booking Code:</span></li>
                                                                <li><span><s:property value="%{bookingCode}"/></span></li>
                                                                <li><span>Full Name:</span></li>
                                                                <li><span style="text-transform: capitalize"><s:property value="%{firstName}"/> <s:property value="%{lastName}"/></span></li>
                                                                <li><span>Email Address:</span></li>
                                                                <li><span><s:property value="%{email}"/></span></li>
                                                                <li><span>Phone:</span></li>
                                                                <li><span><s:property value="%{phone}"/></span></li>
                                                                <li><span>Contact Address:</span></li>
                                                                <li><span><s:property value="%{address}"/></span></li>
                                                                <li><span>Booking Date:</span></li>
                                                                <li><span><s:property value="%{date}"/></span></li>
                                                                <li><span>Number of Tickets:</span></li>
                                                                <li><span><s:property value="%{totalTickets}"/></span></li>
                                                                <li><span>Coupon Code:</span></li>
                                                                <li><span>Off <s:property value="%{offPercent}"/>%</span></li>
                                                                <li><span>Total Price:</span></li>
                                                                <li><span><s:property value="%{total * (100 - offPercent) / 100}"/> USD</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tg-bookingdetail">
                                                <div class="tg-box tg-addtionalinfo">
                                                    <div class="tg-heading">
                                                        <h3>Number of Tours: <s:property value="%{listTour.size()}"/></h3>
                                                    </div>
                                                    <s:iterator value="%{listTour}">
                                                        <div class="tg-widgetpersonprice" style="margin-bottom: 5%;">
                                                            <div class="tg-widgetcontent">
                                                                <ul>
                                                                    <li class="tg-personprice"><div class="tg-perperson"><span>Tour: <s:property value="%{name}"/> (<s:property value="%{id}"/>)</span></div></li>
                                                                    <li><span>Adult Tickets:</span><em><s:property value="%{ticketAdult}"/> x <s:property value="%{fareAdult}"/>$</em></li>
                                                                    <li><span>Kid Tickets:</span><em><s:property value="%{ticketKid}"/> x <s:property value="%{fareKid}"/>$</em></li>
                                                                    <li class="tg-totalprice"><div class="tg-totalpayment"><span>Total Price:</span><em><s:property value="%{ticketAdult * fareAdult + ticketKid * fareKid}"/>$</em></div></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </s:iterator>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset class="tg-paymentarea">
                                            <div class="tg-heading">
                                                <h3>Bank Transfer Information</h3>
                                            </div>
                                            <p>Account holder: ZTourist Travel Service 
                                                <br/>
                                                Account number: 0071370087213
                                                <br/>
                                                Bank in Vietnam: Vietcombank
                                                <br/>
                                                Swift code: BFTVVNVX</p>
                                        </fieldset>
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
    </body>
</html>
