<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_contactUs, App_Web_-tibnddc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->

    <title>Advancedlife Studios | Contact Us</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
	<script type="text/javascript" src="js/contact-validation.js?v1.1"></script>
    <script type="text/javascript" src="js/style.js?v1.1"></script>
    <script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>
    
	<script type="text/javascript">
		if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
		alert("Important! This website is optimised for modern web browsers and will not work on this version of Internet Explorer. We recommend updating to a newer version of Internet Explorer or to use a phone or tablet. Sorry for the inconvenience");
			
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-55035205-1', 'auto');
		  ga('send', 'pageview');
    
    </script>

</head>

<body oncopy="return false" oncontextmenu="return false">

<form id="Form1" runat="server" >              
    
    <!--Arlen added Update ASP Ajax-->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   	

    <input id="hBannerImages" runat="server" type="hidden"/>            <!--Banner Images-->
    <input id="hFirstImgPortrait" runat="server" type="hidden"/>        <!--First Portrait Image-->
    <input id="hFirstImgGroup" runat="server" type="hidden"/>           <!--First Group Image-->																
    <input id="hSchoolData" runat="server" type="hidden"/>              <!--Client Information-->
        
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
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
                        
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
            <ContentTemplate>    
            <ul class="inline fl_rt">
               <li>
                    <a id="cart" runat="server" class="cart" href="cart.aspx">
                    <span class="icon icon-cart txt_md txt_ntl m_l_right"></span><asp:label runat="server" id="lblTotal"></asp:label><asp:label runat="server" id="lblTotAmt">0.00</asp:label>
                    <asp:label runat="server" id="lblItems">( </asp:label><asp:label runat="server" id="lblQty"> 0</asp:label><asp:label runat="server" id="lblQty1"> )</asp:label></a>
               </li>
            </ul>
            </ContentTemplate>
            </asp:UpdatePanel>
            
        </section>
    
    </nav>																	<!-- Nav -->
    
    <div id="document" class="prm_lt p_l_bottom">
    
        <section class="clearfix bg_fff round_sd border_box m_l_bottom">
        
            <main class="_70_m clearfix relative border-right p_m_top"><!-- p_l_left_break -->
                
                   <img class="load_item opacity_0" src="svg/loading/loading-spinning-bubbles.svg" alt="" />
                   
                   <div class="m_l_left m_l_right">
                        <h1>Contact Us</h1>
                        <h2>Enquiry Form<span class="icon-mail fl_rt m_m_top m_s_right txt_sm"></span></h2>
                    
                    </div>
                    
                    <div class="underline_solid m_m_top"></div>
                    
                    <div class="p_l">
                        <p class="txt_sm">Please fill in your details so we can help you with your enquiry. <span class="txt_red txt_xs">REQUIRED FIELD *</span></p>
                    </div>
                    
                    <div class="clearfix _50_m m_m_top p_l_left p_l_right m_l_bottom border-right border-left">
                        
                        <label class="p_m_top p_m_bottom txt_sm">Your Name: <span class="txt_red">*</span></label>
                        
                        <span class="input_area m_m_top">
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                            <span class="input-icon"></span>
                        </span>
                        
                        <div class="clearfix m_m_top"></div>
                        
                        <label class="p_m_top p_m_bottom m_m_top txt_sm m_l_top">Email Address: <span class="txt_red">*</span></label>
                        <span class="input_area m_m_top clearfix">
                            <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            <span class="input-icon"></span>
                        </span>
                        
                        <div class="clearfix m_m_top"></div>
                        
                        <label class="p_m_top p_m_bottom m_m_top txt_sm m_l_top">Confirm Email: <span class="txt_red">*</span></label>
                        
                        <span class="input_area m_m_top">
                            <asp:TextBox ID="email_match" runat="server"></asp:TextBox>
                            <span class="input-icon"></span>
                        </span>
                        
                        <div class="clearfix m_m_top"></div>
                        
                        <label class="p_m_top p_m_bottom m_m_top txt_sm m_l_top">Contact Phone Number: <span class="txt_red">*</span></label>
                        
                        <span class="input_area m_m_top">
                            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                            <span class="input-icon"></span>
                        </span>
                        
                        <div class="clearfix"></div>
                        
                        <label class="p_m_bottom txt_sm _66_s m_l_top">Preferred Contact Method: </label>
                        
                        <span class="input_area_select border_ntl round_sd relative _33_s txt_xs m_l_top">
                            <asp:DropDownList ID="contact_preference" runat="server" >
                                <asp:ListItem>Email</asp:ListItem>
                                <asp:ListItem>Phone</asp:ListItem>
                            </asp:DropDownList>
                           
                            <label class="icon-arrow_full_down border_box"></label>
                        </span> 
                    
                    </div>
    
                    <div class="clearfix _50_m p_m_top p_l_left p_l_right">
                        
                        <div class="clearfix"></div>
                        
                        <label class="p_m_top p_m_bottom txt_sm ">Your Message: <span class="txt_red">*</span></label>
                        
                        <span class="input_area m_m_top">
                            <asp:TextBox ID="message" runat="server" MaxLength="1000" Height="200" TextMode="MultiLine"></asp:TextBox>
                            <span class="input-icon"></span>
                        </span>
                        
                        <input id="PortalInfo" runat="server" type="hidden" value="" />
                        <input id="UserInfo" runat="server" type="hidden" />
                       
                        <div id="form_errors" class="txt_red_m txt_sm"></div>
            
                          <!--  <button class="proceed m_l_top round_sd bg_sec txt_fff button_dk" Text="SUBMIT" onserverclick="confirm_session_click">SUBMIT</button>
                          -->
                                                            
                        <asp:Label ID="form_message" runat="server" CssClass="txt_red_m txt_sm"></asp:Label>
                        
                        <asp:Button ID="submit" runat="server" Text="SUBMIT ENQUIRY" CssClass="proceed round_sd m_l_top bg_sec txt_fff button_sd" OnClick="confirm_session_click"></asp:Button>   <!-- -->                                
                        <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="txt_red_m txt_sm" ControlToValidate="email" ErrorMessage="Email Address Not Match!"></asp:CustomValidator> <!-- run at="server"  -->
                    
                    </div>
    
                    <div class="clearfix"></div>
                    
                    <br/><br/>
                    
                    <div class="underline_solid m_l_top"></div>
                    
                    <div class="clearfix bg_fa p_l">
                            <p class="txt_sm m_l_bottom"><span class="icon-phone fl_lt m_l_right m_s_top"></span>1300 728 972<br /></p>
                            <p class="txt_sm"><span class="icon-mail fl_lt m_l_right m_s_top"></span> enquiries@advancedlife.com.au<br /></p>
                    </div>
                        
                    <div class="clearfix"></div>
                
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
    
    </div>																	<!-- Main -->
    
    <div class="clearfix p_l_top p_l_bottom desktop_view">
    	
        <section>
        	
            <div class="wrapper p_m"> 
            
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
        <div id="testing_phone"></div>
        <div id="testing_tablet"></div>
        <div id="testing_desktop"></div>
        <div id="testing_desktop_lg"></div>
	</span> -->
    
</form>

</body>
</html>
