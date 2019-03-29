<%-- 
    Document   : slider
    Created on : Mar 28, 2019, 5:12:39 PM
    Author     : Danze
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--************************************
                    Home Slider Start
    *************************************-->
<div id="tg-homebannerslider" class="tg-homebannerslider tg-haslayout">
    <div id="tg-homeslider" class="tg-homeslider tg-homeslidervtwo owl-carousel tg-haslayout">
        <s:if test="%{#request.Ptour != null}">
            <s:iterator value="%{#request.Ptour}">
                <figure class="item" data-vide-bg="poster: <s:property value="%{titleImage}"/>" data-vide-options="position: 0% 50%">
                    <figcaption>
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
                                    <div class="tg-slidercontent">
                                        <h1>Planning a Trip to <s:iterator value="%{listPlace}" status="counter"><s:if test="%{#counter.count > 2}">, </s:if><s:if test="%{#counter.count > 1}"><s:property value="%{name}"/></s:if></s:iterator>?</h1>
                                                <h2>You Choose the Adventure We make it happen</h2>
                                        <s:url action="viewTourDetails" var="viewTourLink">
                                            <s:param name="id" value="%{id}"/>
                                        </s:url>
                                        <s:a cssClass="tg-btn" href="%{viewTourLink}"><span>Explore Tour</span></s:a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
            </s:iterator>
        </s:if>                        
    </div>
    <div class="tg-findtour">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <s:form cssClass="tg-formtheme tg-formtrip" action="searchTour">
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
</div>
<!--************************************
                Home Slider End
*************************************-->
