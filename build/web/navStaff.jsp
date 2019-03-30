<%-- 
    Document   : navStaff
    Created on : Mar 28, 2019, 5:11:18 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<s:action name="init"/>
<!--************************************
                        Loader Start
*************************************-->
<div class="loader">
    <div class="span">
        <div class="location_indicator"></div>
    </div>
</div>
<!--************************************
                        Loader End
*************************************-->
<!--************************************
                Mobile Menu Start
*************************************-->
<nav id="menu">
    <ul>
        <li><a href="homeStaff.jsp">Home</a></li>
        <li><a href="viewAllDestinationsStaff">Destinations</a>
            <ul>
                <s:if test="%{#session.ROLE == 'admin'}">
                    <li><a href="addDestination.jsp">Add new destination</a></li>                    
                    </s:if>
                <li><a href="searchDest">Search destination</a></li>
            </ul>
        </li>
        <li><a href="viewAllToursStaff">Tours</a>
            <s:if test="%{#session.ROLE == 'admin'}">
                <ul>
                    <li><a href="addTour.jsp">Add new tour</a></li>
                </ul>
            </s:if>
        </li>
        <s:if test="%{#session.ROLE == 'guide'}">
            <li><a href="viewAllTasks">Schedule Task</a></li>
        </s:if>
        <s:if test="%{#session.ROLE == 'admin'}">
            <li><a href="viewAllStaffs">Staffs</a>
                <ul>
                    <li><a href="addStaff.jsp">Add new staff</a></li>
                </ul>
            </li>
        </s:if>                
        <s:if test="%{#session.ROLE == 'admin'}">
            <li><a href="viewAllCustomers">Customers</a>          
                <ul>                  
                    <li><a href="viewOrder">View Order</a></li>       
                </ul>          
            </li>
        </s:if>
        <s:if test="%{#session.ROLE == 'admin'}">
            <li><a href="viewAllCouponCodes">Coupon Codes</a></li>
        </s:if>
    </ul>
</nav>
<!--************************************
                Mobile Menu End
*************************************-->
<!--************************************
                Wrapper Start
*************************************-->
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">
    <!--************************************
                    Header Start
    *************************************-->
    <header id="tg-header" class="tg-header tg-headervthree tg-haslayout">
        <div class="container-fluid">
            <div class="row">
                <div class="tg-topbar">
                    <nav class="tg-infonav">
                        <ul>
                            <li>
                                <i><img src="images/icons/icon-01.png" alt="image destinations"></i>
                                <span>0389 283 348</span>
                            </li>
                        </ul>
                    </nav>
                    <div class="tg-addnavcartsearch">
                        <nav class="tg-addnav">
                            <ul>
                                <li><a href="javascript:void(0);">about</a></li>
                                <li><a href="javascript:void(0);">contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="tg-navigationarea tg-headerfixed">
                    <strong class="tg-logo"><a href="homeStaff.jsp"><img src="images/dbzlogo.png" alt="Z Tourist logo"></a></strong>
                    <div class="tg-socialsignin">
                        <ul class="tg-socialicons">
                            <li><a href="http://www.facebook.com/Phi.Hoang99"><i class="icon-facebook-logo-outline"></i></a></li>
                            <li><a href="http://www.instagram.com/danzejr/"><i class="icon-instagram-social-outlined-logo"></i></a></li>
                            <li><a href="http://twitter.com/PhiHoangVo?"><i class="icon-twitter-social-outlined-logo"></i></a></li>
                        </ul>
                        <div class="tg-userbox">
                            <a id="tg-btnsignin" class="tg-btn" href="#tg-loginsingup"><span>sign in</span></a>
                            <div class="dropdown tg-dropdown">
                                <button class="tg-btndropdown" id="tg-dropdowndashboard" type="button" data-toggle="dropdown">
                                    <img style="width: 35px; height: 35px;" src="<s:property value="%{#session.AVA}"/>" alt="avatar">
                                    <span><s:property value="%{#session.USER}"/></span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <ul class="dropdown-menu tg-dropdownusermenu" aria-labelledby="tg-dropdowndashboard">
                                    <li><a href="viewProfileStaff">Dashboard</a></li>
                                    <li><a href="editProfileStaff">Edit Profile</a></li>
                                    <li><a href="signOutStaff">Sign Out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <nav id="tg-nav" class="tg-nav">
                        <div class="navbar-header">
                            <a href="#menu" class="navbar-toggle collapsed">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </a>
                        </div>
                        <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                            <ul>
                                <li class="menu-item-has-children current-menu-item"><a href="homeStaff.jsp">Home</a></li>
                                <li class="menu-item-has-children"><a href="viewAllDestinationsStaff">Destinations</a>
                                    <ul class="sub-menu">
                                        <s:if test="%{#session.ROLE == 'admin'}">
                                            <li><a href="addDestination.jsp">Add new destination</a></li>                    
                                            </s:if>
                                        <li><a href="searchDest">Search destination</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="viewAllToursStaff">Tours</a>
                                    <s:if test="%{#session.ROLE == 'admin'}">
                                        <ul class="sub-menu">
                                            <li><a href="addTour.jsp">Add new tour</a></li>
                                        </ul>
                                    </s:if>
                                </li>
                                <s:if test="%{#session.ROLE == 'guide'}">
                                    <li><a href="viewAllTasks">Schedule Task</a></li>
                                    </s:if>
                                    <s:if test="%{#session.ROLE == 'admin'}">
                                    <li class="menu-item-has-children"><a href="viewAllStaffs">Staffs</a>
                                        <s:if test="%{#session.ROLE == 'admin'}">
                                            <ul class="sub-menu">
                                                <li><a href="addStaff.jsp">Add new staff</a></li>
                                            </ul>
                                        </s:if>
                                    </li>
                                </s:if>                
                                <s:if test="%{#session.ROLE == 'admin'}">
                                    <li class="menu-item-has-children"><a href="viewAllCustomers">Customers</a>    
                                        <ul class="sub-menu">                    
                                            <li><a href="viewOrders">View Orders</a></li>     
                                        </ul>          
                                    </li>
                                </s:if>
                                <s:if test="%{#session.ROLE == 'admin'}">
                                    <li><a href="viewAllCouponCodes">Coupon Codes</a></li>
                                </s:if>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!--************************************
                    Header End
    *************************************-->