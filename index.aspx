<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_index, App_Web_-tibnddc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->

    <title>School Photos</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

    <!-- GRUNT FILES -->
    <!-- 
	<script type="text/javascript" src="js/style.js?v1.1"></script>
	<script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>
    -->
    <script type="type/javascript" src="lib/src/js/jquery.cycle2.min.js"></script>
    <script type="type/javascript" src="lib/src/js/server-query.js"></script>
    <script type="type/javascript" src="lib/src/js/build-links.js"></script>
    <script type="type/javascript" src="lib/src/js/page-style.js"></script>
    <script type="type/javascript" src="lib/src/js/to-top.js"></script>
    <script type="type/javascript" src="lib/src/js/menu-ctrls.js"></script>

    <!-- <script type="type/javascript" src="lib/prod/project.js?v1.1"></script> -->

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
    
    <!-- If IE  -->
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->
	
</head>

<body oncopy="return false" oncontextmenu="return false">

    <input id="hSchoolData" runat="server" type="hidden"/> 				  	
    <input id="hBannerImages" runat="server" type="hidden"/> 		
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> 
    <input id="hFirstImgGroup" runat="server" type="hidden"/>    
    <input id="hPortraitData" runat="server" type="hidden" />
    <input id="hGroupData" runat="server" type="hidden" /> 
    
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
        
            <ul class="inline fl_lt desktop_view">
                <li><a href="index.aspx" class="nav_selected index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
            
             <ul class="inline fl_rt">
                <li>
                	<a id="cart" runat="server" class="cart" href="~/cart.aspx">
                    <span class="icon icon-cart txt_md txt_ntl m_l_right"></span><asp:label runat="server" id="lblTotal"></asp:label><asp:label runat="server" id="lblTotAmt">0.00</asp:label>
                    <asp:label runat="server" id="lblItems">( </asp:label><asp:label runat="server" id="lblQty"> 0</asp:label><asp:label runat="server" id="lblQty1"> )</asp:label>
                    </a>
                </li>
            </ul>
            
        </section>
    </nav>																	<!-- Nav -->

    <div id="document" class="bg_fff prm_lt">
        <section>
        
            <aside class="_30_m tablet_hide">
            
            	<div class="side_nav border_box round_sd bg_fff">
                
                    <div class="title_nav prm pattern">
                        <img id="aside-icon" class="fl_lt img_latest m_l_right" src="" alt="" />
                    </div>
                    
                    <div class="p_m_left p_m_right">    
                        <h3 class="txt_sm"><span class="name_full"></span></h3>
                        <span class="txt_xs">My Services</span>
                    </div>
                    
                    <div class="underline_arrow m_l_top"></div>
                    
                    <ul class="links _p_m links_line_left">
                        <li><a id="download1" runat="server" href="#" class="">Portrait Downloads<span class="icon icon-camera fl_rt"></span></a></li>
                        <li><a id="group1" runat="server" href="#" class="">Group Photos<span class="icon icon-group fl_rt"></span></a></li>
                        <li><a id="gift1" runat="server" href="#" class="">Gift Items<span class="icon icon-gift fl_rt"></span></a></li>
                        <li><a id="package1" runat="server" href="#" class="">Photography Packages<span class="icon icon-paper fl_rt"></span></a></li>
                    </ul>
                    
                    <div class="align_ct p_m block_ntl"><a href="#" class="additional_link" data-link="help">Need Help?</a></div>
                    
                </div>
                
            	<div class="side_nav _border_box round_sd m_l_top bg_fff tablet_view">
                	<div class="title_ntl">
                    	Additional Links
                    </div>
                    <ul class="links _p_m links_line_left">
                        <li><a href="#" class="contact_us">Contact Us<span class="icon icon-mail fl_rt"></span></a></li>
                        <li><a href="#" class="additional_link" data-link="privacy">Privacy Information<span class="icon icon-lock_dk fl_rt"></span></a></li>
                        <li><a href="#" class="additional_link" data-link="bookmarks">Benefits of Bookmarking<span class="icon icon-book fl_rt"></span></a></li>
                        <li><a href="#" class="additional_link" data-link="help">Help Menu<span class="icon icon-question fl_rt"></span></a></li>
                    </ul>
                </div>
                
            </aside>
            
            <main class="_70_m clearfix m_l_bottom p_l_left_break phone_max">
            
            	<div class="main_wrapper _border_box round_sd bg_fff">
                
                    <div class="p_m_top p_l_left p_l_right border_box _80_s tablet_view">
                        <h1><span class="name_full"></span></h1>
                        <h2>My Photos</h2>
                    </div>
                
                    <div class="_20_s p_l border_box tablet_view">
                        <img id="logo_header" class="full _60_m school_logo tab_view fl_rt" alt="" style="width:6em;"/>
                    </div>
                    
                    <div class="clearfix"></div>
                    
                    <div class="underline_solid"></div>
                    
                    <div class="clearfix p_l_right p_l_left m_l_bottom">
                        
                        <ul id="portrait_images" class="m_l_top clearfix">
                        </ul>
                        
                        <div class="block_ntl p_m p_l_left p_l_right m_m_top txt_sm clearfix">
                        	<span class="inline_block fl_lt m_l_right">Images available for download through the 'Portrait Downloads' page.</span>
                        	<a href="#" class="txt_sm button fl_rt round_sd downloads link_button phone_max border_box"><span class="icon-forward txt_fff m_m_right"></span>VISIT PAGE</a>
                        </div>
                        
                        <div class="clearfix"></div>
                        
                        <li class="template_portrait hidden">
                        	<a href="#" class="round_sd downloads clearfix m_m_bottom">
                                <img class="portrait ease_sd" src="#" alt="" />
                            </a>
                            <h4></h4>
                        </li>															<!-- template -->
                    
                    </div>
                    
                    <div class="clearfix"></div>
                    
                    <div class="underline_solid m_l_top"></div>
                    
                    <div class="clearfix p_l_right p_l_left">
                        
                        <!-- <h3>Group Photos</h3>         -->
                        
                        <ul id="group_images" class="m_l_top clearfix">
                        </ul>
                        
                        <div class="block_ntl p_m p_l_left p_l_right m_m_top txt_sm clearfix">
                        	<span class="inline_block fl_lt m_l_right">Prints available for purchase through the 'Group Photos' page.</span>
                        	<a href="#" class="txt_sm button fl_rt round_sd group_img link_button phone_max border_box"><span class="icon-forward txt_fff m_m_right"></span>VISIT PAGE</a>
                        </div>
                        
                        <li class="template_group hidden border_ntl round_sd border_box">
                        	<a href="#" class="round_sd group_img clearfix m_m_bottom p_m_left p_m_right p_m_top">
                                <img class="ease_sd" src="#" alt="" />
                            </a>
                            <span class="clearfix m_m_bottom txt_prm_m"></span>
                        </li>															<!-- template -->
                        <a class="group_img"></a>
                    </div>
                    
                    <div class="underline_solid m_l_top"></div>
                    
                    <div class="clearfix"></div>
                    
                    <!-- <div class="p_l_left p_l_right p_m_top hidden">
                        <div class="tablet_view fl_rt _40_s img_banner m_l_bottom border_box m_l_left m_m_right m_m_top"></div>
                        <p><b>Welcome</b> to <span class="name_given"></span>'s advancedyou home page. You now have access to advancedlife's photos of <span class="name_full"></span>.</p>
                        <blockquote class="p_l_right"><p>advancedyou - "Capturing and storing your memories"</p></blockquote>
                    </div> -->
                    
                	<div class="clearfix" style="height:4em"></div>
                
                </div>
            
            </main>
            
            <div class="clearfix" style="height:4em"></div>
        
        </section>
        
        <div class="clearfix" ></div>
    </div>																	<!-- main -->																	<!-- banner -->
    
    <div class="clearfix p_l_top p_l_bottom desktop_view">
    	
        <section>
        	
            <div class="wrapper p_m"> 
            
                <div class="_66_m p_l_top p_l_bottom txt_emboss txt_sm sports_fff">
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
            <p>&copy; advancedlife 2014</p>
            
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
    
    <!-- <span>
        <div id="testing_phone">
        </div>
        <div id="testing_tablet">
        </div>
        <div id="testing_desktop">
        </div>
        <div id="testing_desktop_lg">
        </div>
	</span> -->

<script>

// INITIALISE THE CANVAS APP
$(function()
{
    //  PORTRAITS                                   
    var portraits = {
                    // schoolData :   eval("[" + document.getElementById('hSchoolData').value + "]"),
                    data  :  eval("[" + document.getElementById('hPortraitData').value + "]"), 
                    
                    // ============================== //                                                    //====== Function
                    
                    list : function()
                    {
                        
                        for(var i  = 0; i < this.data.length; i++){
                            
                            var PortraitLink = 'https://advancedimage.com.au/lifebuyimages//' + this.data[i].DstImage;
                            var li = $('.template_portrait').clone();
                            
                            li.removeClass('template_portrait hidden');
                            li.find('img').attr('src',PortraitLink);
                            li.find('h4').html(this.data[i].YearPhoto);
                            
                            $('#portrait_images').append('\n\r');
                            $('#portrait_images').append(li);
                            
                        }
                        
                        var spacer = document.createElement('div');
                        spacer.setAttribute('class','stretch');
                        $('#portrait_images').append(spacer);    
                    },
                
                    //=================================================//                                    Watermarking Images 
                                            
                    Watermark : function()
                    {
                            var overlay = document.createElement('img');
                            
                            function setAttributes(el, attrs)
                            {
                                for(var key in attrs)
                                {
                                    el.setAttribute(key, attrs[key]);
                                }
                            }
                            
                            setAttributes(overlay, {'src':'img/overlay.png','alt':'','class':'overlay'});
                            $(overlay).css({'top': '35%','left': '25%', 'margin': '0','width':'50%','pointer-events':'none'});
                            
                            $('#portrait_images').children('li').append(overlay);
                    },
                
                    //=================================================//                                    //===== Label 
                                            
                    Label : function()
                    {
                        
                            var CurrentCost = parseInt(this.data[0].Cost);
                            var icon = document.createElement('img');
                            $(icon).css({'top': '0','left': '0', 'margin': '0','width':'60%','position':'absolute','z-index':'10','pointer-events':'none'});
                            
                            switch (CurrentCost){
                                
                                case 20 :
                                    $(icon).attr('src','img/icons/new_image.png');
                                break;
                                    
                                case 0 :
                                    $(icon).attr('src','img/icons/free_image.png');
                                break;
                                
                            };
                            
                            $('#portrait_images li:first').append(icon);   
                    },
                    
                    // ==================================== //                                  //      Portrait Banner
                    
                    banner : function()
                    {
                        for(var i  = 0; i < this.data.length; i++){
                            
                            var path = 'https://advancedimage.com.au/lifebuyimages//' + this.data[i].DstImage;
                            var img = document.createElement('img');//.attr('src',path); // .addClass('full border_ntl');
                            $(img).addClass('full border_ntl').attr('src',path);
                            //$img.addClass('full border_ntl').attr('src',path);
                            //var imageObject = "<img class=\"full border_ntl \" src=\"" + bannerPathway + "\"" + " alt=\"\" style=\"padding:.2em\" />";
                            $('.portrait_banner').append(img);

                        }       
                    },
                    
                    //=================================================//                                    Watermarking Images 
                                            
                    overlay : function(el)
                    {
                        var overlay = document.createElement('img');
                        
                        function setAttributes(el, attrs)
                        {
                            for(var key in attrs){
                                el.setAttribute(key, attrs[key]);
                            }
                        }
                        
                        setAttributes(overlay, {'src':'img/overlay.png','alt':'','class':'overlay'});
                        $(overlay).css({'top': '50%','left': '25%', 'margin': '0','width':'50%','pointer-events':'none','z-index':'10'});
                        $(el).prepend(overlay);
                    },              
    }
    
    // GROUPS
    var groups = {
                    data  :  eval("[" + document.getElementById('hGroupData').value + "]"), 
                
                    list : function(){
                        
                        var strLength = this.data.length;
                        var currentYear = new Date().getFullYear();
                        
                        for(var i  = 0; i < strLength; i++){                                                            // this.data.length
                            
                            if( i <= 5 ){
                                var GroupLink = 'https://advancedimage.com.au/lifebuyimages//' + this.data[i].ClientID + '/' + this.data[i].SubFolder + '/' + this.data[i].fileName ;
                                var li = $('.template_group').clone();
                                
                                li.removeClass('template_group hidden');
                                li.find('img').attr('src', GroupLink);
                                
                                var list_date = this.data[i].dateOfPhotography,
                                    date = list_date.substr(list_date.length - 4);
                                                
                                li.find('span').html(date);
                                
                                $('#group_images').append('\n\r');
                                $('#group_images').append(li);
                                
                                if(date == currentYear){
                                    var icon = document.createElement('img');
                                    $(icon).css({'top': '0','left': '0', 'margin': '0','width':'40%','position':'absolute','z-index':'10','pointer-events':'none'});
                                    $(icon).attr('src','img/icons/new_image.png');
                                    $(li).append(icon);
                                };
                                
                            };
                            
                        }
                        
                        var spacer = document.createElement('div');
                        spacer.setAttribute('class','stretch');
                        $('#portrait_images').append(spacer);
                        
                    }
    }
    
    portraits.list();
    portraits.Watermark();
    portraits.banner();
    portraits.Label();
    portraits.overlay('.watermark');
    groups.list();
    
    // START CYCLE FUNCTION

    $('.portrait_banner').cycle(
    {                                                           
        fx:'fade',          // Add effect here
        speed: 2000,
        timeout: 5000,      // milliseconds = 2.5 seconds
    }).css('z-index','5');

    var getTime = new ServerRequest('http://192.168.0.216/AdvAPI/api/CurrentDate', 'GET', null, function()
        {
            


        });
    
    /*
    GRUNT ROUTINES 
    
    1. MAKE LINKS WORK - ADD USER ID        - build-links.js
    2. PAGE STYLE - CHECK CSS STYLES ETC    - page-style.js
    3. EVENT MANAGER 
            - TO TOP        - to-top.js
            - WATERMARK     - watermark.js
            - MENU-CTRLS    - menu-ctrls.js
            - 
    
    LOCAL 
        - FINISHED LOADING      
        - MENU SLIDE DOWN
        - START CYCLE

    setTimeout(function()
    {
        $('header').css('margin-top','0px')
        setTimeout(function(){
            $('#opening_load').addClass('scale_hide');  
        },1000);
        
        setTimeout(function(){
            $('.img_banner').cycle({                                                            // initiate cycle
                fx:'fade',          // Add effect here
                speed: 2000,
                timeout: 5000,      // milliseconds = 2.5 seconds
            });
        },1000);
    },1600);    
    */


});

</script>

    
</body>
</html>