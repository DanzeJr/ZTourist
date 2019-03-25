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
                            <h3>Customer Care</h3>
                        </div>
                        <div class="tg-widgetcontent">
                            <ul>
                                <li><a href="javascript:void(0);">Travel insurance</a></li>
                                <li><a href="javascript:void(0);">Privacy</a></li>
                                <li><a href="javascript:void(0);">Terms and condition</a></li>
                                <li><a href="javascript:void(0);">Payment online policy</a></li>
                                <li><a href="javascript:void(0);">FAQS</a></li>
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
<!--************************************
                Search Start
*************************************-->
<%--
<div id="tg-search" class="tg-search">
    <button type="button" class="close"><i class="icon-cross"></i></button>
    <s:form action="searchTour_searchName">
        <fieldset>
            <div class="form-group">
                <s:textfield type="search" name="search" cssClass="form-control" value="" placeholder=""/>
                <button type="submit" class="tg-btn"><span class="icon-search2"></span></button>
            </div>
        </fieldset>
    </s:form>
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
    </ul>
</div>
--%>
<!--************************************
                Search End
*************************************-->
<!--************************************
                Login Singup Start
*************************************-->
<div id="tg-loginsingup" class="tg-loginsingup" data-vide-bg="poster: images/singup-img.jpg" data-vide-options="position: 0% 50%">
    <div class="tg-contentarea tg-themescrollbar">
        <div class="tg-scrollbar">
            <button type="button" class="close">x</button>
            <div class="tg-logincontent">
                <nav id="tg-loginnav" class="tg-loginnav">
                    <h3>Z TOURIST</h3>
                </nav>
                <div class="tg-themetabs">
                    <ul class="tg-navtbs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" data-toggle="tab">Sign in</a></li>
                        <li role="presentation"><a href="#profile" data-toggle="tab">New to Z Tourist?</a></li>
                    </ul>
                    <div class="tg-tabcontent tab-content">
                        <div role="tabpanel" class="tab-pane active fade in" id="home">
                            <s:form cssClass="tg-formtheme tg-formlogin" action="signIn">
                                <fieldset>
                                    <div class="form-group">
                                        <label>Username<sup>*</sup></label>
                                        <s:textfield cssClass="form-control" name="username" placeholder="" required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Password <sup>*</sup></label>
                                        <s:password cssClass="form-control" name="password" placeholder="" required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <div class="tg-checkbox">
                                        </div>
                                        <span><a href="#">Lost your password?</a></span>
                                    </div>
                                    <button class="tg-btn tg-btn-lg" type="submit" name="action"><span>Sign In</span></button>
                                </fieldset>
                            </s:form>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile">                            
                            <s:form cssClass="tg-formtheme tg-formlogin" action="signUp_toPage">                 
                                <fieldset>
                                    <div class="form-group">
                                        <label>Username<sup>*</sup></label>
                                        <s:textfield cssClass="form-control" name="username" placeholder=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Email<sup>*</sup></label>
                                        <s:textfield cssClass="form-control" name="email" type="email" placeholder=""/>
                                    </div>
                                    <button class="tg-btn tg-btn-lg" type="submit"><span>Sign Up</span></button>
                                </fieldset>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--************************************
                Login Singup End
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
     SIGN IN ONPEN CLOSE
     -------------------------------------- */
    jQuery('a[href="#tg-loginsingup"]').on('click', function(event) {
        event.preventDefault();
        jQuery('#tg-loginsingup').addClass('open');
        jQuery('body').addClass('tg-hidescroll');
    });
    jQuery('#tg-loginsingup, #tg-loginsingup button.close').on('click keyup', function(event) {
        jQuery('body').removeClass('tg-hidescroll');
        if (event.target === this || event.target.className === 'close' || event.keyCode === 27) {
            jQuery(this).removeClass('open');
        }
    });
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
<script>
    /* -------------------------------------
     HOME BANNER SLIDER
     -------------------------------------- */
    var _tg_homeslider = $('#tg-homeslider');
    _tg_homeslider.owlCarousel({
        items: 1,
        loop: true,
        dots: true,
        nav: true,
        autoplay: true,
        autoplayTimeout: 5000,
        animateIn: 'fadeIn',
        animateOut: 'fadeOut',
        navText: [
            '<i class="icon-chevron-left"></i>',
            '<i class="icon-chevron-right"></i>'
        ],
        navClass: [
            'tg-btnroundprev',
            'tg-btnroundnext'
        ]
    });
    jQuery('.owl-carousel').mouseover(function () {
        _tg_homeslider.trigger('stop.owl.autoplay');
        $('#tg-homeslider').parent().find('.tg-btnroundnext').show();
        $('#tg-homeslider').parent().find('.tg-btnroundprev').show();
    });
    jQuery('.owl-carousel').mouseleave(function () {
        _tg_homeslider.trigger('play.owl.autoplay');
        $('#tg-homeslider').parent().find('.tg-btnroundnext').hide();
        $('#tg-homeslider').parent().find('.tg-btnroundprev').hide();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        //sua lai ham xac dinh loi email de email chi valid khi co ca dau cham sau @ va sau dau cham chi co 2 chu
            $.validator.methods.email = function (value, element) {
                return this.optional(element) || /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value);
            };
            $(".tg-formlogin").each(function () {
                $(this).validate({
                    rules: {
                        username: {
                            required: true,
                            rangelength: [4, 30]
                        },
                        password: {
                            required: true,
                            rangelength: [6, 30]
                        },
                        email: {
                            required: true,
                            email: true
                        }
                    },
                    messages: {
                        username: {
                            required: "Please enter your user name",
                            rangelength: "Username must be 4 to 30 characters long"
                        },
                        password: {
                            required: "Please provide a password",
                            rangelength: "Phone number must be from 6 to 30 characters long"
                        },
                        email: {
                            required: "Please enter your email",
                            email: "Invalid email"
                        }
                    }
                });
            });
        });
</script>

