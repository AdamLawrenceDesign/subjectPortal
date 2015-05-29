/***********************************************
	Function:	Contact Validation
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function ContactValidation()
{
	this.init();
}

ContactValidation.prototype.init = function()
{
	var contact_validation = {
				
				ClientInfo : eval("[" + document.getElementById('hSchoolData').value + "]"),
				UserInfo : eval("[" + document.getElementById('hFirstImgPortrait').value + "]"),
				
				// ================================================// 										Update form items  
				
				update_details : function(){
                      $('#PortalInfo').val(this.ClientInfo[0].ClientID);
                      $('#UserInfo').val(this.UserInfo[0].FirstName + ' ' + this.UserInfo[0].LastName + '; Class: ' + this.UserInfo[0].Folder );
					  console.log(this.ClientInfo[0].ClientID);
				},
				  
				// ================================================// 										Object Status  
			
				remove_status:function(event){	
					$('.input-icon').empty();																// Remove all spinners
					$(event).parent().removeClass('error').removeClass('focus').removeClass('valid');		// Remove Errors
					$(event).parent().find('.input-icon').empty().removeClass('icon-cross').removeClass('icon-checkmark2');	// Remove Valid
				},
				
				error_status:function(event){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(this).parent().removeClass('valid').addClass('error');
					$(this).parent().find('span').removeClass('icon-checkmark2').addClass('icon-cross');
				},
				
				error_status_obejct:function(object){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(object).parent().removeClass('valid').addClass('error');
					$(object).parent().find('span').removeClass('icon-checkmark2').addClass('icon-cross');
				},
				
				valid_status:function(event){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(this).parent().removeClass('error').addClass('valid');
					$(this).parent().find('span').removeClass('icon-cross').addClass('icon-checkmark2');
				},
				
				valid_status_object:function(object){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(object).parent().removeClass('error').addClass('valid');
					$(object).parent().find('span').removeClass('icon-cross').addClass('icon-checkmark2');
				},
				
				spinner:function(event){
					var remove = this.remove_status.bind(event);
					remove(event);
					
					var focus_img = document.createElement('img');										// Create Image spinner
					focus_img.src = 'svg/loading/loader_grey.gif';
					
					$(event).parent().find('span').append(focus_img).attr('src','svg/loading/loader_grey.gif');
					$(event).parent().addClass('focus'); 
					
					setTimeout(function(){																		// Later add some server validation
						$(event).parent().find('span').empty();
					},2000);					
				},
				
				empty_value:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val();
					$(event).val() === '' ? error(event): valid(event);	
						
				},
				
				empty_check:function(event){
					var error = contact_validation.error_status.bind(event);
					$(event).val() === "" ? error(event) : "";													// Replacement for Error Status					
				},
				
				check_email:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val(),
						filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

					!filter.test(value) === true ? error(event): valid(event);

				},
				
				email_match:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val(),
						email = $('#email').val();
					
					if(value == ''){
						error(event);
						return false
					} else {
						if(value != email){
							error(event);
						} else {
							valid(event);
						};
					}
				},
				
				phone_check:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val().replace(/ |-/g,''),
						filter = /^\d{8}$|^\d{10}$/;

					!filter.test(value) === true ? error(event): valid(event);
				}						
	};
	
	contact_validation.update_details();
	
	$('input[type=text]').on('focus',function(){
		contact_validation.spinner(this)
	});
	
	$('input[type=text]').on('blur',function(){
		contact_validation.empty_check(this)
	});
	
	$('#name').on('blur',function(){
		contact_validation.empty_value(this);
	});
	
	$('#email').on('blur',function(){
		contact_validation.check_email(this);
	});
	
	$('#email_match').on('blur',function(){
		contact_validation.email_match(this);
	});
	
	$('#phone').on('blur',function(){
		contact_validation.phone_check(this);
	});
	
	$('#message').on('blur',function(){
		contact_validation.empty_value(this);
	});
	
	$('#submit').click(function(){
		//contact_validation.button_click(this);
		//console.log(this);
		
		var form = [0,0,0,0,0];
		var	total = 0,
			name = $('#name').val(),
			email = $('#email').val(),
			email_match = $('#email_match').val(),
			phone = $('#phone').val().replace(/ |-/g,''),
			contact_preference = $('#contact_preference').val(),
			message = $('#message').val(),
			phone_filter = /^\d{8}$|^\d{10}$/,
			email_filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		var error = contact_validation.error_status_obejct.bind(),
			valid = contact_validation.valid_status_object.bind();
		
		name != '' === false ? error('#name'):valid('#name');
		!email_filter.test(email) === true ? error('#email'):valid('#email');
		email_match != email  === true ? error('#email_match') : valid('#email_match') ;	
		!phone_filter.test(phone) === true ? error('#phone'): valid('#phone');	
		message === "" ? error('#message') : valid('#message');
			
		form[0] = (name != '') ? 1:0;
		form[1] = (email != 'Select') ? 1:0;
		form[2] = (email_match != email || email_match != '' ) ? 1:0; 
		form[3] = (!phone_filter.test(phone) != true) ? 1:0; 
		form[4] = (message != "") ? 1:0; 
		
		for(var i = 0; i < 5; i++){
			total += form[i];
		}
		
		if(total != 5){
			$('#form_errors').addClass('m_l_top').html('<b>Error:</b> There are errors with your form, please check valid fields are entered correctly')
			return false;
		} else {
			$('#form_errors').removeClass('m_l_top').html('');
			console.log('success');
		}
		
	});
	
	
	/*
	
	// ================================================// 										binding example incase I forget  
	  
	Test:function(TestPortrait){
		console.log(TestPortrait);
	},
	TestBind:function(){
		var showDataVar = this.Test.bind(); 								// This is how you bind functions within your Object;
		showDataVar('Bind Successful');
	},
	
	// ================================================// 										How to create a time on typing 

	var typingTimer;                		//timer identifier									//setup before functions
	var doneTypingInterval = 5000;  		//time in ms, 5 second for example
	
	$('input').keyup(function(){																//on keyup, start the countdown
		clearTimeout(typingTimer);
		typingTimer = setTimeout(doneTyping, doneTypingInterval);
	});
	
	$('input').keydown(function(){															//on keydown, clear the countdown 
		clearTimeout(typingTimer);
	});
	
	function doneTyping () {																	//user is "finished typing," do something
		//do something
	}
	*/
};
