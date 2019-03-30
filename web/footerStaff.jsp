<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <li><a href="homeStaff.jsp">Home</a></li>
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
