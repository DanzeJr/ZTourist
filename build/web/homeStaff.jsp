<%-- 
    Document   : homeStaff
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
        <title>Z Tourist Staff - Home</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">        
        <%@include file="navStaff.jsp" %>
        <%@include file="sliderStaff.jsp" %>
        <main id="tg-main" class="tg-main tg-haslayout">

        </main>
        <%@include file="footerStaff.jsp" %>
    </body>
</html>
