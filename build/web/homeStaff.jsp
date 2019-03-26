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
                <li><a href="destinations.html">Destinations</a></li>
                <li><a href="javascript:void(0);">Listings</a></li>
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
                                        <li><a href="destinations.html">destinations</a></li>
                                        <li class="menu-item-has-children menu-item-has-mega-menu"><a href="javascript:void(0);">listings</a></li>
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
            <!--************************************
                                Home Slider Start
                *************************************-->
            <div class="tg-bannerholder">
                <div class="tg-slidercontent">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h1>Experience the Wonder</h1>
                                <h2>People don’t take trips, trips take People</h2>
                                <s:form cssClass="tg-formtheme tg-formtrip" action="searchTourStaff">
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="destSearch" headerKey="-1" headerValue="Destinations" list="%{#request.Dest}" data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group date" id="datetimepicker1" style="height: 50px">
                                                <s:textfield name="dateSearch" id="datetimepicker2" cssClass="form-control" title="From Date" style="height: 100%; font-size: 14px" required="true"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="durationSearch" headerKey="-1" headerValue="Duration" 
                                                          list="#@java.util.LinkedHashMap@{2:'Below or in 2 Days', 5:'Below or in 5 Days', 7:'Below or in 1 Weeks', 8:'More than 1 week'}" 
                                                          data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>							
                                        <div class="form-group">
                                            <div class="tg-select">
                                                <s:select cssClass="selectpicker" name="priceSearch" headerKey="-1" headerValue="Price" 
                                                          list="#@java.util.LinkedHashMap@{1:'Below 50$', 2:'50$ - 250$', 3:'250$ - 500$', 4:'500$ - 1000$',
                                                          5:'1000$ - 1500$', 6:'1500$ - 2000$', 7:'2000$ - 2500$', 8:'Upper 2500$'}" 
                                                          data-live-search="true" data-width="100%"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="tg-btn" type="submit"><span>find tours</span></button>
                                        </div>
                                    </fieldset>
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tg-homeslider" class="tg-homeslider owl-carousel tg-haslayout">
                    <s:if test="%{#request.Ptour != null}">
                        <s:iterator value="%{#request.Ptour}">
                            <figure class="item" data-vide-bg="poster: <s:property value="%{titleImage}"/>" data-vide-options="position: 0% 50%"></figure>
                            </s:iterator>
                        </s:if>
                </div>
            </div>
            <!--************************************
                            Home Slider End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->
            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                Our Destination Start
                *************************************-->
                <section class="tg-sectionspace tg-bgdark tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="tg-sectionhead tg-sectionheadvtwo">
                                    <div class="tg-sectiontitle">
                                        <h2>Top Destinations</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam consectetuer.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="tg-themetabs tg-themetabsvtwo">
                                    <ul class="tg-themetabnav" role="tablist">
                                        <li role="presentation" class="active"><a href="#northamerica" role="tab" data-toggle="tab"><strong>North america</strong></a></li>
                                        <li role="presentation"><a href="#europe" aria-controls="europe" role="tab" data-toggle="tab"><strong>Europe</strong></a></li>
                                        <li role="presentation"><a href="#africa" aria-controls="africa" role="tab" data-toggle="tab"><strong>africa</strong></a></li>
                                        <li role="presentation"><a href="#asia" aria-controls="asia" role="tab" data-toggle="tab"><strong>asia</strong></a></li>
                                        <li role="presentation"><a href="#southamerica" aria-controls="southamerica" role="tab" data-toggle="tab"><strong>south america</strong></a></li>
                                    </ul>
                                    <div class="tab-content tg-themetabcontent">
                                        <div role="tabpanel" class="tab-pane active" id="america">
                                            <div class="tg-topdestinationslider tg-populardestinations owl-carousel">
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-11.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Paris</a></h3>
                                                            <div class="tg-description">
                                                                <p>Beautiful City in the World</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-12.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Dubai</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-13.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Istanbul</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-14.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">london</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="europe">
                                            <div class="tg-topdestinationslider tg-populardestinations owl-carousel">
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-11.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Paris</a></h3>
                                                            <div class="tg-description">
                                                                <p>Beautiful City in the World</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-12.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Dubai</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-13.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Istanbul</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-14.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">london</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="africa">
                                            <div class="tg-topdestinationslider tg-populardestinations owl-carousel">
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-11.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Paris</a></h3>
                                                            <div class="tg-description">
                                                                <p>Beautiful City in the World</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-12.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Dubai</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-13.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Istanbul</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-14.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">london</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="asia">
                                            <div class="tg-topdestinationslider tg-populardestinations owl-carousel">
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-11.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Paris</a></h3>
                                                            <div class="tg-description">
                                                                <p>Beautiful City in the World</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-12.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Dubai</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-13.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Istanbul</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-14.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">london</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="southamerica">
                                            <div class="tg-topdestinationslider tg-populardestinations owl-carousel">
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-11.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Paris</a></h3>
                                                            <div class="tg-description">
                                                                <p>Beautiful City in the World</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-12.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Dubai</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-13.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">Istanbul</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="item tg-populardestination">
                                                    <figure>
                                                        <a href="javascript:void(0);"><img src="images/tours/img-14.jpg" alt="image destinations"></a>
                                                        <figcaption>
                                                            <h3><a href="javascript:void(0);">london</a></h3>
                                                            <div class="tg-description">
                                                                <p>in the streets of London</p>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="tg-ourdestination">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 tg-verticalmiddle">
                                    <figure><img src="images/placeholder/placeholder-01.png" alt="image destinations"></figure>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 tg-verticalmiddle">
                                    <div class="tg-ourdestinationcontent">
                                        <div class="tg-sectiontitle tg-sectiontitleleft">
                                            <h2>Popular Tours</h2>
                                        </div>
                                        <div class="tg-description"><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam consectetuer adipiscing elit, sed diam nonummy nibh...</p></div>
                                        <ul class="tg-destinations">
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>Europe</h3>
                                                    <em>(05)</em>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>Africa</h3>
                                                    <em>(15)</em>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>Asia</h3>
                                                    <em>(12)</em>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>Oceania</h3>
                                                    <em>(02)</em>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>North America</h3>
                                                    <em>(08)</em>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <h3>South America</h3>
                                                    <em>(27)</em>
                                                </a>
                                            </li>
                                        </ul>
                                        <a class="tg-btn" href="javascript:void(0);"><span>all destinations</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--************************************
                                Our Destination End
                *************************************-->
                <!--************************************
                                Popular Tours Start
                *************************************-->
                <section class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="tg-sectionhead tg-sectionheadvtwo">
                                    <div class="tg-sectiontitle">
                                        <h2>Popular Tours</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam consectetuer</p>
                                    </div>
                                </div>
                                <div id="tg-populartoursslider" class="tg-populartoursslider tg-populartours owl-carousel">
                                    <div class="item tg-populartour">
                                        <figure>
                                            <a href="javascript:void(0);"><img src="images/tours/img-01.jpg" alt="image destinations"></a>
                                            <span class="tg-descount">25% Off</span>
                                        </figure>
                                        <div class="tg-populartourcontent">
                                            <div class="tg-populartourtitle">
                                                <h3><a href="javascript:void(0);">City Tours in Europe, Paris</a></h3>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh...</p>
                                            </div>
                                            <div class="tg-populartourfoot">
                                                <div class="tg-durationrating">
                                                    <span class="tg-tourduration">7 Days</span>
                                                    <span class="tg-stars"><span></span></span>
                                                    <em>(3 Review)</em>
                                                </div>
                                                <div class="tg-pricearea">
                                                    <del>$2,800</del>
                                                    <h4>$2,500</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item tg-populartour">
                                        <figure><a href="javascript:void(0);"><img src="images/tours/img-02.jpg" alt="image destinations"></a></figure>
                                        <div class="tg-populartourcontent">
                                            <div class="tg-populartourtitle">
                                                <h3><a href="javascript:void(0);">Best of Canada Tours and Travel</a></h3>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh...</p>
                                            </div>
                                            <div class="tg-populartourfoot">
                                                <div class="tg-durationrating">
                                                    <span class="tg-tourduration">7 Days</span>
                                                    <span class="tg-stars"><span></span></span>
                                                    <em>(3 Review)</em>
                                                </div>
                                                <div class="tg-pricearea">
                                                    <span>from</span>
                                                    <h4>$600</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item tg-populartour">
                                        <figure><a href="javascript:void(0);"><img src="images/tours/img-03.jpg" alt="image destinations"></a></figure>
                                        <div class="tg-populartourcontent">
                                            <div class="tg-populartourtitle">
                                                <h3><a href="javascript:void(0);">Italy – 3 Days in Rome, Golden Gate</a></h3>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh...</p>
                                            </div>
                                            <div class="tg-populartourfoot">
                                                <div class="tg-durationrating">
                                                    <span class="tg-tourduration">7 Days</span>
                                                    <span class="tg-stars"><span></span></span>
                                                    <em>(3 Review)</em>
                                                </div>
                                                <div class="tg-pricearea">
                                                    <span>from</span>
                                                    <h4>$1,430</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item tg-populartour">
                                        <figure><a href="javascript:void(0);"><img src="images/tours/img-04.jpg" alt="image destinations"></a></figure>
                                        <div class="tg-populartourcontent">
                                            <div class="tg-populartourtitle">
                                                <h3><a href="javascript:void(0);">Best of Canada Tours and Travel</a></h3>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh...</p>
                                            </div>
                                            <div class="tg-populartourfoot">
                                                <div class="tg-durationrating">
                                                    <span class="tg-tourduration">7 Days</span>
                                                    <span class="tg-stars"><span></span></span>
                                                    <em>(3 Review)</em>
                                                </div>
                                                <div class="tg-pricearea">
                                                    <span>from</span>
                                                    <h4>$600</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--************************************
                                Popular Tours End
                *************************************-->
                <!--************************************
                                Features Start
                *************************************-->
                <section class="tg-parallax" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-02.jpg">
                    <div class="tg-sectionspace tg-haslayout">
                        <div class="container">
                            <div class="row">
                                <div class="tg-features">
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="tg-feature">
                                            <div class="tg-featuretitle">
                                                <h2><span>01</span><a href="javascript:void(0);">Luxury Hotels</a></h2>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh tempor cum soluta nobis consectetuer nihil imperdiet doming...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="tg-feature">
                                            <div class="tg-featuretitle">
                                                <h2><span>02</span><a href="javascript:void(0);">Tourist Guide</a></h2>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh tempor cum soluta nobis consectetuer nihil imperdiet doming...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="tg-feature">
                                            <div class="tg-featuretitle">
                                                <h2><span>03</span><a href="javascript:void(0);">Flights Tickets</a></h2>
                                            </div>
                                            <div class="tg-description">
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh tempor cum soluta nobis consectetuer nihil imperdiet doming...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--************************************
                                Features End
                *************************************-->
                <!--************************************
                                Article Start
                *************************************-->
                <section class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="tg-sectionhead tg-sectionheadvtwo">
                                    <div class="tg-sectiontitle">
                                        <h2>Latest Articles</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam consectetuer</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tg-posts">
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <article class="tg-post">
                                        <figure>
                                            <a href="javascript:void(0);">
                                                <img src="images/blog/img-01.jpg" alt="image description">
                                                <div class="tg-hover">
                                                    <h3>Bungee Jumping Trip</h3>
                                                    <time datetime="2017-06-08">Feb 22, 2017</time>
                                                </div>
                                            </a>
                                        </figure>
                                    </article>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <article class="tg-post">
                                        <figure>
                                            <a href="javascript:void(0);">
                                                <img src="images/blog/img-02.jpg" alt="image description">
                                                <div class="tg-hover">
                                                    <h3>Bungee Jumping Trip</h3>
                                                    <time datetime="2017-06-08">Feb 22, 2017</time>
                                                </div>
                                            </a>
                                        </figure>
                                    </article>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <article class="tg-post">
                                        <figure>
                                            <a href="javascript:void(0);">
                                                <img src="images/blog/img-03.jpg" alt="image description">
                                                <div class="tg-hover">
                                                    <h3>Bungee Jumping Trip</h3>
                                                    <time datetime="2017-06-08">Feb 22, 2017</time>
                                                </div>
                                            </a>
                                        </figure>
                                    </article>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <article class="tg-post">
                                        <figure>
                                            <a href="javascript:void(0);">
                                                <img src="images/blog/img-04.jpg" alt="image description">
                                                <div class="tg-hover">
                                                    <h3>Bungee Jumping Trip</h3>
                                                    <time datetime="2017-06-08">Feb 22, 2017</time>
                                                </div>
                                            </a>
                                        </figure>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--************************************
                                Article End
                *************************************-->
            </main>
            <!--************************************
                            Main End
            *************************************-->
            <!--************************************
                            Footer Start
            *************************************-->
            <footer id="tg-footer" class="tg-footer tg-haslayout">
                <div class="tg-fourcolumns">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgettext">
                                    <div class="tg-widgettitle">
                                        <h3>About Z Tourist</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <div class="tg-description">
                                            <p>The best tour in the multiverses</p>
                                        </div>
                                        <span>038 928 3348</span>
                                        <a href="mailto:info@ztourist.com">info@ztourist.com</a>
                                        <ul class="tg-socialicons tg-socialiconsvtwo">
                                            <li><a href="http://www.facebook.com/Phi.Hoang99"><i class="icon-facebook-logo-outline"></i></a></li>
                                            <li><a href="http://www.instagram.com/danzejr/"><i class="icon-instagram-social-outlined-logo"></i></a></li>
                                            <li><a href="http://twitter.com/PhiHoangVo?"><i class="icon-twitter-social-outlined-logo"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgettext">
                                    <div class="tg-widgettitle">
                                        <h3>Pages</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <ul>
                                            <li><a href="javascript:void(0);">Home</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgetdestinations">
                                    <div class="tg-widgettitle">
                                        <h3>Address</h3>
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <ul>
                                            <li><a href="javascript:void(0);">84/11 Huynh Khuong An, Go Vap, Ho Chi Minh City, Vietnam</a></li>
                                            <li><a href="javascript:void(0);">223 Ba Trieu, District 1, Hanoi, Vietnam</a></li>
                                        </ul>                            
                                    </div>
                                </div>
                            </div>                
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                <div class="tg-footercolumn tg-widget tg-widgetnewsletter">
                                    <div class="tg-widgettitle">
                                        <!--                            <h3>Z Tourist was registered to GOV</h3>-->
                                    </div>
                                    <div class="tg-widgetcontent">
                                        <s:a href="http://online.gov.vn/HomePage.aspx"><img src="images/gov_img.png" alt="image destinations"></s:a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tg-footerbar">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <p>Copyright &copy; 2019 ZTourist. All  rights reserved</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--************************************
                            Footer End
            *************************************-->
        </div>
        <!--************************************
                        Wrapper End
        *************************************-->
        <script src="js/vendor/jquery-library.js"></script>
        <script src="js/moment.js"></script>
        <script src="js/moment-with-locales.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/jquery-scrolltofixed.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.mmenu.all.js"></script>
        <script src="js/packery.pkgd.min.js"></script>
        <script src="js/jquery.vide.min.js"></script>
        <script src="js/scrollbar.min.js"></script>
        <script src="js/prettyPhoto.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/main.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            /* -------------------------------------
             Datetimepicker
             -------------------------------------- */
            $(function () {
                $('#datetimepicker1').datetimepicker({
                    showTodayButton: true,
                    format: 'Y-MM-DD HH:mm:ss'
                });
            });

            $('#datetimepicker2').mousedown(function () {
                $('#datetimepicker1').data('DateTimePicker').show();
            });
            $("#datetimepicker2").attr("placeholder", "From Date");
            
            /* -------------------------------------
             PRETTY PHOTO GALLERY
             -------------------------------------- */
            jQuery("a[data-rel]").each(function () {
                jQuery(this).attr("rel", jQuery(this).data("rel"));
            });
            jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({
                animation_speed: 'normal',
                theme: 'dark_square',
                slideshow: 3000,
                autoplay_slideshow: false,
                social_tools: false
            });

            /* ---------------------------------------
             MOBILE MENU
             --------------------------------------- */
            jQuery("#menu").mmenu({
                extensions: [
                    "border-full",
                    "pagedim-black"
                ]
            });
        </script>
    </body>
</html>
