<%-- 
    Document   : dashboard
    Created on : Mar 12, 2019, 1:32:01 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <%@include file="header.jsp" %>
        <title>Z Tourist - Dashboard</title>
    </head>
    <body class="tg-home tg-homevtwo">
        <%@include file="nav.jsp" %>
        <!--************************************
                            Inner Banner Start
            *************************************-->
        <section class="tg-parallax tg-innerbanner" data-appear-top-offset="100" data-parallax="scroll" data-image-src="images/ZTouristSWR.png">
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <h1>Dashboard</h1>
                            <h2><s:property value="%{#session.USER}"/></h2>
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
        <main id="tg-main" class="tg-main tg-sectionspace tg-haslayout">
            <div class="container">
                <div class="row">
                    <div id="tg-twocolumns" class="tg-twocolumns">
                        <form class="tg-formtheme tg-formdashboard">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <aside id="tg-sidebar" class="tg-sidebar">
                                    <div class="tg-widget tg-widgetdashboard">
                                        <div class="tg-widgettitle">
                                            <h3>My Account</h3>
                                        </div>
                                        <div class="tg-widgetcontent">
                                            <ul>
                                                <li class="selected"><a href="viewProfile"><i class="icon-user"></i><span>Dashboard</span></a></li>
                                                <li><a href="editProfile"><i class="icon-pen2"></i><span>Edit Profile</span></a></li>
                                                <li><a href="changePassword.jsp"><i class="icon-lock-open3"></i><span>Change Password</span></a></li>
                                                <li><a href="viewMyBooking"><i class="icon-basket3"></i><span>My Booking</span></a></li>
                                                <li><a href="signOut"><i class="icon-lock"></i><span>Sign Out</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </aside>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                <div id="tg-content" class="tg-content">
                                    <div class="tg-dashboard">
                                        <div class="tg-box tg-profile">
                                            <div class="tg-heading">
                                                <h3>My Profile</h3>
                                                <a class="tg-btnedit" href="editProfile">Edit Profile</a>
                                            </div>
                                            <s:if test="hasActionMessages()">
                                                <h4 style="text-align: center; color: green;"><s:actionmessage/></h4>
                                            </s:if>
                                            <s:if test="hasActionErrors()">
                                                <h4 style="text-align: center; color: red;"><s:actionerror/></h4>
                                            </s:if>
                                            <div class="tg-dashboardcontent">
                                                <figure><img style="width: 87px; height: 87px;" src="<s:property value="%{avatar}"/>" alt="avatar"></figure>
                                                <div class="tg-content">
                                                    <ul class="tg-liststyle">
                                                        <li><span>Name</span></li>
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
                                                        <li><span>Job</span></li>
                                                        <li><span><s:property value="%{job == null || job.isEmpty() ? '...' : job}"/></span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
