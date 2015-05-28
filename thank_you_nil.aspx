<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_thankyouNil, App_Web_-tibnddc" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head run at="server">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    
    <title>Subject Portal | Confirmation</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/style.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>

	<script type="text/javascript">
            if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
            alert("Notice! This website does not support versions of Internet Explorer. We recommend using Firefox, Google Chrome, Safari or Opera. Sorry for the inconvenience");
			
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-55035205-1', 'auto');
		  ga('send', 'pageview');
    </script>
    
	<script type="text/javascript">
            if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
            alert("Notice! This website does not support versions of Internet Explorer. We recommend using Firefox, Google Chrome, Safari or Opera. Sorry for the inconvenience");
   	</script>

    <!-- If IE  -->
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->

</head>

<body>

<form id="form1" runat="server">
                    
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager><!--asp ajax element--->

     <input id="hSchoolData" runat="server" type="hidden"/> 								<!-- Client Information-->
     <input id="hBannerImages" runat="server" type="hidden"/> 							    <!-- Banner Images-->
     <input id="hFirstImgPortrait" runat="server" type="hidden"/> 							<!-- First Portrait Image-->
     <input id="hFirstImgGroup" runat="server" type="hidden"/> 								<!-- First Group Image-->
    
    <div id="opening_load" class="fixed_max bg_fff middle linear">
    	<div class="absolute_vert_center inline" style="height:5em;">
        	<img src="svg/loading/loader_grey.gif" alt="" />
        	<h2 class="txt_sm m_m_top">LOADING...</h2>
        </div>
    </div>																	<!-- Loader -->
    
    <header class="prm box-shadow ease_sd pattern" style="margin-top:-3.8em;">
        <section class="align_ct">
            <a class="menu_lg_toggle clearfix fl_lt" href="#" ><span class="icon-paragraph-left txt_fff"></span></a>
            <img id="header_logo" src="svg/advancedyou_fff.svg?v1.1" alt="" />
            <a class="link_line_bottom clearfix fl_rt" href="http://advancedlife.com.au/"><span class="icon-unlocked txt_fff"></span></a>
            <div class="clearfix"></div>
        </section>
    </header>																	<!-- Header -->
        
    <nav class="clearfix prm_lt">
    
        <section>
        
            <ul class="inline fl_lt">
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>

        </section>
    
    </nav>																	<!-- Nav -->
        
    <div id="document" class="prm_lt p_l_bottom">
    	
        <section class="clearfix bg_fff round_sd border_box">
            
            <main class="_70_m clearfix m_l_bottom relative">
                
                   <div class="p_m_top p_l_right p_l_left">
                       
                        <h1>Order Summary</h1>
                    
                        <h2>Image Sent<span class="icon-checkmark2 fl_rt txt_sec_m m_s_top"></span></h2>
                    
                    </div>
                   
                   <div class="underline_solid"></div>
                   
                   <div class=" p_l_right p_l_left p_l_bottom">
                     
                        <div class="txt_sm">
                        
                            <p>Your image will be sent to your email address.<span class="icon-camera fl_rt"></span></p>
                                                       
                		</div>
                    
                   </div>
                    
                   <div class="clearfix"></div>
                   
                   <br/><br/><br/><br/><br/>
                        
                   <div class="underline_solid m_l_top"></div>
                    
                   <div class="clearfix bg_fa p_l">
                        <p class="txt_sm m_l_bottom"><span class="icon-phone fl_lt m_l_right m_s_top"></span>1300 728 972<br /></p>
                        <p class="txt_sm"><span class="icon-mail fl_lt m_l_right m_s_top"></span> enquires@advancedlife.com.au<br /></p>
                   </div>
                   
            </main>
        
            <aside id="sec_wrapper" class="_30_m shadow_left tablet_view border-left">
              
                <div class="block_ntl p_l_left p_l_right p_l_bottom p_l_top">
                    <h3>Continue Shopping<span class="fl_rt icon-gift"></span></h3>
                    <p>Add more items to your cart.</p>
                    <a href="" class="round_sd border_box button inline_block txt_sm link_button index"><span class="icon-forward txt_fff m_m_right"></span>Continue Shopping</a>
                </div>				<!-- aside checkout -->
    
                <ul class="links _p_m links_line_left">
                    <li><a href="#" class="downloads">Portrait Downloads<span class="icon icon-camera fl_rt"></span></a></li>
                    <li><a href="#" class="group_img">Group Photos<span class="icon icon-group fl_rt"></span></a></li>
                    <li><a href="#" class="gift_items">Gift Items<span class="icon icon-gift fl_rt"></span></a></li>
                    <li><a href="#" class="packages">Photography Packages<span class="icon icon-paper fl_rt"></span></a></li>
                    <li><a href="#" class="contact_us">Contact Us<span class="icon icon-mail fl_rt"></span></a></li>
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
                    <p>We have made a commitment to build and expand each student's image archive, as we share their journey through their school years.</p>
                </div>
                
                <div class="fl_rt _33_m img_banner m_l_top m_l_bottom"></div>
        	
            </div>
            
        </section>
    
    </div>																	<!-- clear section -->
    
    <footer>
    
        <section class="p_l_top p_m">
        
            <img src="svg/logo_fff.svg" class="clearfix m_l_top m_l_bottom" alt="" />
            
            <p>We are a proudly Australian family owned and operated business with over 30 years experience.</p>
                
            <div class="underline_dotted m_l_top m_l_bottom"></div>
            
            <span class="_33_m p_l txt_sm">
                <a href="#" class="contact_us"><span class="icon-inline icon-mail txt_lg txt_fff"></span><span class="event_email">CONTACT US</span></a>
            </span>
            <span class="_33_m p_l txt_sm">
                <a href="#" class="contact_us"><span class="icon-inline icon-phone txt_lg txt_fff"></span><span class="event_phone">1300 728 972</span></a>
            </span>
            <span class="_33_m p_l txt_sm">
                <a href="#" class="index"><span class="icon-inline icon-home txt_lg txt_fff"></span><span class="event_address">HOME</span></a>
            </span>
            <div class="clearfix"></div>
            
            <div class="underline_dotted m_l_top m_l_bottom"></div>
            
            <p>school photography &sdot; sports &amp; event photography &sdot; commercial printing &amp; design services</p>
            <p>© advancedlife 2014</p>
            
        </section>
    
    </footer>																	<!-- footer -->
    
    <div id="to_top" class="hidden">
    	<a href="#"><span class="icon-arrow-up m_m"></span></a>
    </div>																	<!-- to top -->

    <div id="additional_content" class="p_xl border_box align_ct">
       
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-cross txt_lg txt_ntl_m fl_rt"></span></a></section>
       	
       <img class="absolute_vert_center opacity_0" src="svg/loading/loader_grey.gif" style="height:1.8em" alt="" />

       <section id="additional_wrap" class="relative align_lt clearfix"></section>
       
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-arrow-up txt_lg txt_ntl_m fl_rt"></span></a></section>
        
    </div>																	<!-- Additional Content -->

    <div id="menu_lg" class="p_xl _30_m border_box">
    	
        <section>
        
            <h2>MENU<a href="#"><span class="icon-cross txt_ntl_m menu_lg_toggle fl_rt"></span></a></h2>
        	
            <div class="underline_solid m_l_top"></div>
            
            <ul class="links no_indent clearfix links_line_right border_box _33_m p_l_right">
            
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
            
            <ul class="links no_indent clearfix  links_line_right border_box _33_m p_l_right">
                
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
            
            <div class="clearfix"></div>
        	    
            <h2><a href="#" class="menu_help_toggle"><span class="icon-arrow-up txt_ntl_m fl_rt"></span></a></h2>
        
        </section>
        
    </div>																	<!-- menu_lg -->

</form>

   <script type="text/javascript">

	$(document).ready(function(){
        		
		//Added links script from cart page - Arlen
		// ====================================================== // 								// 			Make Links Work
		
		function CreateLinks(){
			
			var data =  eval("[" + document.getElementById('hFirstImgPortrait').value + "]");
			var sic = data[0].SIC;
			
			$('.index').attr( 'href' , 'index.aspx?SIC=' + sic );
			$('.downloads').attr( 'href' , 'downloads.aspx?SIC=' + sic );
			$('.group_img').attr( 'href' , 'group_img.aspx?SIC=' + sic );
			$('.packages').attr( 'href' , 'packages.aspx?SIC=' + sic );
			$('.gift_items').attr( 'href' , 'gift_items.aspx?SIC=' + sic );
			$('.payment').attr( 'href' , 'payment.aspx?SIC=' + sic );
			$('.thank_you').attr( 'href' , 'thank_you.aspx?SIC=' + sic );
			$('.cart').attr( 'href' , 'cart.aspx?SIC=' + sic );
			$('.contact_us').attr( 'href' , 'contact_us.aspx?SIC=' + sic );
			
		};
		
		CreateLinks();
		
    });
    </script>
   
</body>

</html>
