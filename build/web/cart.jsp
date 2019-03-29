<%-- 
    Document   : cart
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
            #updateBtn {
                color: white;
                height: 40px;
                padding: 0 30px;
                background: #888;
                border-radius: 4px;
                line-height: 40px;
            }
            #updateBtn:hover {
                background-color: #ff7550;
            }
        </style>
        <title>Z Tourist - Cart</title>
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
                            <h1>Cart</h1>
                            <h2>View your selected tours</h2>
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
        <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout tg-bglight">
            <div class="container">
                <div class="row">
                    <div id="tg-twocolumns" class="tg-twocolumns">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-cartproductdetail">
                                <table class="table table-responsive">
                                    <tr>
                                        <th scope="col">Tour Name</th>
                                        <th scope="col">Ticket Adult</th>
                                        <th scope="col">Ticket Kid</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Update</th>
                                        <th scope="col">Remove</th>
                                    </tr>
                                    <tbody>
                                        <s:if test="%{listTour != null}">
                                            <s:if test="%{!listTour.isEmpty()}">
                                                <s:iterator value="%{listTour}" status="counter">
                                                    <s:form cssClass="checkValidate" action="updateCart">
                                                        <tr>
                                                            <td data-title="tour name">
                                                                <div class="tg-tourname">
                                                                    <figure>
                                                                        <s:hidden name="id" value="%{id}"/>
                                                                        <s:hidden name="couponCode" value="%{couponCode}"/>
                                                                        <s:url action="viewTourDetails" var="viewTourLink">
                                                                            <s:param name="id" value="%{id}"/>
                                                                        </s:url>
                                                                        <s:a href="%{viewTourLink}"><img style="width: 68px; height: 68px;" src="<s:property value="%{titleImage}"/>" alt="tour image"></s:a>
                                                                        </figure>
                                                                        <div class="tg-populartourcontent">
                                                                            <div class="tg-populartourtitle">                                                                
                                                                                <h3><s:a href="%{viewTourLink}"><s:property value="%{name}"/> (<s:property value="%{id}"/>)</s:a></h3>
                                                                            </div>
                                                                            <span><s:property value="%{fareKid}"/>$ - <s:property value="%{fareAdult}"/>$</span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td data-title="quantity">
                                                                <s:textfield type="number" cssClass="form-control" name="ticketAdult" value="%{ticketAdult}"/>
                                                            </td>
                                                            <td data-title="quantity">
                                                                <s:textfield type="number" cssClass="form-control" name="ticketKid" value="%{ticketKid}"/>
                                                            </td>
                                                            <td data-title="price"><span style="margin-right: 10px;"><s:property value="%{fareKid * ticketKid + fareAdult * ticketAdult}"/>$</span></td>
                                                            <td data-title="action"><button id="updateBtn" type="submit">Update</button></td>
                                                            <s:url action="removeTourInCart" var="removeTourLink">
                                                                <s:param name="id" value="%{id}"/>
                                                            </s:url>
                                                            <td data-title="action"><s:a href="%{removeTourLink}"><i class="icon-trash-can"></i></s:a></td>
                                                            </tr>
                                                    </s:form>
                                                </s:iterator>
                                            </s:if>
                                        </s:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <s:if test="hasActionErrors()">
                            <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
                        </s:if>
                        <s:if test="%{listTour != null}">
                            <s:if test="%{!listTour.isEmpty()}">
                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pull-left">
                                    <div id="tg-content" class="tg-content">
                                        <div class="tg-cart">
                                            <div class="tg-couponapply">
                                                <s:form action="viewCart">
                                                    <div class="form-group">
                                                        <s:textfield name="couponCode" cssClass="form-control" placeholder="Coupon Code"/>
                                                        <button class="tg-btn" type="submit">apply</button>
                                                    </div>
                                                </s:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pull-right">
                                    <aside id="tg-sidebar" class="tg-sidebar tg-haslayout">
                                        <div class="tg-widget tg-widgetpersonprice">
                                            <div class="tg-widgetcontent">
                                                <ul>
                                                    <li class="tg-personprice"><div class="tg-perperson"><span>Booking Price: </span></div></li>
                                                    <li><span>Sub Total</span><em><s:property value="%{total}"/>$</em></li>
                                                    <li><span>Coupon Code</span><em><s:property value="%{offPercent}"/>%</em></li>
                                                    <li class="tg-totalprice"><div class="tg-totalpayment"><span>Total Price</span><em><s:property value="%{total * (100 - offPercent) / 100}"/>$</em></div></li>
                                                        <s:url action="checkOut" var="paymentLink">
                                                            <s:param name="couponCode" value="%{couponCode}"/>
                                                        </s:url>
                                                    <li><s:a cssClass="tg-btn tg-btn-lg" href="%{paymentLink}">next step</s:a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                            </s:if>
                            <s:else>
                                <h4 style="text-align: center">There is no tour in cart</h4>
                            </s:else>
                        </s:if>
                        <s:else>
                            <h4 style="text-align: center">There is no tour in cart</h4>
                        </s:else>
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
