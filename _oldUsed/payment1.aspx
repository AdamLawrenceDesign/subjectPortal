<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_payment, App_Web_-tibnddc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" /> <!--Added IE compatibility mode - ARLEN 30/09/2014 -->
    
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
   
	  function moveCursorToEnd(el) {
				if (typeof el.selectionStart == "number") {
				   el.selectionStart = el.selectionEnd = el.value.length;
				 } else if (typeof el.createTextRange != "undefined") {
					el.focus();
				  var range = el.createTextRange();
					range.collapse(false);
					range.select();
			}
		}
   
    </script>
    <!-- If IE  -->
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->
    
</head>

<body oncopy="return false" oncontextmenu="return false">

<form id="form1" runat="server">
                    
    <input id="hSchoolData" runat="server" type="hidden"/> 										<!-- Client Information-->
    <input id="hBannerImages" runat="server" type="hidden"/> 								    <!-- Banner Images-->
    <input id="hFirstImgPortrait" runat="server" type="hidden"/> 							    <!-- First Portrait Image-->
    <input id="hFirstImgGroup" runat="server" type="hidden"/> 									<!-- First Group Image-->

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>					<!--asp ajax element--->
     
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2" DisplayAfter="100">
       <ProgressTemplate>       
            <div class="fixed_max linear ease_sd opacity_fff_9 top_max">
                <div class="absolute_vert_center inline" style="height:5em;">
                    <img src="svg/loading/loader_grey.gif" alt="" />
                    <h2 class="txt_sm m_m_top">Processing Your Payment...</h2>
                </div>
            </div>																	
       </ProgressTemplate>
    </asp:UpdateProgress>																					<!--Added Update Progress Control - Arlen 15/09/2014 -->															
    
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
    
        <section class="clearfix bg_fff border_ntl round_sd border_box m_l_bottom">
                        
            <main class="_70_m fl_lt relative border-right">
                             
                <div class="m_l_left m_l_right m_l_top">
                                                                
                    <h1>Online Payments</h1>
                    <h2>Your Payment Details<span class="icon-info fl_rt"></span></h2>
                
                </div>
                
                <div class="underline_solid"></div>
                            
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    
                    <ContentTemplate>
                                        
                        <div id="popUpContainer" runat="server" class="#" style="z-index:2011"><!--IPS Response Message-->
                            <div class="fixed_max bg_fff middle">
                                <div class="absolute_vert_center inline _33_m" style="height:12em;float:none;margin:auto">                                                      
                                   <div id="popUpHeading" runat="server">
                                         Payment Message
                                   </div>
                                   <div id="popUpContent" runat="server">
                                       <p id="Msg" runat="server">Msg</p>
                                       <asp:Button ID="btnOk" runat="server" Text="Ok" OnClick="btnOk_Click"  CssClass="button_lt round_sd sec txt_fff _100 round_sd_ct"  style="background-color:#5bc14c;position:absolute;bottom:10px;right:10px;" />
                                   </div>
                                   </div>
                            </div>
                        </div>
                                                              
                        <div id="fsdim" runat="server" class="#"></div>																					<!--full screen dim-->
                                            
                        <div id="popUpContainer1" runat="server" class="#">
                               <div class="fixed_max bg_fff middle">
                                    <div class="absolute_vert_center inline _33_m" style="height:12em;float:none;margin:auto">                                                        
                                         <h3 id="popUpHeading1" runat="server">Payment Reminder</h3>
                                         <div id="popUpContent1" runat="server"><p id="Msg1" runat="server">Msg</p></div>
                                         <asp:Button ID="btnNo" Text="No" runat="server" CssClass="button_sd round_sd" style="background-color:rgb(108, 173, 223)" OnClick="btnNo_Click"/>
                                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                              <ContentTemplate>                                                                   
                                                 <asp:Button ID="btnYes" Text="Yes" runat="server" CssClass="button_sd round_sd txt_fff" style="background:rgb(255,187,0)" OnClick="btnYes_Click" />                                                   
                                              </ContentTemplate>
                                            </asp:UpdatePanel>  
                                     </div>
                                </div>
                        </div> 
                    
                        <asp:Panel ID="PnlPayments" runat="server">
                            
                            <div class="m_l_left m_l_right txt_sm">
                                
                                <label class="_50_m p_m_top p_m_bottom m_m_top">Delivery Address: <span class="txt_red txt_sm">Required Field*</span></label>
                                <div class="clearfix"></div>
        
                                <div id="address_wrap" runat="server">  
                                                                                                                   
                                    <label class="_50_m p_m_top p_m_bottom m_m_top">Street Address: <span class="txt_red">*</span></label>
                                    <span class="_50_m input_area m_m_top"><asp:TextBox ID="txtAddress" runat="server" ReadOnly="False" /></span>
                                    
                                    <div class="ErrorMessage align_ct txt_red clearfix">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAddress" ErrorMessage="RequiredFieldValidator">	
                                            Enter Delivery Address!	
                                        </asp:RequiredFieldValidator>
                                    </div>  			<!-- Error -->
                                    
                                    <div class="clearfix"></div>
                                    
                                   <div id="subState" runat="server">   
                                             
                                    <label class="_50_m m_m_top p_m_top p_m_bottom">Suburb: <span class="txt_red">*</span></label>
                                    <span class="_50_m input_area"><asp:TextBox ID="txtTown" runat="server" /></span>
        
                                    <div class="ErrorMessage align_ct  txt_red clearfix">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTown" ErrorMessage="RequiredFieldValidator">	
                                                        Enter Delivery Suburb!	
                                                    </asp:RequiredFieldValidator>
                                                </div> 
                                    
                                    <div class="clearfix"></div>
                                    
                                    <label class="_50_m p_m_top p_m_bottom">State: <span class="txt_red">*</span></label>
                                    <span class="input_area_select border_ntl round_sd relative _20_m">     
                                        <asp:DropDownList ID="state" runat="server">
                                            <asp:ListItem>Please select</asp:ListItem>
                                            <asp:ListItem>ACT</asp:ListItem>
                                            <asp:ListItem>NSW</asp:ListItem>
                                            <asp:ListItem>QLD</asp:ListItem>
                                            <asp:ListItem>SA</asp:ListItem>
                                            <asp:ListItem>VIC</asp:ListItem>
                                            <asp:ListItem>NT</asp:ListItem>
                                            <asp:ListItem>WA</asp:ListItem>
                                            <asp:ListItem>TAS</asp:ListItem>
                                        </asp:DropDownList> 
                                        <label class="icon-arrow_full_down border_box"></label>
                                    </span>
        
                                    <div class="ErrorMessage align_ct  txt_red clearfix">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="state" ErrorMessage="RequiredFieldValidator">	
                                            Please Select State!	
                                        </asp:RequiredFieldValidator>
                                    </div>  
                                    
                                    <div class="clearfix" style="height:1em"></div>
                                    
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>                                    
                                       <label class="_50_m p_m_top p_m_bottom">Postcode: <span class="txt_red">*</span></label>
                                       <span class="input_area _20_m"><asp:TextBox ID="txtPostcode" runat="server" MaxLength="4"/>
                                       </span>
                                    </ContentTemplate>                                         
                                    </asp:UpdatePanel>
                                                               
                                    <div class="ErrorMessage align_ct txt_red clearfix">
                                        <label id="errorPostcode" runat="server" class="_50_m p_m_top p_m_bottom" visible="False"></label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPostcode" ErrorMessage="RequiredFieldValidator">	
                                            Enter Postcode!	
                                        </asp:RequiredFieldValidator>
                                    </div>  
                              
                                    <div class="clearfix" style="height:1em"></div>   
                                    
                                    </div>                      
                                                                        
                                </div>																<!-- Address Wrapper -->
                            
                            </div>
                            
                            <div class="m_l_left m_l_right txt_sm">
                                         
                                <div class="underline_solid m_l_bottom"></div>     
                                  <div id="person" runat="server">                             
                                    <label class="_50_m p_m_top p_m_bottom m_l_top">Name of Person(s) Photographed: <span class="txt_red">*</span></label>
                                    <span class="_50_m input_area m_l_top"><asp:TextBox ID="Student" runat="server" ReadOnly="True"/></span>
        
                                    <div class="ErrorMessage align_ct  txt_red clearfix">
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Student" ErrorMessage="RequiredFieldValidator">
                                              Enter Name of Person(s) Photographed!
                                         </asp:RequiredFieldValidator>
                                    </div>
                                 </div>
                                <div class="clearfix"></div>                                 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Name of Parent/Guardian: <span class="txt_red">*</span></label>
                                <span class="_50_m input_area "><asp:TextBox ID="Parent" runat="server" /></span>
                                            
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Parent" ErrorMessage="RequiredFieldValidator">
                                        Enter Name of Parent/Guardian!
                                     </asp:RequiredFieldValidator>
                                </div>
                                 
                                <div class="clearfix"></div> 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Email: <span class="txt_red">*</span></label>
                                <span class="_50_m input_area "><asp:TextBox ID="Email" runat="server" /></span>
                                   
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="RequiredFieldValidator">	
                                            Enter Your Email Address!	
                                        </asp:RequiredFieldValidator>
                                </div>   
                                 
                                <div class="clearfix"></div> 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Confirm Email: <span class="txt_red">*</span></label>
                                <span class="_50_m input_area "><asp:TextBox ID="ConfirmEmail" runat="server" AutoPostBack="True" OnTextChanged="ConfirmEmail_TextChanged" /></span>
                                
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                        <p id="ConfirmEmailErrorJava" style="text-align:center;color:red;display:none;margin-top:.5em;"><b>*Email Invalid:</b> Email does not match</p>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="RequiredFieldValidator">
                                            Confirm Your Email Address!
                                        </asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="Invalid Email Address!">
                                        </asp:CustomValidator>
                                </div>
                                 
                                <div class="clearfix"></div> 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Total Payment Amount ($): <span class="txt_red">*</span></label>
                                <span class="_50_m input_area "><asp:TextBox ID="txtAmount" runat="server" ReadOnly="True" /></span>
                                 
                                <div class="clearfix"></div>
                                 
                                <div class="underline_solid m_l_top m_l_bottom"></div> 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Select Card type: <span class="txt_red">*</span></label>
                                <span class="input_area_select border_ntl round_sd relative m_m_left">
                                    <asp:DropDownList ID="CardType" runat="server">
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>VISA</asp:ListItem>
                                         <asp:ListItem>Mastercard</asp:ListItem>
                                    </asp:DropDownList>					<!--Card Type added-->
                                    <label class="icon-arrow_full_down border_box"></label>
                                </span>     
                                                                             
                                 <div class="ErrorMessage align_ct  txt_red clearfix">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CardType" ErrorMessage="RequiredFieldValidator">
                                            Select Card Type!
                                     </asp:RequiredFieldValidator>
                                 </div>  
                                          
                                 <div class="clearfix"></div> 
                                             
                                <label class="_50_m p_m_top p_m_bottom ">Card Holders Name: <span class="txt_red">*</span></label>
                                <span class="_50_m input_area "><asp:TextBox ID="CardHoldersName" runat="server" /></span>
                                
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="CardHoldersName" ErrorMessage align_ct ="RequiredFieldValidator">
                                            Enter Card Holder Name!
                                        </asp:RequiredFieldValidator>
                                 </div>  
                                          
                                 <div class="clearfix"></div> 
                                             
                                 <label class="_50_m p_m_top p_m_bottom ">Credit Card Number: <span class="txt_red">*</span></label>
                                 <span class="_50_m input_area "><asp:TextBox ID="CreditCardNumber" runat="server" MaxLength="16" autocomplete="off"/></span>
                                 
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="CreditCardNumber" ErrorMessage="RequiredFieldValidator">
                                        Enter Credit Card Number!
                                        </asp:RequiredFieldValidator><asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="CreditCardNumber" ErrorMessage="Invalid Credit Card Number!">
                                        </asp:CustomValidator>
                                 </div>
                                          
                                 <div class="clearfix"></div> 
                                             
                                 <label class="_50_m p_m_top p_m_bottom ">Card Security Code:  <span class="txt_red">*</span>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Smaller" NavigateUrl="https://www.advancedimage.com.au/publicPortal/webPay/MoreInfo.aspx" ToolTip="The Card Security Code (CSC) is a 3 or 4 digit number printed on the back of a credit card (typically in the signature field or just above it)." Target="_blank">What's this!
                                        </asp:HyperLink>
                                 </label>
                                 <span class="_50_m input_area "><asp:TextBox ID="CardSecurityCode" runat="server" MaxLength="4" autocomplete="off"/></span>
                                
                                 <div class="ErrorMessage align_ct  txt_red clearfix">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CardSecurityCode" ErrorMessage="RequiredFieldValidator">
                                            Enter Card Security Code!
                                        </asp:RequiredFieldValidator>
                                 </div>
                                   
                                <label class="_50_m p_m_top p_m_bottom ">Expiry Date: <span class="txt_red">*</span></label>
                                 
                                <div class="_50_m">
                                    <span class="_33_s input_area_select txt_sm">
                                        <asp:DropDownList ID="Month" runat="server"></asp:DropDownList>
                                        <label class="icon-arrow_full_down border_box"></label>
                                    </span>
                                    
                                    <span class="fl_lt m_m_left  m_m_right">/</span>
                                    
                                    <span class="_33_s input_area_select txt_sm">
                                        <asp:DropDownList ID="Year" runat="server"></asp:DropDownList>
                                        <label class="icon-arrow_full_down border_box"></label>
                                    </span>
                                </div>
                                            
                                <div class="ErrorMessage align_ct  txt_red clearfix">
                                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="CreditCardNumber" ErrorMessage="Invalid Expiry Date!">
                                    </asp:CustomValidator>
                                </div>   
                                
                                <div class="clearfix"></div>
                                          
                                <div class="underline_solid"></div>
                                  
                                <div class="_50_m clearfix fl_rt m_l_top">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                       <ContentTemplate>
                                            <asp:Button ID="btnPay" Text="Pay" runat="server" onmouseover="" CssClass="button_sd round_sd txt_fff" style="background:rgb(255,187,0)" OnClick="btnPay_Click"/>          
                                       </ContentTemplate> 
                                    </asp:UpdatePanel>
                                </div>                                            

                                <div class="p_l_right_break _50_m  m_l_top clearfix">
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" onmouseover="" OnClick="btnCancel_Click" CssClass="button_sd round_sd" style="background-color:rgb(108, 173, 223)" CausesValidation="False"/>
                                </div>   
                            
                            </div>
                                      
                            <div class="clearfix"></div>
                                          
                        </asp:Panel>
                    
                    </ContentTemplate>
                
                </asp:UpdatePanel>  
                                                                       
                <div class="clearfix"></div>
                 
                <div class="underline_solid m_l_top"></div>
                
                <p class="align_ct p_l_left p_l_right">
                    <span class="txt_red"><b>- IMPORTANT - </b></span><br />
                   Please check your order carefully, <b>refunds</b> will not be given once items have been delivered.<br />
                </p>
				
                <div class="underline_solid"></div>
                    
                <div class="clearfix bg_fa p_l">
                     <p class="txt_sm m_l_bottom"><span class="icon-phone fl_lt m_l_right m_s_top"></span>1300 728 972<br /></p>
                     <p class="txt_sm"><span class="icon-mail fl_lt m_l_right m_s_top"></span> enquiries@advancedlife.com.au<br /></p>
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
             
    </div>																	<!-- main -->
    
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

</form>

<script type="text/javascript">

	$(document).ready(function(){
        
		// =================================================// 											// Address

		var SchoolData =  eval("[" + document.getElementById('hSchoolData').value + "]");
		
		var length = SchoolData[0].WebTown.length,
			findPostCode = length - 4,
			findState = length - 8,
			
			postcode = SchoolData[0].WebTown.substr(findPostCode,length),
			stateFind2 = SchoolData[0].WebTown.substr(findState,length),
			state = stateFind2.substr(0,4);
		
		var DropDown = $('#txtTown');
		
		//$('#txtAddress').val(SchoolData[0].WebAddress); //Moved to code behind - Arlen 15/09/2014
		//$('#txtTown').val(SchoolData[0].WebTown.substr(0,findState)); //Moved to code behind - Arlen 15/09/2014
		//$('#txtPostcode').val(postcode);  //Moved to code behind - Arlen 15/09/2014
		//$('#state').val(state); //Moved to code behind - Arlen 15/09/2014
		
		//$('#address_wrap').addClass('invisible').css({'height':'0px','position':'absolute'});				// include
		//$('#client_address').removeClass('hidden');		
		$('#client_address span').html( SchoolData[0].WebName.replace('?','\'') + '<br/>' + SchoolData[0].WebAddress + ', ' + SchoolData[0].WebTown);
		
		// =================================================// 											// Student 

		var StudentData = eval("[" + document.getElementById('hFirstImgPortrait').value + "]"); 

		var name_given = StudentData[0].FirstName,
			name_surname = StudentData[0].LastName,
			name_full = name_given + " " + name_surname,
			group = StudentData[0].Folder,
			dob = StudentData[0].DateOfBirth;

		$('#Student').val(name_full + ', ' + group );
		
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
