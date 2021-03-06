﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_thankyou, App_Web_6uoppshz" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <title>Subject Portal | Confirmation</title>
    <link rel="shortcut icon" href="assets/img/camera.png"> 								
    <link rel="stylesheet" href="lib/prod/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->
</head>

<body oncopy="return false" oncontextmenu="return false">

     <input id="hSchoolData" runat="server" type="hidden"/> 								<!-- Client Information-->
     <input id="hBannerImages" runat="server" type="hidden"/> 							    <!-- Banner Images-->
     <input id="hFirstImgPortrait" runat="server" type="hidden"/> 							<!-- First Portrait Image-->
     <input id="hFirstImgGroup" runat="server" type="hidden"/> 								<!-- First Group Image-->

    <div id="opening_load" class="absolute_max bg_fff middle linear">
    	<div class="absolute_vert_center inline" style="height:5em;">
        	<img src="assets/svg/loading/loader_grey.gif" alt="" />
        	<h2 class="txt_sm m_m_top">LOADING...</h2>
        </div>
    </div>																	<!-- Loader -->

    <header class="prm box-shadow ease_sd pattern" style="margin-top:-3.8em;">
        <section class="align_ct">
            <a class="menu_lg_toggle clearfix fl_lt" href="#" ><span class="icon-paragraph-left txt_fff"></span></a>
            <img id="header_logo" src="assets/svg/advancedyou_fff.svg?v1.1" alt="" />
            <a class="link_line_bottom clearfix fl_rt" href="http://advancedlife.com.au/"><span class="icon-unlocked txt_fff"></span></a>
            <div class="clearfix"></div>
        </section>
    </header>																	<!-- Header -->
        
    <nav class="clearfix prm_lt">
    
        <section>            
            <ul class="inline fl_lt desktop_view">
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
        </section>
    
    </nav>																	<!-- Nav -->
        
    <div id="document" class="prm_lt p_l_bottom">
    
        <section class="clearfix bg_fff border_ntl round_sd border_box m_l_bottom">
                        
            <main class="_70_m fl_lt relative border-right">
                                    
                   <div class="p_m_top p_l_right p_l_left">
                       
                        <h1>Order Summary</h1>
                    
                        <h2>Payment Received<span class="icon-checkmark2 fl_rt txt_sec_m m_s_top"></span></h2>
                    
                    </div>
                   
                   <div class="underline_solid"></div>
                   
                   <div class=" p_l_right p_l_left p_l_bottom">
                     
                        <div class="txt_sm">
                            <p>Your payment has been recieved, your receipt number is <span id="ipsReceipt" class="txt_red" runat="server"></span> and an email will be sent to your nominated email address.</p>
                            <p>An email with all relevant information has been sent to your nominated email address.</p>
                            
                            
                            
                            <div class="_50_m m_m_top p_m_right txt_sm">
                                <div class="bg_fa p_m">
                                    <b>Receipt Number:</b>
                                </div>    
                            </div>
                            
                            <div id="ReceiptNumber" class="_50_m bg_fa p_m m_m_top txt_sm">
                            </div>
                		</div>
                        
                        <div class="clearfix"></div>
                        
                   </div>
                    
                   <div class="clearfix"></div>
                   
            </main>
        
            <aside id="sec_wrapper" class="_30_m shadow_left tablet_view border-left">
                      
                        <div class="block_ntl p_l_left p_l_right p_l_bottom p_l_top">
                            <h3>Continue Shopping<span class="fl_rt icon-gift"></span></h3>
                            <p>Add more items to your cart.</p>
                            <a href="" class="round_sd border_box button inline_block txt_sm link_button index"><span class="icon-forward txt_fff m_m_right"></span>Continue Shopping</a>
                        </div>				<!-- aside checkout -->
            
                        <ul class="links _p_m links_line_left">
                            <li><a href="downloads.aspx" class="downloads">Portrait Downloads<span class="icon icon-camera fl_rt"></span></a></li>
                            <li><a href="group_img.aspx" class="group_img">Group Photos<span class="icon icon-group fl_rt"></span></a></li>
                            <li><a href="gift_items.aspx" class="gift_items">Gift Items<span class="icon icon-gift fl_rt"></span></a></li>
                            <li><a href="packages.aspx" class="packages">Photography Packages<span class="icon icon-paper fl_rt"></span></a></li>
                            <li><a href="contact_us.aspx" class="contact_us">Contact Us<span class="icon icon-mail fl_rt"></span></a></li>
                        </ul>
                            
                        <div class="align_ct p_m block_ntl"><a href="#" class="additional_link" data-link="help">Why Buy Online?</a></div>
                    
                        <ul class="clearfix txt_xs no_links">
                        
                            <li>
                                <h3>Privacy Guaranteed<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                                <p class="txt_xsm">This site has been developed in accordance with the 2012 Privacy Amendment Bill.</p>
                            </li>
                            <li>
                                <h3>Safe and Secure<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                                <p class="txt_xsm">This site is verified and secured to keep all your information private and confidential.
                                    <a target="_blank" href="https://seal.godaddy.com/verifySeal?sealID=TtKjRQzGx8UdUUeNXg5phl0o4iUkkSBvIA8b4BmCPrpJ3IZSBbF">
                                        <b>View Certificate</b>
                                    </a>
                                </p>
                            </li>
                            <li>
                                <h3>Customer Service<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                                <p class="txt_xsm">We have customer service operators available to help - nation wide telephone 1300 728 972<br/>
                                    <a href="#" class="contact_us">
                                        <b>Contact Us</b>
                                    </a>
                                </p>
                            </li>
                            <li>
                                <h3>Payment Options<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                                <p class="txt_xsm">Visa and Mastercard Accepted</p>
                            </li>
                            
                        </ul>
        
                    </aside>
             
        </section>
        
    </div>
    
    <div class="clearfix p_l_top p_l_bottom desktop_view">
    	
        <section>
        	
            <div class="wrapper p_m sports_fff"> 
            
                <div class="_66_m p_l_top p_l_bottom txt_emboss txt_sm">
                    <h2>THANK YOU TO <span class="school_name"></span></h2>		<!--  to <span class="school_name"></span> -->
                    <p><span class="name_full"></span> attended <span class="school_name"></span> in <span class="img_latest_year"></span>.</p> 
                    <blockquote>
                    <p>"advancedlife would like to thank the families of <span class="school_name"></span> for the privilege of being part of your community." </p></blockquote>
                    <p>We have made a commitment to build and expand each student's image archive, as we share their journey through through their school years.</p>
                </div>
                
                <div class="fl_rt _33_m img_banner m_l_top m_l_bottom"></div>
        	
            </div>
            
        </section>
    
    </div>																	<!-- clear section -->
    
    <footer>
    
        <section class="p_l_top p_m">
        
            <img src="assets/svg/logo_fff.svg" class="clearfix m_l_top m_l_bottom" alt="" />
            
            <p>We are a proudly Australian family owned and operated business with over 30 years experience.</p>
                
            <div class="underline_dotted m_l_top m_l_bottom"></div>
            
            <span class="_33_m p_l txt_sm">
                <a href="contact_us.aspx" class="contact_us"><span class="icon-inline icon-mail txt_lg txt_fff"></span><span class="event_email">CONTACT US</span></a>
            </span>
            <span class="_33_m p_l txt_sm">
                <a href="contact_us.aspx" class="contact_us"><span class="icon-inline icon-phone txt_lg txt_fff"></span><span class="event_phone">1300 728 972</span></a>
            </span>
            <span class="_33_m p_l txt_sm">
                <a href="index.aspx" class="index"><span class="icon-inline icon-home txt_lg txt_fff"></span><span class="event_address">HOME</span></a>
            </span>
            <div class="clearfix"></div>
            
            <div class="underline_dotted m_l_top m_l_bottom"></div>
            
            <p>school photography &sdot; sports &amp; event photography &sdot; commercial printing &amp; design services</p>
            <p>&copy; advancedlife 2014</p>
            
        </section>
    
    </footer>																	<!-- footer -->
    
    <div id="to_top" class="hidden">
    	<a href="#"><span class="icon-arrow-up m_m"></span></a>
    </div>																	<!-- to top -->

    <div id="additional_content" class="p_xl border_box align_ct">
       
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-cross txt_lg txt_ntl_m fl_rt"></span></a></section>
       	
       <img class="absolute_vert_center opacity_0" src="assets/svg/loading/loader_grey.gif" style="height:1.8em" alt="" />

       <section id="additional_wrap" class="relative align_lt clearfix"></section>
       
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-arrow-up txt_lg txt_ntl_m fl_rt"></span></a></section>
        
    </div>																	<!-- Additional Content -->

    <div id="menu_lg" class="p_l border_box">
    	
        <section>
        
            <h2>MENU<a href="#"><span class="icon-cross txt_ntl_m menu_lg_toggle fl_rt"></span></a></h2>
        	
            <div class="underline_solid m_l_top"></div>
            
            <ul class="links no_indent clearfix links_line_right border_box _33_m">
            
                <li> 
                    <a href="#" class="index">
                        <span>Home</span><span class="icon-inline icon-home fl_rt"></span>
                    </a>
                </li>
                <li>
                    <a href="#" class="downloads">
                        <span>Portrait Downloads</span><span class="icon-inline icon-download2 fl_rt"></span>
                    </a>
                </li>
                <li>
                    <a href="#" class="group_img">
                        <span>Group Photos</span><span class="icon-inline icon-group icon-group fl_rt"></span>
                    </a>
                </li>
                <li>
                    <a href="#" class="gift_items"> 
                        <span>Gift Items</span><span class="icon-inline icon-gift fl_rt"></span>
                    </a>
                </li>
                <li>
                    <a href="#" class="packages">
                        <span>Photography Packages</span><span class="icon-inline icon-book fl_rt"></span>
                    </a>
                </li>
            </ul>
            
            <ul class="links no_indent clearfix  links_line_right border_box _33_m  p_l_left_break">
                
                <li>
                    <a href="" class="contact_us">
                        <span>Contact</span><span class="icon-inline icon-mail fl_rt"></span>
                    </a>
                </li>
                
                <li>
                    <a href="#" class="cart">
                        <span>Your Cart</span><span class="icon-inline icon-cart fl_rt"></span>
                    </a>
                </li>
                
            </ul>
            
            <div class="clearfix m_l_top m_l_bottom"></div>
        	    
            <a href="#" class="menu_lg_toggle m_l_top txt_lg"><span class="icon-arrow-up txt_ntl_m fl_rt"></span></a>
        
        </section>
        
    </div>																	<!-- menu_lg -->
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="lib/prod/project.min.js?v1.1"></script>
<script>
    var todaysDate, sic, userId, 
        schoolData = eval("[" + document.getElementById('hSchoolData').value + "]"),
        bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]"),
        firstPortraitData = eval("[" + document.getElementById('hFirstImgPortrait').value + "]"), 
        firstGroupData = eval("[" + document.getElementById('hFirstImgGroup').value + "]"), 
        portraitData = null,
        groupData = null;
</script>  
<script type="text/javascript">
// INITALISE APP
$(function()
{
    var url, urlLength, sicCode;

    // HIDE HEADER FOR NOW
    $('header').css('margin-top', '-3.8em');

    // PARSE URL 
    url = window.location.href;
    urlLength = url.length;
    sicCode = url.slice(url.search("aspx") + 4, url.length).replace('?SIC=', '').replace(/#/g, '');

    var startMenuControllers = new MenuControllers();
    var setupPageInfo = new PageInfo(schoolData, bannerImages, firstPortraitData, firstGroupData);
    var toTop = new ToTop('#to_top');
    var addPageStyle = new PageStyle(schoolData[0].CssStyle);        

   
    var buildLinks = new BuildLinks('?SIC=' + sicCode );
    var addPageStyle = new PageStyle(schoolData[0].CssStyle);        
    var pageIsLoaded = new PageIsLoaded();

    
       setTimeout(function(){
			var ReceiptNumber = $('#ipsReceipt').html();
			$('#ReceiptNumber').html(ReceiptNumber);
		},300);
		
});

</script>	
    
</body>

</html>
