<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_index, App_Web_n88dlbps" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <title>School Photos</title>
    <link rel="shortcut icon" href="assets/img/camera.png"> 								    
    <link rel="stylesheet" href="lib/prod/screen.css?v1.1" />
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
    <input id="hUserId" runat="server" type="hidden" />
    
    <div id="opening_load" class="fixed_max bg_fff middle linear">
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
                <li><a href="index.aspx" class="nav_selected index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
            
             <ul class="inline fl_rt">
                <li>
                	<a id="cart" runat="server" class="cart" href="cart.aspx">
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
                        <li><a href="#" class="downloads">Portrait Downloads<span class="icon icon-camera fl_rt"></span></a></li>
                        <li><a href="#" class="group_img">Group Photos<span class="icon icon-group fl_rt"></span></a></li>
                        <li><a href="#" class="gift_items">Gift Items<span class="icon icon-gift fl_rt"></span></a></li>
                        <li><a href="#" class="packages">Photography Packages<span class="icon icon-paper fl_rt"></span></a></li>
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
        
            <img src="assets/svg/logo_fff.svg" class="clearfix m_l_top m_l_bottom" alt="" />
            
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
    

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
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
        portraitData = eval("[" + document.getElementById('hPortraitData').value + "]"),
        groupData = eval("[" + document.getElementById('hGroupData').value + "]");
</script>

<script>
// INITIALISE THE CANVAS APP
$(function()
{
    var url, urlLength, sicCode, hasId, portalType;

    // HIDE HEADER FOR NOW
    $('header').css('margin-top', '-3.8em');

    // PARSE URL 
    url = window.location.href;
    urlLength = url.length;
    sicCode = url.slice(url.search("aspx") + 4, url.length).replace('?SIC=', '').replace(/#/g, '');
    //hasId = sicCode.search('userId=');

    var startMenuControllers = new MenuControllers();
    var setupPageInfo = new PageInfo(schoolData, bannerImages, firstPortraitData, firstGroupData);
    var toTop = new ToTop('#to_top');
    
    // THE URL HAS NO ID SO WE NEED TO CREATE ONE
     /*
    if(hasId < 0 )
    {
        // ADD PORTAL END POINT FOR OUR USER
        if(schoolData[0].CssStyle == 'sports')
        {
            portalType = 'sports';
        }
        else if(schoolData[0].CssStyle == 'family')
        {
            portalType = 'family';
        } else {
            portalType = 'school';
        };

        console.log('this is the style of page: ', schoolData[0].CssStyle)

        // FROM WHERE END POINTS 
        // [Community-school] [Community-sports] [advancedyou-school] [advancedyou-sports] [advancedyou-family]
       
        var getTime = new ServerRequest('http://192.168.0.216/AdvAPI/api/CurrentDate', 'GET', null, function(time)
            {
                var newGuestInfo = {
                                        'isChanged': true,
                                        'isDeleted': false,
                                        'dateRequested': time, 
                                        'formWhere': '[advancedyou-' + portalType + ']'
                                };
                           
                var createGuest = new ServerRequest('http://192.168.0.216/AdvAPI/api/WGValues', 'POST', newGuestInfo, function(data)
                    {
                        userId = data.id;       

                        // SET COOKIE FOR PAYMENT PAGES 
                        alert(userId);
                        $('#hUserId').val(userId);
                        console.log($('#hUserId').val());
                        var buildLinks = new BuildLinks('?SIC=' + sicCode + '&userId=' + userId );   
                        var addPageStyle = new PageStyle(schoolData[0].CssStyle);
                        var pageIsLoaded = new PageIsLoaded();
                    });
            });               
    } else {
        // USER ID ALREADY ASSIGNED
        console.log('user id already assigned');

        userId = url.slice(url.search("userId=") + 7, url.length).replace(/#/g, '');
        $('#hUserId').val(userId);
        console.log($('#hUserId').val());

        var buildLinks = new BuildLinks('?SIC=' + sicCode );
        var addPageStyle = new PageStyle(schoolData[0].CssStyle);        
        var pageIsLoaded = new PageIsLoaded();
    }
    */
    
    // USER ID ALREADY ASSIGNED
    //console.log('user id already assigned');

    //userId = $('#hUserId').val();
    
    //var buildLinks = new BuildLinks('?SIC=' + sicCode + '&userId=' + userId);
    var buildLinks = new BuildLinks('?SIC=' + sicCode);
    var addPageStyle = new PageStyle(schoolData[0].CssStyle);        
    var pageIsLoaded = new PageIsLoaded();    
        
    var indexPage = new IndexPage(portraitData, groupData);
});
</script>
    
</body>
</html>