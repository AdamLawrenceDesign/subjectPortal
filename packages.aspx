<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_packages, App_Web_-tibnddc" %>	

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->

    <title>Subject Portal | Profile</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link type="text/css" href="css/jquery.jscrollpane.css" rel="stylesheet" media="all" />				<!-- styles needed by jScrollPane -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/packages_data.js?v1.2"></script>
    <script type="text/javascript" src="js/style.js?v1.1"></script>
    
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
	
    <script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>
	
</head>

<body oncopy="return false" oncontextmenu="return false">
<form id="form1" runat="server">  
                    
  	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager><!--asp ajax element--->
    
    <input id="hSchoolData" runat="server" type="hidden"/> 									<!-- Client Information-->
    <input id="hBannerImages" runat="server" type="hidden"/> 								<!-- Banner Images-->
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> 							<!-- First Portrait Image-->
    <input id="hFirstImgGroup" runat="server" type="hidden"/> 								<!-- First Group Image-->																<!-- Nav -->
    <input id="hData" runat="server" type="hidden"/> 										<!-- Subject Package Information-->
    
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
       <ProgressTemplate>
            <div class="fixed_max linear ease_sd opacity_fff_9 top_max">
                <div class="absolute_vert_center inline" style="height:5em;">
                    <img src="svg/loading/loader_grey.gif" alt="" />
                    <h2 class="txt_sm m_m_top">ADDING TO CART</h2>
                </div>
            </div>															
       </ProgressTemplate>
    </asp:UpdateProgress>		

    <div id="opening_load" class="fixed_max bg_fff linear top">
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
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="nav_selected packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
            
                     
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
            <ContentTemplate>    
            <ul class="inline fl_rt">
               <li>
                    <a id="cart" runat="server" class="cart" href="cart.aspx">
                        <span class="icon icon-cart txt_md txt_ntl m_l_right"></span><asp:label runat="server" id="lblTotal"></asp:label><asp:label runat="server" id="lblTotAmt">0.00</asp:label>
                        <asp:label runat="server" id="lblItems">( </asp:label><asp:label runat="server" id="lblQty"> 0</asp:label><asp:label runat="server" id="lblQty1"> )</asp:label>
                    </a>
               </li>
            </ul>
            </ContentTemplate>
            </asp:UpdatePanel>
            
        </section>
    
    </nav>																	<!-- Nav -->

    <div id="document" class="prm_lt">
    	
        <section class="clearfix bg_fff round_sd border_box m_l_bottom">
            
            <main class="_70_m clearfix m_l_bottom relative border-right">
					
                    <img class="load_item hidden" src="svg/loading/loader_grey.gif" alt="" style="top:8em;bottom:auto"/>
                    
                    <div id="landing"><!--  class="hidden" -->
                    
                        <div class="p_l  border_box">
                            <h1>Photography Packages</h1>
                            <h2><span><span class="name_given"></span>'s School Days</span><span class="fl_rt icon-paper"></span></h2>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="underline_solid tablet_view"></div>
                        
                        <!-- <img src="svg/loading/loading-spokes.svg" alt="" style="background:#ddd" /> -->
    
                        <div id="products">
    
                            <div id="wrapper0" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative ease_fast">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif" alt=""/> 
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                  
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">    
                                 <ContentTemplate>      
                                    <asp:button id="Cart0" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart0_click" style="background:#6caddf;font-size:.8em"></asp:button><!--  style="background:#6caddf" -->
                                    <input id="CartInfo0" runat="server" type="hidden" value="" />
                                 </ContentTemplate>
                                </asp:UpdatePanel>

                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 0 -->
                            
                            <div id="wrapper1" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                 <asp:UpdatePanel ID="UpdatePanel13" runat="server">    
                                 <ContentTemplate>     
                                    <asp:button id="Cart1" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart1_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo1" runat="server" type="hidden" value="" />
                                  </ContentTemplate>
                                  </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 1 -->
                            
                            <div id="wrapper2" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                 <asp:UpdatePanel ID="UpdatePanel3" runat="server">    
                                 <ContentTemplate>   
                                    <asp:button id="Cart2" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart2_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo2" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>

                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 2 -->
                            
                            <div id="wrapper3" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel4" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart3" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart3_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo3" runat="server" type="hidden"/>
                                  </ContentTemplate>
                                  </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 3 -->
                            
                            <div id="wrapper4" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel5" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart4" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart4_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo4" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>

                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 4 -->
                            
                            <div id="wrapper5" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel6" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart5" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart5_click" style="background:#6caddf;font-size:.8em"></asp:button><!-- run_at="server" -->
                                    <input id="CartInfo5" runat="server" type="hidden"/>      
                                 </ContentTemplate>
                                 </asp:UpdatePanel>

                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 5 -->
                            
                            <div id="wrapper6" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel7" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart6" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart6_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo6" runat="server" type="hidden"/>
                                  </ContentTemplate>
                                  </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 6 -->
                            
                            <div id="wrapper7" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel8" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart7" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart7_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo7" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 7 -->
                            
                            <div id="wrapper8" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em"/>
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                 <asp:UpdatePanel ID="UpdatePanel9" runat="server">    
                                 <ContentTemplate>  
                                    <asp:button id="Cart8" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart8_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo8" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 8 -->
                            
                            <div id="wrapper9" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                   
                                 <asp:UpdatePanel ID="UpdatePanel10" runat="server">    
                                 <ContentTemplate>  
                                    <asp:button id="Cart9" runat="server" Text="ADD TO CART" CssClass="bg_sec round_sd border_box button cart_add m_m_bottom _50_m" OnClick="Cart9_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo9" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 9 -->
                            
                            <div id="wrapper10" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel11" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart10" runat="server" Text="ADD TO CART" CssClass="asp_element add_to_cart button_dk p_m fl_rt round_sd align_ct txt_xs _50_m" OnClick="Cart10_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo10" runat="server" type="hidden"/>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 10 -->
                            
                            <div id="wrapper11" class="clearfix hidden p_m_top" data-lookUp="">
                            
                                <div class="_40_m p_m_top p_l_left relative">
                                    <div class="subject_portrait _50_s p_l_left relative fl_none">
                                        <img class="full border_ntl" src="#" alt="" />
                                    </div>
                                    <img class="package_icon border_box _40_s" src="#" alt="" style="position:absolute;width:50%;bottom:1em;right:.5em" />
                                </div>
                                
                                <div class="_60_m p_m_left p_l_right">
                                
                                	<div class="package_info_wrapper relative">
                                    	
                                    	<img class="load_item hidden" src="svg/loading/loader_grey.gif"/>
                                    
                                        <h3><span class="pack_year">2014</span> | <span class="pack_type">Photobook</span> Package </h3>
                                        <h4><span class="pack_title">Regular Package</span><span class="fl_rt txt_red price">$ 55.00</span></h4>
                                        <p class="txt_xs"><span class="package_info"></span>  <a href="#" class="additional_link txt_sm" data-link="packages"><b>MORE INFORMATION</b></a></p>
                                    
                                    </div>
                                    
                                    <div class="underline_solid"></div>
                                    
                                    <p class="txt_xs tablet_view">Change Package Type</p>
                                    
                                    <div class="p_l_right _50_m tablet_view">
                                        <span class="input_area_select txt_xs border_ntl round_sd relative">
                                            <select class="change_pack_type" data-year="" >
                                            	<option value="2">Select</option>
                                                <option value="0">Deluxe Package</option>
                                                <option value="1">Value Package</option>
                                                <option value="2">Regular Package</option>
                                                <option value="3">Basic Package</option>
                                                <option value="4">Group Only</option>
                                                <option value="5">Portrait Only</option>
                                            </select>
                                            <label class="icon-arrow_full_down border_box"></label>
                                        </span> 
                                    </div>
                                    
                                 <asp:UpdatePanel ID="UpdatePanel12" runat="server">    
                                 <ContentTemplate> 
                                    <asp:button id="Cart11" runat="server" Text="ADD TO CART" CssClass="asp_element add_to_cart button_dk p_m fl_rt round_sd align_ct txt_xs _50_m" OnClick="Cart11_click" style="background:#6caddf;font-size:.8em"></asp:button>
                                    <input id="CartInfo11" runat="server" type="hidden"/>
                                  </ContentTemplate>
                                  </asp:UpdatePanel>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="underline_solid m_l_top"></div>
                            
                            </div>										<!-- wrapper 11 -->
                        
                        </div>
					
                    </div>                	
                    
                    <div class="clearfix" style="height:1em"></div>
                    
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
                        	
                        <!-- 			Alternative Options
                        <div class="title_ntl align_lt">
                            Top Sellers
                        </div>
            
                        <div class="link clearfix shadow_left" style="border-left:1px solid #ddd">
                        
                                <div class="p_m clearfix add_item">
                                    <h4>ALL IMAGES</h4>
                                    <p>High Resolution Download</p>
                                    <strike class="all_strike">$ 42.00</strike>
                                    <span class="image_name all_price" style="color:red"> &nbsp;$ 22.00</span><br/>
                                    <a class="txt_sm m_l_top"><span class="txt_sm">INFORMATION</span></a>
                                    
                                        <button class="bg_sec button_sd _100 m_l_top square">ADD TO CART</button>
                                </div>
                                
                                <div class="underline_solid m_l_top m_l_bottom"></div>
                                
                                <div class="p_m clearfix align_ct">
                                    <a href="event_sponsorship.html">
                                        <img src="img/subject_img/groups/2T_2010.jpg" class="preview_pack full" alt=""/>
                                        <p><span>Sports Images</span></p>
                                        <span class="txt_sm">View latest</span>
                                    </a>
                                </div>
                                
                                <div class="underline_solid m_l_top m_l_bottom"></div>
                                
                                <div class="p_m clearfix align_ct">
                                    <a href="event_sponsorship.html">
                                        <img src="img/pack.jpg" class="full preview_pack" alt=""/>
                                        <p><span>Photography Packages</span></p>
                                        <span class="txt_sm">Past years available</span>
                                        <p>Click Here</p>
                                    </a>
                                </div>
                            
                        </div>
                        -->
                        
                  </aside>
                  
            <div class="clearfix"></div>
        
        </section>
        
        <div class="clearfix" style="height:4em"></div>

    </div>																	<!-- main -->																	<!-- banner -->
    
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
        <div id="testing_phone"></div>
        <div id="testing_tablet"></div>
        <div id="testing_desktop"></div>
        <div id="testing_desktop_lg"></div>
	</span> -->
    
  </form> 

</body>
</html>