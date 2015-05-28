
// group image data
//change subjectData variable to groupData - arlen	  
//convert searhTag1 ? to / - arlen

var schoolData, groupData, preOrderData, num, bannerImages, images,															// Subject Variable
	loader, name, year, price, year, description, preview, pathway, pathway_0,						// page items
	list_item, list, list_link, key																		// add more items
	; 																			

$(window).load(function() {
	 
    schoolData  =  eval("[" + document.getElementById('hSchoolData').value + "]"); 							//   schoolData format[WebName,WebAddress,WebTown,Principal,CssStyle];
    bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]");
	groupData  =  eval("[" + document.getElementById('hGroupData').value + "]"); 

	num 	= groupData.length;															   // get string length 	
	
	pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + groupData[0].ClientID + "/" + groupData[0].SubFolder + "/" + groupData[0].fileName;
	
	
	loader 	= $('.load_item');																   // div and span items 
	name	= $('.img_name');
	year 	= $('.img_year');
	price 	= $('.img_price');
	description = $('.img_description');
	preview = $('#img_preview');
	list 	= $('#img_list');
	phone_list 	= $('#img_phone_list');
	list_link 	= $('#img_list a');
	
	for( i = 0; i < num ; i++ ) {																// Create List main view	
		list_item =  "<li><a href=\"#\" data-link_ref=\"link_lg\" data-num=\"" + i + "\"><span>" + groupData[i].searchTag1.replace('?','\'') + "</span></a></li>";
		list.append(list_item);
	}
	
	for( i = 0; i < num ; i++ ) {																// Create phone view
		list_item =  "<option data-link_ref=\"link_sm\" data-num=\"" + i + "\"><span>" + groupData[i].searchTag1.replace('?','\'') + "</span></option>";
		phone_list.append(list_item);
	}
		
	setTimeout(function(){																			// Display first image	
		loader.fadeOut(800).css('opacity','0');
		$('.img_name').html(groupData[0].searchTag1.replace('?','\''));
		$('.img_year').html(groupData[0].dateOfPhotography);
		$('.img_price').html(groupData[0].unitPrice);
		$('.img_price').attr('data-price',groupData[0].unitPrice);
		$('.img_description').html(groupData[0].Description.replace('-',' ').replace('Album',' Album'));
		$('.img_price').attr('data-price',groupData[0].unitPrice);
		
		document.getElementById('hfValue').value = groupData[0].webClientAssetID; //passing value to hidden field -arlen
		document.getElementById('hfDescription').value = groupData[0].Description; //passing description to hidden field -arlen
		document.getElementById('hfUnitPrice').value = groupData[0].unitPrice; //passing unit price to hidden field - arlen	
		
		$('#cart_qty').val('1');																	// Reset Quantiy
		
		$('#productID').html(groupData[0].webClientAssetID)										// load cart items

		preview.hide('slide',800, function(){
			preview.attr('src',pathway_0).animate({opacity: 'toggle'}, 1000);						// Swing is the default show option work out how to add easing
			$('#main_wrapper').removeClass('opacity_0');
			$('#sec_wrapper').removeClass('opacity_0');
		});
		
		setTimeout(function(){
			$('#document').removeClass('no-event');
		},1600);
		
	},3000) 

	$('#img_list li a:first').addClass('selected_left');											// add selected to first

	$('#img_list li a').click(function(e){
		e.preventDefault();			 															// Stop jumping 
	});
	
	
	$('#nav_rt, #nav_lt, #img_list li a, #img_phone_list option').click(function(e){
		e.preventDefault();																						// Prevent Page skip
		$('#cart_qty').val('1');																				// Reset Quantiy
		loader.stop().fadeIn();
		
		function info_update(key){																				// Update Items
			$('.img_name').html(groupData[key].searchTag1.replace('?','\''));
			$('.img_year').html(groupData[key].dateOfPhotography);
			$('.img_price').html(groupData[key].unitPrice);
			$('.img_description').html(groupData[key].Description.replace('-',' ').replace('Album',' Album'));
			$('.img_price').attr('data-price',groupData[key].unitPrice);
	
			$('#cart_items').html(groupData[key].ProductID)													// load cart items
			pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + groupData[key].ClientID + "/" + groupData[key].SubFolder + "/" + groupData[key].fileName;
		   
		    document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		    document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		    document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen
		    
			preview.fadeOut(600, function(){
				preview.attr('src',pathway_0).fadeIn(600);	
			});

		}
		
		var object_value = $(this).attr('data-link_ref');
		
		switch(object_value){
			
			case 'nav_lt':
					if ($('#img_list li a.selected_left').parent().is(':first-child')){
						
						$('#img_list li a.selected_left').removeClass('selected_left');
						var current = $('#img_list li a:last').addClass('selected_left');
						
						key   = current.attr('data-num');
						info_update(key);		
						
						return false
					}
					
					var place = $('#img_list li a.selected_left').parent().prev();
					
					$('#img_list li a.selected_left').removeClass('selected_left');
					
					var	next  = place.find('a').addClass('selected_left');
											
					key   = next.attr('data-num');
					info_update(key);
					
					document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		            document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		            document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen
		            
			break;
			
			case 'nav_rt':
					if ($('#img_list li a.selected_left').parent().is(':last-child')){
						
						$('#img_list li a.selected_left').removeClass('selected_left');
						var current = $('#img_list li a:first').addClass('selected_left');
						
						key   = current.attr('data-num');
						info_update(key);	
												
						return false
					}
					
					var place = $('#img_list li a.selected_left').parent().next();
					
					$('#img_list li a.selected_left').removeClass('selected_left');
					
					var	next  = place.find('a').addClass('selected_left');
						
					key   = next.attr('data-num');
					info_update(key);	
					
					document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		            document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		            document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen																	// Update Info
			break;
			
			case 'link_lg':
				
				$('#img_list li a').removeClass('selected_left');
				$(this).addClass('selected_left');
				
				var key = $(this).attr('data-num');
				info_update(key);
				
			break;
			
			case 'link_sm':
				
				var key = $(this).attr('data-num');
				info_update(key);
				
			break;
			
		}
		loader.fadeOut();
	});
	
	
	function preload() {																		// function to preload images | Leave till end of functions
		for (i = 0; i < num ; i++) {															// hack for google chrome
			var img = img + i;
			img_new = new Image();
			img_new.src = "https://advancedimage.com.au/lifebuyimages//" + groupData[i].ClientID + "/" + groupData[i].SubFolder + "/" + groupData[i].fileName;
			img_new_path = "https://advancedimage.com.au/lifebuyimages//" + groupData[i].ClientID + "/" + groupData[i].SubFolder + "/" + groupData[i].fileName;
			
			$('#img_preload').append("<img src=\"" + img_new_path + "\" alt=\"\" />");
			
		}
	}
	preload();	
	
	
	$('#cart_qty').on('change',function(){																	// change price
		var newPrice = $(this).val() * $('.img_price').attr('data-price');
		$('.img_price').html(newPrice);

	});
	
	$('.cart_add').click(function(){																	// Add to cart
		var qty = "Quantity:" + $('#cart_qty').val() + ";";
		var productID = "Product:" + $('#productID').html() + ";";
	});
	
	
	$(function(){
		var wrapper_h = $('main').outerHeight(),
			ntl_h = $('.title_ntl').outerHeight(),
			img_list_h = wrapper_h - ntl_h;
			
		$('#img_list').innerHeight(img_list_h + 'px').css('overflow','auto');
		
		console.log(wrapper_h);
	});
	
	$('#addCart').css('background-color','rgb(108, 173, 223)');
	
	$(function(){
		$('.scroll-pane').jScrollPane();
	});

});
