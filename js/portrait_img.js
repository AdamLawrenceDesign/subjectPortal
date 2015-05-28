
// group image data
	  
var portraitData, preOrderData, num, images,															// Subject Variable
	loader, name, year, price, year, description, preview, pathway, pathway_0,						// page items
	list_item, list, list_link 																		// add more items
	; 																			

$(window).load(function() {
	 
    //schoolData format[WebName,WebAddress,WebTown,Principal,CssStyle];
	
	// use this on Server
    //portraitData  =  eval("[" + document.getElementById('hPortraitData').value + "]"); 
	portraitData = [{'EventID':'110939','ID':'4889474','PrimarySubjectID':'844157','SIC':'7D4Z2V63L','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'1/01/0001 12:00:00 AM','Folder':'Year 10','SchYr':'10','ImagePortrait':'True','DstImage':'4239\37951\154581077(7D4Z2V63L).jpg','CostCode':'Pk13','YearPhoto':'2013','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'107696','ID':'3390429','PrimarySubjectID':'844157','SIC':'8Y89W7NNF','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'9D1','SchYr':'9','ImagePortrait':'True','DstImage':'4239\34084\154462433(8Y89W7NNF).jpg','CostCode':'Pk12','YearPhoto':'2012','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'105157','ID':'2414323','PrimarySubjectID':'844157','SIC':'BGYQZZZ4F','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 8','SchYr':'8','ImagePortrait':'True','DstImage':'4239\29458\155437383(XQXKATL).jpg','CostCode':'Pk11','YearPhoto':'2011','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'103396','ID':'1548011','PrimarySubjectID':'844157','SIC':'FKNWYJKX5','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 7','SchYr':'7','ImagePortrait':'True','DstImage':'4239\25210\156486702(XQX81T3).jpg','CostCode':'Pk10','YearPhoto':'2010','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'102036','ID':'844157','PrimarySubjectID':'844157','SIC':'3JQ8ZDAX1','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Class 6P','SchYr':'6','ImagePortrait':'True','DstImage':'4239\21722\252684724(XAXRYXL).jpg','CostCode':'Pk09','YearPhoto':'2009','Cost':'4.00','EnrolmentYear':'2003'}
					];
	
	num 	= portraitData.length;															   // get string length 	
	
	pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + portraitData[0].DstImage ;
	
	loader 	= $('.load_item');																   // div and span items 
	name	= $('.img_name');
	year 	= $('.img_year');
	price 	= $('.img_price');
	description = $('.img_description');
	preview = $('#img_preview');
	list 	= $('#img_list');
	list_link 	= $('#img_list a');
	
	function hide_show(x,y){																	// Hide Change content then show
		x.fadeOut(400,function(){ x.html(y).fadeIn(800) })	
	};	

	for( i = 0; i < num ; i++ ) {
		list_item =  "<li><a href=\"#\" data-num=\"" + i + "\"><span>" + portraitData[i].searchTag1 + "</span></a></li>";
		list.append(list_item);
	}
		
	setTimeout(function(){	
																									// Display first image
		loader.fadeOut(800).css('opacity','0');
		$('.img_name').html(portraitData[0].searchTag1);
		$('.img_year').html(portraitData[0].dateOfPhotography);
		$('.img_price').html(portraitData[0].unitPrice);
		$('.img_description').html(portraitData[0].Description);
		$('.img_price').attr('data-price',portraitData[0].unitPrice);
		
		$('#cart_qty').val('1');																				// Reset Quantiy
		
		$('#productID').html(portraitData[0].webClientAssetID)										// load cart items

		preview.hide('slide',800, function(){
			preview.attr('src',pathway_0).animate({opacity: 'toggle'}, 1000);						// Swing is the default show option work out how to add easing
			$('#main_wrapper').removeClass('opacity_0');
			$('#sec_wrapper').removeClass('opacity_0');
		})
	},3000) 

	$('#img_list li a:first').addClass('selected_left');											// add selected to first

	$('#img_list li a').click(function(e){
		e.preventDefault();																		// Stop jumping 
		
		$('#img_list li a').removeClass('selected_left');
		$(this).addClass('selected_left');
		
		$('#cart_qty').val('1');																				// Reset Quantiy
		
		var key = $(this).attr('data-num');
		
		$('.img_name').fadeOut(400,function(){ $('.img_name').html(portraitData[key].searchTag1).fadeIn(800) })
		$('.img_year').fadeOut(400,function(){ $('.img_year').html(portraitData[key].dateOfPhotography).fadeIn(800) })
		$('.img_price').fadeOut(400,function(){ $('.img_price').html(portraitData[key].unitPrice).fadeIn(800) })
		$('.img_description').fadeOut(400,function(){ $('.img_description').html(portraitData[key].Description).fadeIn(800) })
		$('.img_price').attr('data-price',portraitData[0].unitPrice);

		$('#cart_items').html(portraitData[key].ProductID)// load cart items
		
		pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + portraitData[key].ClientID + "/" + portraitData[key].SubFolder + "/" + portraitData[key].fileName;
		
		preview.hide('slide',{easing: 'easeInOutQuart',direction: 'left'},1000, function(){
			preview.attr('src',pathway_0).show('slide',{easing: 'easeInOutQuart',direction: 'right'},1000);					// Swing is the default show option work out how to add easing
		})
	});

	$('#nav_lt').click(function(e){
		e.preventDefault();
		// var key = $('#img_list').find('.selected_left');
		if ($('#img_list li a.selected_left').parent().is(':first-child')){
			return false
		}
		
		var place = $('#img_list li a.selected_left').parent().prev();
		
		$('#cart_qty').val('1');																				// Reset Quantiy
		
		$('#img_list li a.selected_left').removeClass('selected_left');
		
		var	next  = place.find('a').addClass('selected_left');
			
		key   = next.attr('data-num');
		
		$('.img_name').fadeOut(400,function(){ $('.img_name').html(portraitData[key].searchTag1).fadeIn(800) })
		$('.img_year').fadeOut(400,function(){ $('.img_year').html(portraitData[key].dateOfPhotography).fadeIn(800) })
		$('.img_price').fadeOut(400,function(){ $('.img_price').html(portraitData[key].unitPrice).fadeIn(800) })
		$('.img_description').fadeOut(400,function(){ $('.img_description').html(portraitData[key].Description).fadeIn(800) })
		$('.img_price').attr('data-price',portraitData[0].unitPrice);

		$('#cart_items').html(portraitData[key].ProductID)// load cart items
		
		pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + portraitData[key].ClientID + "/" + portraitData[key].SubFolder + "/" + portraitData[key].fileName;
		
		preview.hide('slide',{easing: 'easeInOutQuart',direction: 'left'},1000, function(){
			preview.attr('src',pathway_0).show('slide',{easing: 'easeInOutQuart',direction: 'right'},1000);					// Swing is the default show option work out how to add easing
		})
		
	});
	
	$('#nav_rt').click(function(e){
		e.preventDefault();
		// var key = $('#img_list').find('.selected_left');
		if ($('#img_list li a.selected_left').parent().is(':last-child')){
			return false
		}
		
		var place = $('#img_list li a.selected_left').parent().next();
		
		$('#cart_qty').val('1');																				// Reset Quantiy
		
		$('#img_list li a.selected_left').removeClass('selected_left');
		
		var	next  = place.find('a').addClass('selected_left');
			
		key   = next.attr('data-num');
		
		$('.img_name').fadeOut(400,function(){ $('.img_name').html(portraitData[key].searchTag1).fadeIn(800) })
		$('.img_year').fadeOut(400,function(){ $('.img_year').html(portraitData[key].dateOfPhotography).fadeIn(800) })
		$('.img_price').fadeOut(400,function(){ $('.img_price').html(portraitData[key].unitPrice).fadeIn(800) })
		$('.img_description').fadeOut(400,function(){ $('.img_description').html(portraitData[key].Description).fadeIn(800) })
		$('.img_price').attr('data-price',portraitData[0].unitPrice);

		$('#cart_items').html(portraitData[key].ProductID)// load cart items
		
		pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + portraitData[key].ClientID + "/" + portraitData[key].SubFolder + "/" + portraitData[key].fileName;
		
		preview.hide('slide',{easing: 'easeInOutQuart',direction: 'right'},1000, function(){
			preview.attr('src',pathway_0).show('slide',{easing: 'easeInOutQuart',direction: 'left'},1000);					// Swing is the default show option work out how to add easing
		})
	});
	
	
	function preload() {																		// function to preload images | Leave till end of functions
		for (i = 0; i < num ; i++) {															// hack for google chrome
			var img = img + i;
			img_new = new Image();
			img_new.src = "https://advancedimage.com.au/lifebuyimages//" + portraitData[i].ClientID + "/" + portraitData[i].SubFolder + "/" + portraitData[i].fileName;
			img_new_path = "https://advancedimage.com.au/lifebuyimages//" + portraitData[i].ClientID + "/" + portraitData[i].SubFolder + "/" + portraitData[i].fileName;
			
			$('#img_preload').append("<img src=\"" + img_new_path + "\" alt=\"\" />");
			
		}
	}
	preload();	
	
	$(function(){
		$('#filter_list').fastLiveFilter('#img_list');
	});
	
	$('#filter_clear').click(function(){
		$('#filter_list').val('');
		$('#img_list li').css('display','block');
	});
	
	$('#cart_qty').on('change',function(){																	// change price
		var newPrice = $(this).val() * $('.img_price').attr('data-price');
		$('.img_price').html(newPrice);

	});
	
	$('.cart_add').click(function(){																	// Add to cart
		var qty = "Quantity:" + $('#cart_qty').val() + ";";
		var productID = "Product:" + $('#productID').html() + ";";
	});
																						
});
