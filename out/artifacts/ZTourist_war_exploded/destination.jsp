<%-- 
    Document   : destination
    Created on : Mar 25, 2019, 10:31:47 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <%@include file="header.jsp" %>
        <title>Z Tourist - Destinations</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <%@include file="nav.jsp" %>
        <%@include file="slider.jsp" %>
        <!--************************************
                        Main Start
        *************************************-->
        <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="tg-content" class="tg-content">
                            <div class="tg-listing tg-listingvtwo">
                                <div class="tg-sectiontitle">
                                    <h2>Destinations</h2>
                                </div>
                                <s:if test="%{listPlace != null}">
                                    <s:if test="%{!listPlace.isEmpty()}">                                            
                                        <div class="clearfix"></div>
                                        <div class="row">
                                            <s:iterator value="%{listPlace}">
                                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                                    <div class="tg-trendingtrip">
                                                        <figure>
                                                            <a href="javascript:void(0);">
                                                                <img style="width: 401px; height: 250px" src="<s:property value="%{titleImage}"/>" alt="destination image">
                                                                <div class="tg-hover">
                                                                    <div class="tg-pricearea">
                                                                        <h4><s:property value="%{country}"/></h4>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </figure>
                                                        <div class="tg-populartourcontent">
                                                            <div class="tg-populartourtitle">
                                                                <h3><a href="javascript:void(0);"><s:property value="%{name}"/></a></h3>
                                                            </div>
                                                            <div class="tg-description">
                                                                <p><s:property value="%{des}"/></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </s:iterator>
                                        </div>
                                        <div class="clearfix"></div>
                                        <nav class="tg-pagination">
                                            <ul>
                                                <s:if test="%{totalPages >= 3}"> <%-- if there is 3 or more than 3 pages --%>
                                                    <s:url action="viewAllDestinations" var="nextPage">
                                                        <s:param name="page" value="%{page + 1}" />
                                                        <s:param name="skipPage" value="%{skipPage + 6}"/>
                                                    </s:url>
                                                    <s:url action="viewAllDestinations" var="prePage">
                                                        <s:param name="page" value="%{page - 1}" />
                                                        <s:param name="skipPage" value="%{skipPage - 6}"/>
                                                    </s:url>
                                                    <s:if test="%{page == 1}"> <%-- if first page is active --%>
                                                        <li class="tg-active"><s:a href="javascript:void(0);"><s:property value="%{page}"/></s:a></li>                                                
                                                        <li><s:a href="%{nextPage}"><s:property value="%{page + 1}"/></s:a></li>
                                                            <s:url action="viewAllDestinations" var="toPage">
                                                                <s:param name="page" value="%{page + 2}" />
                                                                <s:param name="skipPage" value="%{skipPage + 12}"/>
                                                            </s:url>
                                                        <li><s:a href="%{toPage}"><s:property value="%{page + 2}"/></s:a></li>
                                                        <li class="tg-nextpage"><s:a href="%{nextPage}"><i class="fa fa-angle-right"></i></s:a></li>
                                                        </s:if>
                                                        <s:elseif test="%{page == totalPages}"> <%-- if last page is active --%>
                                                            <s:url action="viewAllDestinations" var="toPage">
                                                                <s:param name="page" value="%{page - 2}" />
                                                                <s:param name="skipPage" value="%{skipPage - 12}"/>
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
                                                        <s:url action="viewAllDestinations" var="nextPage">
                                                            <s:param name="page" value="%{page + 1}" />
                                                            <s:param name="skipPage" value="%{skipPage + 6}"/>
                                                        </s:url>
                                                        <s:url action="viewAllDestinations" var="prePage">
                                                            <s:param name="page" value="%{page - 1}" />
                                                            <s:param name="skipPage" value="%{skipPage - 6}"/>
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
                                </s:if>
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
