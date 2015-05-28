<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_groupImg, App_Web_-tibnddc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <title>Subject Portal | Group Photos</title>
    
    <link rel="shortcut icon" href="img/camera.png">								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <!-- <link rel="stylesheet" href="css/popUp.css"/> --><!--Arlen added popup-->
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    
    <script type="text/javascript" src="js/group_img.js?v1.1"></script>
    <link type="text/css" href="css/jquery.jscrollpane.css" rel="stylesheet" media="all" />				<!-- styles needed by jScrollPane -->
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>							<!-- the jScrollPane script -->
    <script type="text/javascript" src="js/style.js?v1.1"></script>
	<script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
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

</head>

<body oncopy="return false" oncontextmenu="return false">

<form id="Form1" runat="server">  
                
    <input id="hSchoolData" runat="server" type="hidden"/> 				      <!--Client Information-->
    <input id="hBannerImages" runat="server" type="hidden"/> 			      <!--Banner Images-->
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> 		      <!--First Portrait Image-->
    <input id="hFirstImgGroup" runat="server" type="hidden"/> 				  <!--First Group Image-->	    
    <input id="hGroupData" runat="server" type="hidden" />                    <!--Group Information-->
    <input id="hfDescription" runat="server" type="hidden"  />                <!--Selected Product Description-->     
    <input id="hfUnitPrice" runat="server" type="hidden" />                   <!--Selected Unit Price-->    
       
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>											<!--Arlen added Update ASP Ajax-->
                        
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID = "UpdatePanel2"  DisplayAfter="100">
      <ProgressTemplate>
       
            <div class="fixed_max linear ease_sd opacity_fff_9 top_max">
                <div class="absolute_vert_center inline" style="height:5em;">
                    <img src="svg/loading/loader_grey.gif" alt="" />
                    <h2 class="txt_sm m_m_top">ADDING TO CART</h2>
                </div>
            </div>																	<!-- Loader -->
       
       </ProgressTemplate>
    </asp:UpdateProgress>																									<!-- Progress Template -->
    
    <div id="opening_load" class="absolute_max bg_fff middle linear">
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
                <li><a id="home" runat="server" href="index.aspx"><span>Home</span></a></li>
                <li><a id="download" runat="server" href="downloads.aspx"><span>Portrait Downloads</span></a></li>
                <li><a id="group" runat="server" href="group_img.aspx" class="nav_selected"><span>Group Photos</span></a></li>
                <li><a id="package" runat="server" href="packages.aspx"><span>Photography Packages</span></a></li>
                <li><a id="gift" runat="server" href="gift_items.aspx"><span>Gift Items</span></a></li>
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
    
    <div id="document" class="bg_fff clearfix no-event prm_lt">

        <!-- Revisit click event not working on phones -->
        <!-- <div class="phone_view _p_l m_l_bottom border_box input_area_select border_ntl round_sd relative hidden">
                <select id="img_phone_list">
                    <option>Select Group</option>
                    <label class="icon-arrow_full_down border_box"></label>
                </select>
        </div> -->
        
        <section class="group_wrapper clearfix bg_fff border_ntl round_sd">
            
            <aside id="sec_wrapper" class="_25_m bg_fff desktop_view "><!-- opacity_0 -->
            
                <div class="title_ntl border-right">
                    Group Photos 
                </div>
                								
                <div class="clearfix"></div>
                
                <ul id="img_list" class="bg_fff links clearfix txt_sm link_line_left links_line_left scroll-pane"><!--edited style element -arlen-->
                </ul>
            
            </aside>
            
            <main id="groups_display" class="_75_m clearfix products border-left"><!-- p_l_left_break -->
            
            	<div class="border_box bg_fff">
                    
                    <h4 class="p_m_left p_m_right m_l_top m_l_left"><span class="img_name">&nbsp;</span><span class="icon-group fl_rt">&nbsp;</span></h4>
    
                    <div id="img_preview_wrapper" class="p_m add_wrapper clearfix m_l_bottom">
                                                
                        <a href="#" class="add cart_add desktop_view prm additional_link p_m" data-link="groups">
                        	<span class="icon-info txt_fff txt_lg"></span>
                        </a>
                        
                        <img id="img_loader" class="load_item" src="svg/loading/loader_grey.gif" alt="" />
                         
                        <a id="nav_lt" href="#" data-link_ref="nav_lt"><span class="icon-arrow-left txt_xl txt_fff fl_lt"></span></a>					<!-- id="nav_lt"  -->
                        <a id="nav_rt" href="#" data-link_ref="nav_rt"><span class="icon-arrow-right txt_xl txt_fff"></span></a>	<!-- id="nav_rt" -->
                        
                        <img id="img_preview" class="full p_m" src="img/subject_img/groups/temp.jpg" style="width:80%;padding-left:10%;padding-right:10%" alt=""/>
                        
                    </div>
                    
                    <div class="underline_solid"></div>
                    
                    <div class="bg_fa p_l_left p_l_right">
                    
                        <div class="_50_m">
                            <p><b>Name:</b> <span class="img_name">&nbsp;</span></p>
                            <p><b>Description:</b> <span class="img_description"></span></p>
                        </div>
                        
                        <div class="_50_m txt_sm ">
                            <p>
                                <span class="_50_s txt_red">$&nbsp;<span class="img_price" data-price=""></span></span>
                            
                                <span class="input_area_select border_ntl txt_xs round_sd relative _20_s m_m_left fl_rt">
                                    <select id="cart_qty" runat="server" > 
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select><!--added runat - arlen-->
                                    <label class="icon-arrow_full_down border_box"></label>
                            	</span>
                                
                                <span class="_20_s fl_rt">QTY</span>
                                
                            </p>
                           
                             <div class="clearfix"></div>
 
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">    
                               <ContentTemplate>    
                                   <asp:Button ID="addCart" runat="server" Text="ADD TO CART" class="txt_sm bg_sec round_sd border_box button m_m_top cart_add m_m_top m_m_bottom" OnClick="addCart_Click" style="background-color:rgb(108, 173, 223)"/><!--change anchor tag to asp image button-->      
                                   <input runat="server" type="hidden" id = "hfValue" /><!--Arlen added hidden field & UpdatePanel-->                                 
                               </ContentTemplate>
                           </asp:UpdatePanel>
                                                        
                        </div>
                    	
                        <div class="clearfix"></div>
                        
                    </div>
                    
                    <div class="clearfix"></div>
                
                </div>
                
                <div class="clearfix"></div>
                
            </main>

            <div class="clearfix"></div>
            
        </section>
        
        <div class="clearfix"></div>
        <br/>
    </div>																	<!-- main -->
    
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

    <div id="img_preload"></div>
    
    <div id="productID" runat="server" class="hidden_div"></div><!--added runat -arlen -->
    
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
    
</form>


</body>
</html>