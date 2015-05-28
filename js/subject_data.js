
var portraitData, schoolData, bannerImages,	 num,													// portrait data
	name_full, name_given, name_surname, img_latest, img_oldest, img_latest_year, img_oldest_year,	// individual data		
	groupData, group_num,																			// individual data		
	school_name, school_address, img_banner, logoPathway, logo;										// school data	
	
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
	var ubm = { colours: [{ prm : '#006bb1', sec : '#0099bc', lt : 'rgba(192, 222, 237, 0.6)', op : '#f6b200' }]}; 		// #c0deed  ///rgba(192, 222, 237, 0.6)
	var ubc = { colours: [{ prm : '#9f3a90', sec : '#e26ae3', lt : 'rgba(255, 233, 192, 0.6)', op : '#e26ae3' }]};		// #ffe9c0   { prm : '#9f3a90', sec : '#ffa800', lt : '#ffe9c0', op : '#d59693' }]};
	var udo = { colours: [{ prm : '#017051', sec : '#017051', lt : 'rgba(228, 194, 194, 0.6)', op : '#9c1b3a' }]};		// #e4c2c2
	var ugr = { colours: [{ prm : '#005c2f', sec : '#00894b', lt : 'rgba(209, 214, 215, 0.6)', op : '#00894b' }]};		// #f69211
	var ugo = { colours: [{ prm : '#fcb600', sec : '#ffa800', lt : 'rgba(209, 214, 215, 0.6)', op : '#ffa800' }]};					//	#d1d6d7
	var uma = { colours: [{ prm : '#711a3f', sec : '#6caddf', lt : 'rgba(209, 214, 215, 0.6)', op : '#6caddf' }]};					//
	var umn = { colours: [{ prm : '#6f2f40', sec : '#ffa800', lt : 'rgba(255, 233, 192, 0.6)', op : '#d59693' }]};					//		ffe9c0
	var una = { colours: [{ prm : '#002b5c', sec : '#6caddf', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' }]};					//
	var une = { colours: [{ prm : '#292f33', sec : '#ffa800', lt : 'rgba(209, 214, 215, 0.6)', op : '#ffa800' }]};					//
	var upl = { colours: [{ prm : '#b62e2e', sec : '#ffa800', lt : 'rgba(192, 222, 237, 0.6)', op : '#d59693' }]};					//   #c0deed
	var upu = { colours: [{ prm : '#753b92', sec : '#ffa800', lt : 'rgba(209, 214, 215, 0.6)', op : '#d59693' }]};					//
	var ure = { colours: [{ prm : '#c41425', sec : '#ee3129', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' }]}; // #c0deed  ///rgba(192, 222, 237, 0.6)

$(document).ready(function() {																	//======= wait till page loads ========//
																								//======= Show hide options 
	var menu_lg		 = $("#menu_lg"),															//======= Slide Toggle ========//
		menu_help	 = $("#menu_help_lg"),
		menu_preview = $("#menu_preview"),
		menu_toggle  = $('.menu_lg_toggle'),
		menu_toggle_h= $('.menu_help_toggle'),
		nav_li		 = $('nav li');
	
	function slide_toggle(x,y) {																//======= menu Show Hide ========//
		y.click(function(){
			$('html, body').animate({scrollTop: 0},800);
			x.slideToggle();
		})
	}
	
	slide_toggle(menu_lg, menu_toggle);
	slide_toggle(menu_help, menu_toggle_h);
	
	$('.show_expand').click(function(){
		$(this).next(
			$('.show_area').slideDown()
		)
	});
	
	$('.show_collapse').click(function(){
		$('.show_area').slideUp();
	});

	function CreateLinks(){
		var url = window.location.href,
			urlLength = url.length,
			SicCode = url.search("aspx") + 4,	
			encryt = url.substr(SicCode,urlLength);
		
		$('.index').attr( 'href' , 'index.aspx' + encryt );
		$('.downloads').attr( 'href' , 'downloads.aspx' + encryt );
		$('.group_img').attr( 'href' , 'group_img.aspx' + encryt );
		$('.packages').attr( 'href' , 'packages.aspx' + encryt );
		$('.gift_items').attr( 'href' , 'gift_items.aspx' + encryt );
		$('.payment').attr( 'href' , 'payment.aspx' + encryt );
		$('.thank_you').attr( 'href' , 'thank_you.aspx' + encryt );
		$('.cart').attr( 'href' , 'cart.aspx' + encryt );
		$('.contact_us').attr( 'href' , 'contact_us.aspx' + encryt );
	};
	
	CreateLinks();

});

$(window).load(function() {

	schoolData =  eval("[" + document.getElementById('hSchoolData').value + "]"); 
    bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]"); 
    portraitData  =  eval("[" + document.getElementById('hPortraitData').value + "]"); 
    //groupData  =  eval("[" + document.getElementById('hGroupData').value + "]"); 

	num 	= portraitData.length;												 			  // get string length 	
	
	var ColourValue = window[schoolData[0].CssStyle];
	ColourValue.changeDOM = ubl.changeDOM.bind(ColourValue);						// bind the function from the ubl colour change			
	ColourValue.changeDOM();
	
	//====================================//									  			 // Student Details
	
	name_given = portraitData[0].FirstName;
	name_surname = portraitData[0].LastName;
	name_full = name_given + " " + name_surname;
	img_latest = "https://advancedimage.com.au/lifebuyimages//" + portraitData[0].DstImage;
	img_latest_year = portraitData[0].YearPhoto;
	img_oldest_year = portraitData[num-1].YearPhoto;
	
	$('.name_full').html(name_full);
	$('.name_given').html(name_given);
	$('.img_latest_year').html(img_latest_year);
	$('.img_oldest_year').html(img_oldest_year);
	$('.img_latest').attr('src',img_latest);
	
	//====================================//									   // School Details
    
	logoPathway = "https://advancedimage.com.au/lifebuyimages/" + schoolData[0].ClientID + "/Assets/PublicPortal/Logo.png";
	$('.school_logo').attr('src',logoPathway);
	
	name_school = schoolData[0].WebName.replace('?','\'');
	//logo  = "/lifebuyimages/" + schoolData.ClientID + "/Assets/PublicPortal/Logo.png"; /lifebuyimages/21674/Assets/PublicPortal/Banner_2012 33369 schoolimage1.jpg
	img_banner = "https://advancedimage.com.au/lifebuyimages/" + schoolData[0].ClientID + "/Assets/PublicPortal/" + bannerImages[0].img_0; //+ image;
	

	$('.school_name').html(name_school);
	//$('.img_banner').attr('src', img_banner);
	
	if( portraitData[0].Cost == "0.00"){
		$('.download_promo').removeClass('hidden');
	};

});

