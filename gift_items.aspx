<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_giftItems, App_Web_6uoppshz" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <title>Subject Portal | Downloads</title>
    <link rel="shortcut icon" href="img/camera.png"> 								
    <link rel="stylesheet" href="lib/prod/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'/>
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->	
<style>
    #loading-main
    {
        position:absolute;
        top:10em;
        bottom:auto;
        left: 0;
        right:0;
        margin:auto;
        width:1.5em;
        height:1.5em;
        background-image: url('img/loading.gif');
        background-size: 100%;
        opacity: 0;
        z-index: 100;
    }

    *, .b_b 
    {
      /*  Stop Text form being highlighted  */
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -khtml-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      -o-user-select: none;
      user-select: none;
      -webkit-box-sizing: border-box;
      /* ========= tried applying to all but caused problems with clearfix ========= */
      -moz-box-sizing: border-box;
      box-sizing: border-box; 
    }

	#results a:hover
	{
		color: #4bc9bd;
	}
	
	#resultsItemName li, #resultsGroupName li
	{
		-webkit-transition: all 0.5s ease-in-out;
		-moz-transition: all 0.5s ease-in-out;
		-o-transition: all 0.5s ease-in-out;
		transition: all 0.5s ease-in-out;
	}
	
	#resultsItemName li:hover, #resultsGroupName li:hover 
	{
		-webkit-box-shadow: 0px 0px 6px 0px rgba(50, 50, 50, 0.25);
		-moz-box-shadow: 0px 0px 6px 0px rgba(50, 50, 50, 0.25);
		box-shadow: 0px 0px 6px 0px rgba(50, 50, 50, 0.25);
	}
	
    ul.inline li 
	{
		float: left;
		display: inline-block;
		position: relative;
		padding: 0;
	}
	
	.thirds li
	{
		width: 33%;
		height: auto;
	};
</style>
</head>

<body oncopy="return false" oncontextmenu="return false">
<form id="Form1" runat="server" >
    <input id="hBannerImages" runat="server" type="hidden"/> 
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> 
    <input id="hFirstImgGroup" runat="server" type="hidden"/> 													
    <input id="hSchoolData" runat="server" type="hidden"/> 
	
    <!-- Paste ASP Items not pad -->  
               
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager><!--Arlen added Update ASP Ajax-->  
    
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
                <li><a href="#" class="index"><span>Home</span></a></li>
                <li><a href="#" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="#" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="#" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="#" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
            <ContentTemplate>    
            <ul class="inline fl_rt">
               <li>
                    <a id="cart" runat="server" class="cart" href="#">
                        <span class="icon icon-cart txt_md txt_ntl m_l_right"></span><asp:label runat="server" id="lblTotal"></asp:label><asp:label runat="server" id="lblTotAmt">0.00</asp:label>
                        <asp:label runat="server" id="lblItems">( </asp:label><asp:label runat="server" id="lblQty"> 0</asp:label><asp:label runat="server" id="lblQty1"> )</asp:label>
                    </a>
               </li>
            </ul>
            </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </nav>												
    
    <div id="document" class="p_l_bottom prm_lt m_l_bottom">
       <section class="clearfix bg_fff border_ntl round_sd">
            <main class="_70_m relative border-right clearfix">                    
                <div class="m_l_left m_l_right m_l_top clearfix">
                    <h2>Gift Items<span class="icon-gift fl_rt m_s_top"></span></h2>                  
                </div>
              
                <div class="underline_solid"></div>
                
                <span class="fl_lt m_l_left m_m_top" >
                    <a href="#" class="txt_sm productsLink">Products</a> > 
                    <a href="#" class="txt_sm productLabel"></a> 
                    <a href="#" class="txt_sm layoutLabel hidden"> > Layouts</a> 
                </span>
                
                <div class="clearfix"></div>
                
                <ul id="resultsItemName" class="justify thirds inline clearfix p_l" data-active="true">
                </ul>
                
                <ul id="resultsGroupName" class="justify thirds inline clearfix p_l" data-active="false">
                </ul>                    

                <ul id="resultsLayouts" class="justify thirds inline clearfix p_l" style="display:none" data-active="false">
                </ul>

                <div id="templates" class="hidden">
                    <li id="templateItemName" class="m_m_top m_m_bottom clearfix align_ct">
                        <a href="#">
                            <img class="_100 p_l" src="" alt="" />
                            <div class="p_m _100 txt_xs"><span class="itemName p_m_top"></span></div>
                        </a>
                    </li>
                    <li id="templateGroupName" class="m_m_top m_m_bottom clearfix align_ct">
                        <a href="#">
                            <img class="_100 p_l" src="" alt="" />
                            <span class="txt_sm">
                            <b><span class="description"></span></b><br/>
                            <span class="groupName"></span><br/>
                            <span class="txt_red price"></span>
                            </span>
                        </a>
                    </li> 
                    <li id="templateLayoutName" class="m_m_top m_m_bottom clearfix align_ct">
                        <a href="#">
                            <img class="_100 p_l" src="" alt="" />
                            <span class="txt_sm">
                                <!-- <b><span class="description"></span></b><br/> -->
                                <span class="groupName"></span><br/>
                                <span class="txt_red price"></span>
                            </span>
                        </a>
                    </li>                                            
                </div>

                <div id="loading-main"></div>

            </main>    
                
            <aside id="sec_wrapper" class="_30_m shadow_left tablet_view">
                    <div class="block_ntl p_l_left p_l_right p_l_bottom p_l_top">
                        <h3>Checkout<span class="fl_rt icon-cart"></span></h3>
                        <p>Proceed to checkout!</p>
                        <a href="" class="round_sd border_box button inline_block txt_sm link_button cart"><span class="icon-forward txt_fff m_m_right"></span>VIEW CART</a>
                    </div>				<!-- aside checkout -->
              
                    <div class="p_l_left p_l_right">    
                        <p>Services</p>
                    </div>
                    
                    <div class="underline_arrow m_l_top"></div>
                    
                    <ul class="links _p_m links_line_left">
                        <li><a href="#" class="downloads">Portrait Downloads<span class="icon icon-camera fl_rt"></span></a></li>
                        <li><a href="#" class="group_img">Group Photos<span class="icon icon-group fl_rt"></span></a></li>
                        <li><a href="#" class="gift_items">Gift Items<span class="icon icon-gift fl_rt"></span></a></li>
                        <li><a href="#" class="packages">Photography Packages<span class="icon icon-paper fl_rt"></span></a></li>
                    </ul>
                    
                    <div class="align_ct p_m block_ntl"><a href="#" class="additional_link" data-link="help">Need Help?</a></div>
            
                    <div class="border_box">
                        <ul class="links _p_m links_line_left">
                            <li><a href="#" class="contact_us">Contact Us<span class="icon icon-mail fl_rt"></span></a></li>
                            <li><a href="#" class="additional_link" data-link="privacy">Privacy Information<span class="icon icon-lock_dk fl_rt"></span></a></li>
                            <li><a href="#" class="additional_link" data-link="bookmarks">Benefits of Bookmarking<span class="icon icon-book fl_rt"></span></a></li>
                            <li><a href="#" class="additional_link" data-link="help">Help Menu<span class="icon icon-question fl_rt"></span></a></li>
                        </ul>               
                    </div>            
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
    </div>																	
    
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
            <p>© advancedlife 2014</p>
            
        </section>
    </footer>														
    
    <div id="to_top" class="hidden">
    	<a href="#"><span class="icon-arrow-up m_m"></span></a>
    </div>															

    <div id="additional_content" class="p_xl border_box align_ct">
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-cross txt_lg txt_ntl_m fl_rt"></span></a></section>
       <img class="absolute_vert_center opacity_0" src="assets/svg/loading/loader_grey.gif" style="height:1.8em" alt="" />
       <section id="additional_wrap" class="relative align_lt clearfix"></section>
       <section class="clearfix"><a href="#" class="collapse"><span class="icon-arrow-up txt_lg txt_ntl_m fl_rt"></span></a></section>
    </div>															

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
    </div>															  
</form>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="lib/prod/project.min.js?v1.1"></script>
<script type="text/javascript" src="lib/src/js/masonry.pkgd.min.js?v1.1"></script>
<script type="text/javascript" src="lib/src/js/list-builder.js?v1.1"></script>

<script>
    var todaysDate, sic, userId, 
        schoolData = eval("[" + document.getElementById('hSchoolData').value + "]"),
        bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]"),
        firstPortraitData = eval("[" + document.getElementById('hFirstImgPortrait').value + "]"), 
        firstGroupData = eval("[" + document.getElementById('hFirstImgGroup').value + "]"), 
        portraitData = null,
        groupData = null;
</script>

<script>
// INIT THE APP
$(function()
{
    // HIDE HEADER FOR NOW
    $('header').css('margin-top', '-3.8em');

    var website, userId, id1, id2, id3, firstName, lastName, type, webLink, type,
        products = [],
        distinctNames = [],
        groupName, url;

    var url, urlLength, sicCode, hasId, portalType;

    // PARSE URL 
    url = window.location.href;
    urlLength = url.length;
    sicCode = url.slice(url.search("aspx") + 4, url.length).replace('?SIC=', '').replace(/#/g, '');
    userId = url.slice(url.search("userId=") + 7, url.length).replace(/#/g, '');

    var startMenuControllers = new MenuControllers();
    var setupPageInfo = new PageInfo(schoolData, bannerImages, firstPortraitData, firstGroupData);
    var toTop = new ToTop('#to_top');

    // ADD PORTAL END POINT FOR OUR USER   END POINTS   [Community-school] [Community-sports] [advancedyou-school] [advancedyou-sports] [advancedyou-family]
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

    // USER ID ALREADY ASSIGNED
    //userId = url.slice(url.search("userId=") + 7, url.length).replace(/#/g, '');

    var buildLinks = new BuildLinks('?SIC=' + sicCode );
    var addPageStyle = new PageStyle(schoolData[0].CssStyle);        
    var pageIsLoaded = new PageIsLoaded();

    url = window.location.href;
    groupName = url.substr(url.search("html?") + 5, url.length);

    $('#resultsGroupName').css('display','none');

    var userData = firstPortraitData; 

    website = 'advancedyou-' + portalType;
    type = 'newCartItem';               // type = 'cartItem';
    webLink = 'SIC=' + id1; 

    userInfo = {
                'userId': userId,
                'id1' : userData[0].SIC,                      // WHEN DOING THIS FOR THE COMMUNITY PORTAL USE THE ENCRYPTED LINK
                'id2' : userData[0].PrimarySubjectID,
                'id3' : schoolData[0].CssStyle,
                'firstName' : userData[0].FirstName,
                'lastName' : userData[0].LastName,                      
        };

    var getDistinctItemName = new ServerRequest('http://192.168.0.216/AdvAPI/api/WCAPValues/Photocreate/DistinctItemName', 'GET', null, function(data)
        {
            var loadFirstLevel = new BuildList(null, website, userInfo, type, data);
        });

    // console.log('user id: ', userId)

});
</script>

</body>
</html>