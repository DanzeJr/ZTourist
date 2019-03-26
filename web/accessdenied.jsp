<%-- 
    Document   : accessdenied
    Created on : Mar 19, 2019, 7:42:36 AM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="">
    <head>	
        <%@include file="header.jsp" %>
        <title>Z Tourist - Access Denied</title>
    </head>
    <body class="tg-404errorpage">
        <main id="tg-main" class="tg-main tg-haslayout">
            <div class="tg-404error" style="padding: 20% 0;">
                <div class="container">
                    <div class="row">
                        <div class="tg-404errorcontent">
                            <h1>Access Denied</h1>
                            <h2>Page not Found</h2>
                            <div class="tg-description">
                                <p>Sorry but the page that you are looking for does not exist or you not allowed to access...</p>
                            </div>
                            <a class="tg-btn" href="homeStaff.jsp"><span>go back to home</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>