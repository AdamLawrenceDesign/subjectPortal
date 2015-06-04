<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="C#" autoeventwireup="true" inherits="_timeout, App_Web_6uoppshz" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>				<!-- Detect Mobile devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			<!-- Meta Data -->
    
    <title>Subject Portal | Payment</title>
    
    <link rel="shortcut icon" href="img/camera.png"> 								
    
    <link rel="stylesheet" href="css/screen.css?v1.0" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,500italic|Open+Sans:400,300,700,600,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js?v1.0"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

    <script type="text/javascript" src="js/jquery.cycle2.min.js?v1.0"></script>
    <link rel="stylesheet" href="css/popUp.css" />
    
	<script type="text/javascript">
          if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
          alert("Notice! This website does not support versions of Internet Explorer. We recommend using Firefox, Google Chrome, Safari or Opera. Sorry for the inconvenience");
			
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-55081823-1', 'auto');
		  ga('send', 'pageview');
		
		/*	For Error Subject Portal analytics */
		/*  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-55035205-1', 'auto');
		  ga('send', 'pageview');*/
   </script>

    <!-- If IE  -->
    <!--[if gte IE 9]>
          <link rel="stylesheet" href="css/screen_ie.css?v1.0" />
    <![endif]-->
    
</head>

<body oncopy="return false" oncontextmenu="return false">

    <form id="form1" runat="server" class="absolute_max prm_lt">
         
          <div class="_50_m relative bg_fff border_ntl round_sd align_lt">
                             
                <div class="m_l_left m_l_right m_l_top">
                                                                
                    <h1>Timeout</h1>
                    <h2>Session Closed</h2>
                
                </div>
                
                <div class="underline_solid"></div>
                
                <div class="m_l_left m_l_right txt_sm">
                
                    <p>For security reasons your session has timed out, please re-enter your SIC code to continue.</p>
        			
                    <div class="_50_m">
                        <span class="input_area">
                            <input type="text" id="keyCode" runat="server" style='text-transform:uppercase'/>
                        </span>
                    </div>
                    
                    <div class="_50_m p_l_left_break">
                        <button id="btnSubmit" runat="server" onserverclick="btnSubmit_ServerClick" class="button_dk round_sd sec txt_fff" >Submit</button>
                    </div>
                    
                    <div class="clearfix m_l_top m_l_bottom"></div>
                    
                </div>
                
                <div class="underline_solid"></div>
                    
                <div class="clearfix bg_fa p_l">
                     <p class="txt_sm m_l_bottom"><span class="icon-phone fl_lt m_l_right m_s_top"></span>1300 728 972<br /></p>
                     <p class="txt_sm"><span class="icon-mail fl_lt m_l_right m_s_top"></span> enquiries@advancedlife.com.au<br /></p>
                </div>
                
          </div>
    
    </form>

	<script type="text/javascript">
	
		var ubl = { 
			colours:[{ prm : '#00578a', sec : '#0099bc', lt : 'rgba(192, 222, 237, 0.6)', op : '#ffbb00'}],			// #c0deed
			changeDOM:function(){
				$('.prm').css('background-color', this.colours[0].prm);												// blue style default
				$('.sec').css('background-color',  this.colours[0].sec);   				// Sec
				$('.prm_lt').css('background-color', this.colours[0].lt);						// lt
				$('.button_dk').css('background-color',  this.colours[0].op);					// op
				$('.links_line_left li a').css('border-left-color', this.colours[0].op);		// lt
				$('.links_line_right li a').css('border-right-color',  this.colours[0].op);		// lt
				$('blockquote p').css('border-color', this.colours[0].sec)
				$('a:hover').css('color', this.colours[0].op);
			}
		};
		
		$(document).ready(function(){
            var container = $('.bg_fff');
			var height = container.height();
			container.addClass('absolute_vert_center').css({'height':height,'margin':'auto'});
			
			ubl.changeDOM();
			
        });
	
    </script>

</body>
</html>
