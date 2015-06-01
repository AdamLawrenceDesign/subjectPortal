<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_cart, App_Web_fblgf7pa" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <!--<meta name="viewport" content="initial-scale=1, maximum-scale=1"/> -->				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    <title runat="server">Subject Portal | Cart</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.1" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'/>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.1"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/style.js?v1.1"></script>
    <script type="text/javascript" src="js/jquery.cycle2.min.js?v1.1"></script>
	<script type="text/javascript" src="js/events.js?v1.1"></script>

	<script type="text/javascript">
            if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
            alert("Notice! This website does not support versions of Internet Explorer. We recommend using Firefox, Google Chrome, Safari or Opera. Sorry for the inconvenience");
   	</script>

    <!-- If IE  -->
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.1" />
    <![endif]-->

</head>

<body oncopy="return false" oncontextmenu="return false">

<form id="Form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager><!--asp ajax element--->
  
    <input id="hSchoolData" runat="server" type="hidden"/> 									<!-- Client Information-->
    <input id="hBannerImages" runat="server" type="hidden"/> 								<!-- Banner Images-->
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
        
            <ul class="inline fl_lt desktop_view">
                <li><a href="index.aspx" class="index"><span>Home</span></a></li>
                <li><a href="downloads.aspx" class="downloads"><span>Portrait Downloads</span></a></li>
                <li><a href="group_img.aspx" class="group_img"><span>Group Photos</span></a></li>
                <li><a href="packages.aspx" class="packages"><span>Photography Packages</span></a></li>
                <li><a href="gift_items.aspx" class="gift_items"><span>Gift Items</span></a></li>
            </ul>
            
            <ul class="inline fl_rt">
               <li>
                    <a id="cart" runat="server" class="nav_selected cart" href="#">
                        <span class="icon icon-cart txt_md txt_fff m_l_right"></span>Your Cart
                    </a>
               </li>
            </ul>
            
        </section>
    
    </nav>																	<!-- Nav -->

    <div id="document" class="prm_lt p_l_bottom">
    
        <section class="clearfix bg_fff border_ntl round_sd border_box m_l_bottom">
                        
            <main class="_70_m fl_lt relative">
                             
                <div class="m_l_left m_l_right m_l_top">
                    <h1>Shopping Cart</h1>
                    <h2>Items in your cart<span class="icon-cart fl_rt m_m_top"></span></h2>
                </div>					<!-- title infor -->
                
                <asp:label runat="server" id="lblNoItem" Visible="false" >
                	<div id="MsgCart" runat="server" class="m_l_left m_l_right m_l_top">
                        <p class="txt_red">You have no items in your cart. </p>
                	</div>
                </asp:label>
        
                <asp:GridView ID="grvCart" runat="server"  style="font-size:.8em;padding:1em;border:none;" AutoGenerateColumns="False" AlternatingRowStyle-BackColor = "#fafafa" DataKeyNames="ID" BorderStyle="None" OnRowDeleting="grvCart_RowDeleting"  OnRowEditing="grvCart_RowEditing" OnRowcommand="DeleteRowBtn_Click"  OnPageIndexChanging="grvCart_PageIndexChanging" PageSize="5">            
                     <Columns>
                       <asp:TemplateField> 
                          <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="WebClientAssetID" Visible="False">
                          <ItemTemplate>
                            <asp:Label ID="lblWebClientId" runat="server" Text='<%# Bind("WebClientAssetID") %>' ></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="ProductID" Visible="False">
                          <ItemTemplate>
                           <asp:Label ID="lblProdId" runat="server" Text='<%# Bind("ProductID") %>'  ></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField>
                          <ItemTemplate>
                            <asp:Image runat="server" ID="myImg"  ImageUrl='<%# Bind("Image") %>' Width="80px" />   
                          </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Quantity">  
                          <ItemTemplate>
                            <span class="input_area_select txt_sm border_ntl round_sd relative">
                                <asp:DropDownList runat="server" ID="drpQty" SelectedValue='<%# Bind("Quantity") %>' OnSelectedIndexChanged="drpQty_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
                                     <asp:ListItem Value="1"></asp:ListItem>
                                     <asp:ListItem Value="2"></asp:ListItem>
                                     <asp:ListItem Value="3"></asp:ListItem>
                                     <asp:ListItem Value="4"></asp:ListItem>
                                     <asp:ListItem Value="5"></asp:ListItem>
                                     <asp:ListItem Value="6"></asp:ListItem>
                                     <asp:ListItem Value="7"></asp:ListItem>
                                     <asp:ListItem Value="8"></asp:ListItem>
                                     <asp:ListItem Value="9"></asp:ListItem>
                                     <asp:ListItem Value="10"></asp:ListItem>
                                </asp:DropDownList>          
                                <label class="icon-arrow_full_down border_box"></label>
                            </span> 
                          </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                                 <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Description">
                          <ItemTemplate>
                                 <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' style ="width:auto;text-align:center;"></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Retail Price">
                          <ItemTemplate>
                                 <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("[Retail Price]") %>' style ="width:auto;text-align:center;" CssClass="txt_red"></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Discount">
                          <ItemTemplate>
                                 <asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("Discount") %>' style ="width:auto;text-align:center;"></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Total">
                          <ItemTemplate>
                                 <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("Total") %>' style ="width:auto;text-align:center;"></asp:Label>
                          </ItemTemplate> 
                       </asp:TemplateField>
                                                                            
                       <asp:TemplateField HeaderText="Remove">
                          <ItemTemplate> 
                                 <asp:Button ID="btnDelete" runat="server" CssClass="button_sd round_sd txt_xs" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' CommandName="deleterow" Text="DELETE" style="background:rgb(255,187,0)"  /> 
                          </ItemTemplate>
                       </asp:TemplateField>
                       <asp:CommandField ShowDeleteButton="True" Visible="False" ButtonType="Image" />
                       </Columns>
                       <AlternatingRowStyle BackColor="#fafafa" />
                       </asp:GridView>
                                                                
                <div style="clearfix"></div>
                                                                
                <div class="underline_solid"></div>
                
                <div class="p_l clearfix">
                                                                    
                    <label class="_50_m p_m_top align_rt p_l_right txt_xs">Voucher Code:</label>
                    
                    <div class="_50_m txt_xs">
                         <span class="_50_s input_area m_m_left"><input id="voucherCode" runat="server" name="voucher" type="text" style="width:100%"/></span>
                         <asp:Button id="updateBtn" runat="server" CssClass="_33_s m_m_left button_sd round_sd inline_block" Text="UPDATE" OnClick="updateBtn_Click" style="background:rgb(255,187,0)" ></asp:Button>
                    </div>
                
                </div>
				
                <div class="underline_solid"></div>
                
                <div class="p_l_left p_l_right clearfix">
	
                    <asp:label runat="server" id="lblItems1" class="_50_s m_m_top txt_sm"><b>ITEMS:</b></asp:label>
                    <asp:label runat="server" id="lblQty" class="_50_s m_m_top p_m_left txt_sm"> 0</asp:label>
                    
                    <div class="clearfix"></div>
                                                                
                    <asp:label runat="server" id="lblDisLbl" class="_50_s m_m_top txt_sm"><b>DISCOUNT:</b></asp:label>
                    <asp:label runat="server" id="lblDiscount" class="_50_s m_m_top p_m_left txt_sm">0.00</asp:label>
                    
                    <div class="clearfix"></div>
                                                                
                    <asp:label runat="server" id="lblHFee" class="_50_s m_m_top txt_sm"><b>HANDLING FEE:</b></asp:label>
                    <asp:label runat="server" id="lblHandlingFee" class="_50_s m_m_top p_m_left txt_sm">0.00</asp:label>
                    
                    <div class="clearfix"></div>
                                                                
                    <asp:label runat="server" id="lblTotal" class="_50_s m_m_top txt_sm"><b>TOTAL:</b></asp:label>
                    <span class="_50_s m_m_top txt_red p_m_left txt_sm">$ <asp:label runat="server" id="lblTotAmt" >0.00</asp:label></span>
				
                </div>
				
                <div class="underline_solid m_l_top"></div>
                
                <div class="p_m">
                    <div class="p_m _50_m clearfix fl_rt">
                        <asp:Button id="btnChkOut" runat="server" Text="CHECK OUT" OnClick="btnChkOut_Click" CssClass="button round_sd txt_fff" style="background:rgb(255,187,0)"></asp:Button>
                    </div>   
                    
                    <div class="p_m _50_m clearfix">
                         <asp:Button id="btnContShop" runat="server" CssClass="button round_sd txt_fff" Text="CONTINUE SHOPPING" OnClick="btnContShop_Click"  style="background-color:rgb(108, 173, 223)"></asp:Button> <!-- background-color:rgb(108, 173, 223) -->
                    </div>       
                </div>
                  
                <div class="clearfix"></div>

                <div class="block_ntl p_l m_l">
                	<div class="txt_sm">
                        <h3 class="txt_red">Important!</h3>
                        <p>Please check your order carefully, refunds will not be given once items have been delivered.</p>
                	</div>
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
	
</form>

<script type="text/javascript">
	$(document).ready(function(e) {
		// ====================================================== // 								// 			Fix styling
    	var object = $('th').attr('scope','col');
		object.css({'background':'#fafafa','font-weight':'500','font-family':'"Open Sans", sans-serif'}); 
		$('#lblTotAmt').addClass('txt_red');   
	
	
	//Added links script - Arlen
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
