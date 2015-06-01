<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_downloads, App_Web_-tibnddc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <title>Portrait Downloads</title>
    <link rel="shortcut icon" href="img/camera.png"> 								
    <link rel="stylesheet" href="lib/prod/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'/>
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->
</head>

<body oncopy="return false" oncontextmenu="return false">

<form id="Form1" runat="server">

    <input id="hBannerImages" runat="server" type="hidden"/> <!--Banner Images-->
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> <!--First Portrait Image-->
    <input id="hFirstImgGroup" runat="server" type="hidden"/> <!--First Group Image-->																<!-- Nav -->
    <input id="hSchoolData" runat="server" type="hidden"/> <!--Client Information-->
    <input id="hPortraitData" runat="server" type="hidden"/> <!--Subject Information-->           
	
    <!-- Paste ASP Items not pad -->  
               
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>	<!--Arlen added Update ASP Ajax-->  

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
       <ProgressTemplate>
       
            <div class="fixed_max linear ease_sd opacity_fff_9 top_max">
                <div class="absolute_vert_center inline" style="height:5em;">
                    <img src="svg/loading/loader_grey.gif" alt="" />
                    <h2 class="txt_sm m_m_top">ADDING TO CART</h2>
                </div>
            </div>																	<!-- Loader -->
       
       </ProgressTemplate>
    </asp:UpdateProgress>		

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
       
    <nav class="clearfix">
    
        <section>
        
            <ul class="inline fl_lt desktop_view">
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads nav_selected"><span>Portrait Downloads</span></a></li>
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
                        <asp:label runat="server" id="lblItems">( </asp:label><asp:label runat="server" id="lblQty"> 0</asp:label><asp:label runat="server" id="lblQty1"> )</asp:label>
                    </a>
               </li>
            </ul>
            </ContentTemplate>
            </asp:UpdatePanel>
            
        </section>
    
    </nav>																	<!-- Nav -->
    
    <div id="document" class="p_l_bottom prm_lt m_l_bottom">
    
           <section class="clearfix bg_fff border_ntl round_sd">
                
                  <main class="_70_m relative border-right">
                                     
                        <div class="m_l_left m_l_right m_l_top">
                                                                        
                            <h1>Portrait Downloads</h1>
                            <h2>Portraits <span class="img_oldest_year"></span> - <span class="img_latest_year"></span></h2>
                        
                        </div>
                        
                        <span class="load_item">
                        	<img src="svg/loading/loader_grey.gif" alt="" />	<!-- svg/loading/loading-spinning-bubbles.svg -->
                        </span>
                          
                        <ul id="image_list" class="clearfix products invisible">						<!-- Portraits -->
                            
                            <li id="wrapperAll" class="hidden relative">
                            
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div>
                                    
                                    <a id="iconAll" href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     
                                    <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="additional_link txt_sm m_l_top" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">    
                                         <ContentTemplate>                                             
                                            <asp:button id="CartAll" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCartAll_click" style="background:rgb(255, 187, 0)"></asp:button>
                                            <input id="CartInfoAll" runat="server" type="hidden" />                                           
                                         </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                                 
                             </li>														<!-- Wrapper All -->														<!-- Wrapper All -->
                             
                            <li id="wrapper0" class="hidden">
                            
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div>
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     
                                    <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">    
                                     <ContentTemplate>   
                                        <asp:button id="Cart0" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart0_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo0" runat="server" type="hidden" />
                                        
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                                 
                             </li>														<!-- Wrapper 0 -->														<!-- Wrapper 0 -->
                             
                            <li id="wrapper1" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>

                                    <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike><span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                    </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel4" runat="server">    
                                     <ContentTemplate>   
                                        <asp:button id="Cart1" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart1_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo1" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>	
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 1 -->
                             
                            <li id="wrapper2" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>

                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel5" runat="server">    
                                     <ContentTemplate>   
                                        <asp:button id="Cart2" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart2_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo2" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 2 -->
                             
                            <li id="wrapper3" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel7" runat="server">    
                                     <ContentTemplate>   
                                        <asp:button id="Cart3" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart3_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo3" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 3 -->
                             
                            <li id="wrapper4" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel6" runat="server">    
                                     <ContentTemplate>  
                                        <asp:button id="Cart4" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart4_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo4" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 4 -->
                             
                            <li id="wrapper5" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                         <asp:UpdatePanel ID="UpdatePanel8" runat="server">    
                                         <ContentTemplate>  
                                            <asp:button id="Cart5" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart5_click" style="background:rgb(255, 187, 0)"></asp:button>
                                            <input id="CartInfo5" runat="server" type="hidden" />
                                         </ContentTemplate>
                                         </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 5 -->
                             
                            <li id="wrapper6" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel9" runat="server">    
                                     <ContentTemplate>  
                                        <asp:button id="Cart6" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart6_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo6" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 6 -->
                             
                            <li id="wrapper7" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel10" runat="server">    
                                     <ContentTemplate>  
                                        <asp:button id="Cart7" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart7_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo7" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 7 -->
                             
                            <li id="wrapper8" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<!-- <div class="add prm">
                                    	<span class="icon-info txt_fff txt_lg"></span>
                                    </div> -->
                                    
                                    <a href="#" class="additional_link" data-link="downloads">
                                        <img class="ProductThumb" src="#" alt="" />
                                    </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top ProductTitle"></h4>
                                         <strike class="hidden"></strike>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top additional_link" data-link="downloads"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     <div class="p_m border_box">
                                     <asp:UpdatePanel ID="UpdatePanel11" runat="server">    
                                     <ContentTemplate>  
                                        <asp:button id="Cart8" runat="server" class="asp_element p_m round_sd bg_sec button_sd" Text="ADD TO CART" OnClick="addToCart8_click" style="background:rgb(255, 187, 0)"></asp:button>
                                     	<input id="CartInfo8" runat="server" type="hidden" />
                                     </ContentTemplate>
                                     </asp:UpdatePanel>	
                                     </div>
                                     
                                 </div>
                             </li>														<!-- Wrapper 8 -->
                             
                            <li id="spacer" class="hidden">
                            	<div class="product_wrapper_25 txt_sm align_ct">
                                
                                	<span class="add"><span class="icon-cart txt_fff txt_lg"></span></span>
                                    	<a href="#">
                                        	<img class="ProductThumb" src="#" alt="" />
                                        </a>
                                     <span class="product_title clearfix p_m_left p_m_right">
                                         <h4 class="m_l_top product_title"></h4>
                                         <span class="DownloadPrice txt_red"></span><br/>
                                         <a class="txt_sm m_l_top menu_help_toggle"><span class="txt_sm">INFORMATION</span></a>
                                     </span>
                                     
                                     
                                 </div>
                             </li>														<!-- Spacer -->

                        </ul>
                        
                        <div class="clearfix"></div>
                        
                        <div class="m_l_left m_l_right m_l_top m_l_bottom">
                            <div class="block_ntl p_m txt_sm clearfix">
                                <span class="inline_block fl_lt m_l_right">Proceed to checkout now!</span>
                                <a href="#" class="txt_sm button fl_rt round_sd cart link_button phone_max border_box"><span class="icon-forward txt_fff m_m_right"></span>CHECK OUT</a>
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
                     
           </section>
    
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
</form>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<!-- 
<script type="text/javascript" src="lib/prod/project.min.js?v1.1"></script>
-->
<script type="text/javascript" src="lib/src/js/jquery.jscrollpane.min.js"></script>                
<script type="text/javascript" src="lib/src/js/jquery.cycle2.js"></script>
<script type="text/javascript" src="lib/src/js/ie-placeholder.js"></script>
<script type="text/javascript" src="lib/src/js/server-query.js"></script>
<script type="text/javascript" src="lib/src/js/index-page.js"></script>
<script type="text/javascript" src="lib/src/js/packages-page.js"></script>
<script type="text/javascript" src="lib/src/js/groups-page.js"></script>
<script type="text/javascript" src="lib/src/js/contact-validation.js"></script>
<script type="text/javascript" src="lib/src/js/downloads-page.js"></script>
<script type="text/javascript" src="lib/src/js/build-links.js"></script>
<script type="text/javascript" src="lib/src/js/watermark.js"></script>
<script type="text/javascript" src="lib/src/js/to-top.js"></script>
<script type="text/javascript" src="lib/src/js/page-info.js"></script>
<script type="text/javascript" src="lib/src/js/page-style.js"></script>
<script type="text/javascript" src="lib/src/js/page-loaded.js"></script>
<script type="text/javascript" src="lib/src/js/menu-ctrls.js"></script>
<script type="text/javascript" src="lib/src/js/ie-warning.js"></script>
<script type="text/javascript" src="lib/src/js/analytics.js"></script>

<script>
    var todaysDate, sic, userId, 
        schoolData = eval("[" + document.getElementById('hSchoolData').value + "]"),
        bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]"),
        firstPortraitData = eval("[" + document.getElementById('hFirstImgPortrait').value + "]"), 
        firstGroupData = eval("[" + document.getElementById('hFirstImgGroup').value + "]"), 
        portraitData = eval("[" + document.getElementById('hPortraitData').value + "]"),
        groupData = null;
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
    hasId = sicCode.search('userId=');

    var startMenuControllers = new MenuControllers();
    var setupPageInfo = new PageInfo(schoolData, bannerImages, firstPortraitData, firstGroupData);
    var toTop = new ToTop('#to_top');

    // THE URL HAS NO ID SO WE NEED TO CREATE ONE
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
                        var buildLinks = new BuildLinks('?SIC=' + sicCode + '&userId=' + userId );   
                        var addPageStyle = new PageStyle(schoolData[0].CssStyle);
                        var pageIsLoaded = new PageIsLoaded();
                    });
            });       
                
    } else {
        // USER ID ALREADY ASSIGNED
        console.log('user id already assigned')
        var buildLinks = new BuildLinks('?SIC=' + sicCode );
        var addPageStyle = new PageStyle(schoolData[0].CssStyle);        
        var pageIsLoaded = new PageIsLoaded();
    }

    var downloadsInit = new DownloadsPage();
    // NOT SURE WHAT THIS IS
    /*
    function cart_load()
    {
		$('#cart_load').removeClass('hidden');
		setTimeout(function()
        {
			$('#cart_load').addClass('hidden');
		},900);
	};
	*/
});

</script>

</body>
</html>