<%-- 
    Document   : staffProfile
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
        </style>
        <title>Z Tourist Staff - Employee Profile</title>
    </head>
    <body class="tg-home tg-homevthree tg-login">
        <%@include file="navStaff.jsp" %>
        <!--************************************
                            Inner Banner Start
            *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1 style="text-transform: uppercase"><s:property value="%{username}"/></h1>
                            <h2>Role: <s:property value="%{role}"/></h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--************************************
                        Inner Banner End
        *************************************-->
        <main id="tg-main" class="tg-main tg-haslayout">
            <s:if test="hasActionMessages()">
                <h4 style="text-align: center; color: green;"><s:actionmessage/></h4>
            </s:if>
            <s:if test="hasActionErrors()">
                <h4 style="text-align: center; color: red; padding-top: 4%;"><s:actionerror/></h4>
            </s:if>
            <div id="tg-content" class="tg-content">
                <div class="tg-dashboard">
                    <div class="tg-box tg-profile">
                        <div class="tg-heading">
                            <h3>Staff Profile</h3>
                            <s:url action="editStaffProfile" var="editProfileLink">
                                <s:param name="username" value="%{username}"/>
                            </s:url>
                            <s:a cssClass="tg-btnedit" href="%{editProfileLink}">Edit Staff Profile</s:a>
                        </div>
                        <div class="tg-dashboardcontent">
                            <figure><img style="width: 87px; height: 87px;" src="<s:property value="%{avatar}"/>" alt="avatar"></figure>
                            <div class="tg-content">
                                <ul class="tg-liststyle">
                                    <li><span>Full Name</span></li>
                                    <li><span style="text-transform: capitalize"><s:property value="%{firstName}"/> <s:property value="%{lastName}"/></span></li>
                                    <li><span>Gender</span></li>
                                    <li><span><s:property value="%{gender}"/></span></li>
                                    <li><span>Birth Date</span></li>
                                    <li><span><s:property value="%{birthDate}"/></span></li>
                                    <li><span>Email Address</span></li>
                                    <li><span><s:property value="%{email}"/></span></li>
                                    <li><span>Phone</span></li>
                                    <li><span><s:property value="%{phone}"/></span></li>
                                    <li><span>Contact Address</span></li>
                                    <li><span><s:property value="%{address}"/></span></li>
                                    <li><span>Language</span></li>
                                    <li><span><s:property value="%{language == null || language.isEmpty() ? '...' : language}"/></span></li>                                    
                                    <li><span>Job</span></li>
                                    <li><span><s:property value="%{job == null || job.isEmpty() ? '...' : job}"/></span></li>
                                    <li><span>Salary</span></li>
                                    <li><span><s:property value="%{salary}"/>$</span></li>
                                    <li><span>Start Date</span></li>
                                    <li><span><s:property value="%{startDate}"/></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footerStaff.jsp" %>
    </body>
</html>
