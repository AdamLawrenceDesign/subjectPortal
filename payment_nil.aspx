<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_paymentNil, App_Web_-tibnddc" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    
    <title>Subject Portal | Payment</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/style.js?v1.1"></script>
	<script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>
    <link rel="stylesheet" href="css/popUp.css?v1.1" />
    
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
  
      <input id="hSchoolData" runat="server" type="hidden"/> 									<!-- Client Information-->
      <input id="hBannerImages" runat="server" type="hidden"/> 								    <!-- Banner Images-->
      <input id="hFirstImgPortrait" runat="server" type="hidden"/> 							    <!-- First Portrait Image-->
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
    	
        <section class="clearfix bg_fff round_sd border_box ">
            
            <main class="_70_m clearfix relative border-right">
                             
                <div class="m_l_left m_l_right m_l_top">
                                                                
                    <h1>Finalise Order</h1>
                    <h2>Your Details<span class="icon-info fl_rt"></span></h2>
                
                </div>
                
                <div class="underline_solid"></div>
                
                <div class="m_l_left m_l_right">
                
                    <p class="txt_sm">Please fill in your contact details.</p>
                                                                                                                                                  
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                       <ContentTemplate>
                                                
                            <asp:Panel ID="PnlPayments" runat="server">
                                                                                                   
                                    <label class="_50_m p_m_top p_m_bottom ">Email:</label>
                                    <span class="_50_m input_area "><asp:TextBox ID="Email" runat="server" /></span>
                                       
                                    <div class="ErrorMessage align_ct txt_red clearfix">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="RequiredFieldValidator">	
                                                Enter Your Email Address!	
                                            </asp:RequiredFieldValidator>
                                    </div>   
                                     
                                    <div class="clearfix"></div> 
                                                 
                                    <label class="_50_m p_m_top p_m_bottom">Confirm Email:</label>
                                    <span class="_50_m input_area "><asp:TextBox ID="ConfirmEmail" runat="server" AutoPostBack="True"/></span>
                                    
                                    <div class="ErrorMessage align_ct txt_red clearfix">
                                            <p id="ConfirmEmailErrorJava" style="text-align:center;color:red;display:none;margin-top:.5em;"><b>*Email Invalid:</b> Email does not match</p>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="RequiredFieldValidator">
                                                Confirm Your Email Address!
                                            </asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="Invalid Email Address!">
                                            </asp:CustomValidator>
                                    </div>

                                    <div class="clearfix"></div>
                                     
                                    <div class="_50_m clearfix fl_rt m_m_top">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                           <ContentTemplate> 
                                                <asp:Button ID="btnPay" Text="Submit" runat="server" CssClass="button_lt round_sd txt_fff" style="background-color:rgb(255, 187, 0)" OnClick="btnPay_Click" />          
                                           </ContentTemplate> 
                                        </asp:UpdatePanel>
                                    </div>                                            
                                              
                                    <div class="_50_m clearfix p_l_right_break m_m_top">
                                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" CssClass="button txt_fff round_sd" style="background-color:rgb(108, 173, 223)" CausesValidation="False" />
                                    </div>   
                                    
                                    <div style="clearfix"></div>
                                              
                             </asp:Panel>
                                                    
                       </ContentTemplate>
                    </asp:UpdatePanel>                        
                
                </div>
                
                <div class="clearfix"></div>
                
                <br/><br/><br/>
                
                <div class="underline_solid"></div>
                    
                <div class="clearfix bg_fa p_l">
                     <p class="txt_sm m_l_bottom"><span class="icon-phone fl_lt m_l_right m_s_top"></span>1300 728 972<br /></p>
                     <p class="txt_sm"><span class="icon-mail fl_lt m_l_right m_s_top"></span> enquiries@advancedlife.com.au<br /></p>
                </div>
                
    		</main>

            <aside id="sec_wrapper" class="_30_m shadow_left tablet_view">
                 
                <div class="block_ntl p_l">
                    <h3>Why Buy Online?</h3>
               	</div>
            
                <ul class="clearfix txt_xs no_links">
                
                    <li>
                        <h3>Privacy Guaranteed<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                        <p class="txt_xsm">This site has been developed in accordance with the 2012 Privacy Amendment Bill.</p>
                    </li>
                    <li>
                        <h3>Safe and Secure<span class="icon-checkmark2 txt_sec_m fl_rt m_m_right m_m_top"></span></h3>
                        <p class="txt_xsm">This site is verified and secured to keep all your information private and confidential.
                            <a target="_blank" href="https://seal.godaddy.com/verifySeal?sealID=TtKjRQzGx8UdUUeNXg5phl0o4iUkkSBvIA8b4BmCPrpJ3IZSBbF">
                                <b>View Cerificate</b>
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
    
    <div id="menu_help_lg" class="p_xl _33_m border_box">
    	
        <section>
        
            <a href="#" class="menu_help_toggle"><h2>Help Menu<span class="icon-cross txt_ntl_m fl_rt"></span></h2></a>
        	<p>Frequently Asked Questions</p>
            
            <div class="underline_dotted"></div>
            
            <div class="clearfix _50_m txt_sm p_l_top">
                <b>Refund Policy</b>
                <p>Please note that there are no refunds on images downloaded or prints delivered from this Private Image Archive, as customers are viewing the image prior to purchase. Refunds will not be given for accidental purchase or if you change your mind.</p>
                <br/>
                <b>Who else can access my Private Image Archive?</b>
                <p>The only way to access your Private Image Archive is via the secure 9 digit code you have been provided or via any of the secure 9 digit codes appearing on the back of the photographic packages you have purchased.  It is at your discretion whether to share your 9 digit code with family and friends so they can access your images.</p>
                <br/>
                <b>I do not want an active Private Image Archive.</b>
                <p>Simply email advancedlife via the "Contact Us" email link asking that your Private Image Archive be cancelled. Please note that once an archive has been cancelled it cannot be reinstated.</p>
                <br/>
                <b>Does my email remain confidential?</b>
                <p>Your personal details will not be shared with any company. advancedlife takes the utmost care to protect the privacy of its customers and will only use your email for direct contact regarding new images, products or packages through advancedlife.</p>
           </div>
           
           <div class="clearfix" style="height:4em"></div>
            
           <h2><a href="#" class="menu_help_toggle"><span class="icon-arrow-up txt_ntl_m fl_rt"></span></a></h2>

        </section>
        
    </div>																	<!-- menu_help_lg -->

</form>

<script type="text/javascript">

	$(document).ready(function(){
        
        //comment -Arlen
		/*var Data = eval("[" + document.getElementById('hPortraitData').value + "]"),
			FirstName = Data[0].FirstName,
			LastName = Data[0].LastName,
			Class = Data[0].Folder;
		$('#Student').val(FirstName + ' ' + LastName + ', ' + Class);
		console.log($('#Student').val())*/
		
		
		//Added links script from cart page - Arlen
		// ====================================================== // 								// 			Make Links Work
		/*
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
		*/
    });

</script>

</body>
</html>