<%-- 
    Document   : tourStaff
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
        </style>
        <title>Z Tourist Staff - Tours</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <%@include file="navStaff.jsp" %>
        <%@include file="sliderStaff.jsp" %>
        <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout tg-bglight">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="tg-content" class="tg-content">
                            <div class="tg-listing tg-listingvthree">
                                <div class="tg-sectiontitle">
                                    <h2>All Tours</h2>
                                </div>
                                <s:if test="%{listTour != null}">
                                    <s:if test="%{!listTour.isEmpty()}">
                                        <s:iterator value="%{listTour}">
                                            <div class="tg-populartour tg-populartourvtwo">
                                                <s:url action="editTour" var="editTourLink">
                                                    <s:param name="id" value="%{id}" />
                                                </s:url>
                                                <figure>
                                                    <s:if test="%{#session.ROLE == 'admin'}">
                                                        <s:a href="%{editTourLink}"><img style="width: 401px; height: 285px;" src="<s:property value="%{titleImage}"/>" alt="tour image"></s:a>
                                                    </s:if>
                                                    <s:else>
                                                        <a href="javascript:void(0);"><img style="width: 401px; height: 285px;" src="<s:property value="%{titleImage}"/>" alt="tour image"></a>
                                                    </s:else>
                                                    </figure>
                                                    <div class="tg-populartourcontent">
                                                        <div class="tg-populartourtitle">
                                                            <s:if test="%{#session.ROLE == 'admin'}">
                                                            <h3 style="color: #00aff0"><s:a href="%{editTourLink}"><s:property value="%{name}"/></s:a></h3>
                                                            </s:if>
                                                            <s:else>
                                                                <h3 style="color: #00aff0"><a href="javascript:void(0);"><s:property value="%{name}"/></a></h3>
                                                            </s:else>
                                                            <br/>
                                                            <h5>
                                                            <s:iterator value="%{listPlace}" status="counter">
                                                                <s:if test="%{#counter.count > 1}"> - </s:if>
                                                                <s:property value="%{name}"/> 
                                                            </s:iterator>
                                                        </h5>
                                                    </div>
                                                    <div class="tg-description">
                                                        <p> - <s:property value="%{desc}"/></p>
                                                        </div>
                                                        <div class="tg-populartourfoot">
                                                            <div class="tg-durationrating">
                                                                <span class="tg-tourduration"><s:property value="%{duration}"/> Day(s)</span>
                                                            <p>Transport: <s:property value="%{transport}"/></p>                                                                                                                                  
                                                        </div>
                                                    </div>
                                                    <div class="tg-priceavailability">
                                                        <div class="tg-availhead">
                                                            <time><s:property value="%{fromDate}"/> - <s:property value="%{toDate}"/></time>
                                                        </div>
                                                        <div class="tg-pricearea">
                                                            <span>From</span>
                                                            <h4><s:property value="%{fareAdult}"/>$</h4>
                                                        </div>
                                                        <s:if test="%{#session.ROLE == 'admin'}">
                                                            <s:a cssClass="tg-btn" href="%{editTourLink}"><span>Edit Tour</span></s:a>
                                                        </s:if>
                                                        </div>
                                                    </div>
                                                </div>                                                    
                                        </s:iterator>
                                        <nav class="tg-pagination">
                                            <ul>
                                                <s:if test="%{totalPages >= 3}"> <%-- if there is 3 or more than 3 pages --%>
                                                    <s:url action="viewAllToursStaff" var="nextPage">
                                                        <s:param name="page" value="%{page + 1}" />
                                                        <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                    </s:url>
                                                    <s:url action="viewAllToursStaff" var="prePage">
                                                        <s:param name="page" value="%{page - 1}" />
                                                        <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                    </s:url>
                                                    <s:if test="%{page == 1}"> <%-- if first page is active --%>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                            <s:url action="viewAllToursStaff" var="toPage">
                                                                <s:param name="page" value="%{page + 2}" />
                                                                <s:param name="skipPage" value="%{skipPage + 10}"/>
                                                            </s:url>
                                                        <li><s:a href="%{toPage}"><s:property value="%{page + 2}"/></s:a></li>
                                                        <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                        </s:if>
                                                        <s:elseif test="%{page == totalPages}"> <%-- if last page is active --%>
                                                            <s:url action="viewAllToursStaff" var="toPage">
                                                                <s:param name="page" value="%{page - 2}" />
                                                                <s:param name="skipPage" value="%{skipPage - 10}"/>
                                                            </s:url>    
                                                        <li class="tg-prevpage"><s:a href="%{toPage}"><i class="fa fa-angle-left"></i></s:a></li>
                                                        <li><s:a href="%{toPage}"><s:property value="%{page - 2}"/></s:a></li>                                                
                                                        <li><s:a href="%{prePage}"><s:property value="%{page - 1}"/></s:a></li>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                        </s:elseif>
                                                        <s:else> <%-- if neither first and last page is active --%>
                                                        <li class="tg-prevpage"><s:a href="%{prePage}"><i class="fa fa-angle-left"></i></s:a></li>
                                                        <li><s:a href="%{prevPage}"><s:property value="%{page - 1}"/></s:a></li>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                        <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                        </s:else>
                                                    </s:if>
                                                    <s:elseif test="%{totalPages == 1}"> <%-- else if only one page show --%>
                                                    <li class="tg-active"><s:a href="javascript:void(0);">1</s:a></li>
                                                    </s:elseif>
                                                    <s:elseif test="%{totalPages == 2}"> <%-- else if only two pages show --%>
                                                        <s:url action="viewAllToursStaff" var="nextPage">
                                                            <s:param name="page" value="%{page + 1}" />
                                                            <s:param name="skipPage" value="%{skipPage + 5}"/>
                                                        </s:url>
                                                        <s:url action="viewAllToursStaff" var="prePage">
                                                            <s:param name="page" value="%{page - 1}" />
                                                            <s:param name="skipPage" value="%{skipPage - 5}"/>
                                                        </s:url>
                                                        <s:if test="%{page == 1}"> <%-- if page 1 is active --%>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                        </s:if>
                                                        <s:else> <%-- if page 2 is active --%>
                                                        <li><s:a href="%{prePage}"><s:property value="%{page - 1}"/></s:a></li>                                 
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>
                                                        </s:else>
                                                    </s:elseif>
                                            </ul>
                                        </nav>
                                    </s:if>
                                    <s:else>
                                        <h3 style="text-align: center">No tour found!</h3>
                                    </s:else>
                                </s:if>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footerStaff.jsp" %>
    </body>
</html>
