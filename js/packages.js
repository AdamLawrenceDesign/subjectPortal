// Downloads

var portraitData, schoolData, bannerImages,	 num,														// portrait data
	name_full, name_given, name_surname, img_latest, img_oldest, img_latest_year, img_oldest_year,		// individual data	
	list_items,																				// individual data
	school_name, school_address, img_banner, logo; 														// school data																			

$(window).load(function() {
	 
	 schoolData =  eval("[" + document.getElementById('hSchoolData').value + "]"); 
    //schoolData 	= {'ClientID':'21674','WebName':'ST LUKE?S GRAMMAR SCHOOL','WebAddress':'210 HEADLAND ROAD','WebTown':'DEE WHY NSW 2099','Principal':'MRS JANN ROBINSON','CssStyle':'ubl'};
	//bannerImages = {'img_0':'Banner_2012 33369 schoolimage1.jpg'};
	
     portraitData  =  eval("[" + document.getElementById('hPortraitData').value + "]"); 
	/*portraitData = [{'EventID':'110939','ID':'4889474','PrimarySubjectID':'844157','SIC':'7D4Z2V63L','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'1/01/0001 12:00:00 AM','Folder':'Year 10','SchYr':'10','ImagePortrait':'True','DstImage':'4239/37951/154581077(7D4Z2V63L).jpg','CostCode':'Pk13','YearPhoto':'2013','Cost':'8.00','EnrolmentYear':'2003'},
					{'EventID':'107696','ID':'3390429','PrimarySubjectID':'844157','SIC':'8Y89W7NNF','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'9D1','SchYr':'9','ImagePortrait':'True','DstImage':'4239/34084/154462433(8Y89W7NNF).jpg','CostCode':'Pk12','YearPhoto':'2012','Cost':'8.00','EnrolmentYear':'2003'},
					{'EventID':'105157','ID':'2414323','PrimarySubjectID':'844157','SIC':'BGYQZZZ4F','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 8','SchYr':'8','ImagePortrait':'True','DstImage':'4239/29458/155437383(XQXKATL).jpg','CostCode':'Pk11','YearPhoto':'2011','Cost':'8.00','EnrolmentYear':'2003'},
					{'EventID':'103396','ID':'1548011','PrimarySubjectID':'844157','SIC':'FKNWYJKX5','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 7','SchYr':'7','ImagePortrait':'True','DstImage':'4239/25210/156486702(XQX81T3).jpg','CostCode':'Pk10','YearPhoto':'2010','Cost':'8.00','EnrolmentYear':'2003'},
					{'EventID':'102036','ID':'844157','PrimarySubjectID':'844157','SIC':'3JQ8ZDAX1','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Class 6P','SchYr':'6','ImagePortrait':'True','DstImage':'4239/21722/252684724(XAXRYXL).jpg','CostCode':'Pk09','YearPhoto':'2009','Cost':'8.00','EnrolmentYear':'2003'}
					];*/


	num 	= portraitData.length;												   // get string length 	
	
	var list_create = function(){
		for( i = 0; i < num ; i++ ) {
			list_items	= '<li><div class=\"product_wrapper_25 txt_sm align_ct\"><a href=\"#\"><img class=\"product_thumb\" src=\"https://advancedimage.com.au/lifebuyimages//' + portraitData[i].DstImage + '\" alt=\"\" /></a><span class=\"product_title clearfix p_m_left p_m_right\"><h4 class=\"m_l_top product_title\">' + portraitData[i].YearPhoto + ' School Package</h4><strike class=\"hidden\">$ 8.00</strike><span class=\"image_name\" style=\"color:red\"> &nbsp; $ ' +  portraitData[i].Cost + '</span><br/><a class=\"txt_sm m_l_top\"><span class=\"txt_sm\">INFORMATION</span></a></span><div class=\"p_m\"><button class=\"bg_sec button_dk _100 square\">ADD TO CART</button></div></div></li>\n\r';         
			
			$('#image_list').append(list_items);
			
			var v = num - 1;
			if(	i == v){
				$('#image_list').append('<li><div class=\"product_wrapper_25 invisible\">&nbsp;</div></li>\n\r<li><div class=\"product_wrapper_25 invisible\">&nbsp;</div></li>\n\r<div class=\"stretch\"></div>\n\r');
			}
		} 	
	};
	
	var update_list = function(){
		var strike_amount = '$' + (num * 8) + '.00',
			all_price;
		$('.all_strike').html(strike_amount);
		
		if (num >= 3) {
			all_price = '$' + (2 * 8) + '.00';
		} 
		
		if (num >= 5) {
			all_price = '$' + (3 * 8) + '.00';
		} 
		
		if (num >= 8) {
			all_price = '$' + (4 * 8) + '.00';
		} 
		
		$('.all_price').html(all_price);
		
	};
	
	list_create();
	update_list();
	
	
	$('.cart_add').click(function(){																	// Add to cart
		//var qty = "Quantity:" + $('#cart_qty').val() + ";";											amend this section to container
		///var productID = "Product:" + $('#productID').html() + ";";
	});
																						
});
