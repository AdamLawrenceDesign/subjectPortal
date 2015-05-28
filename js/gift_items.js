
// group image data
	  
var portraitData, schoolData, bannerImages,	 num,													// portrait data
	name_full, name_given, name_surname, img_latest, img_oldest, img_latest_year, img_oldest_year,		// individual data		
	groupData, group_num,		// individual data		
	school_name, school_address, img_banner, logoPathway, logo; 																// school data																			

$(window).load(function() {
	 
    schoolData 	= {'ClientID':'21674','WebName':'ST LUKE?S GRAMMAR SCHOOL','WebAddress':'210 HEADLAND ROAD','WebTown':'DEE WHY NSW 2099','Principal':'MRS JANN ROBINSON','CssStyle':'ubl'};
	bannerImages = {'img_0':'Banner_2012 33369 schoolimage1.jpg'};
	
	// use this on Server
    //portraitData  =  eval("[" + document.getElementById('hPortraitData').value + "]"); 
	portraitData = [{'EventID':'110939','ID':'4889474','PrimarySubjectID':'844157','SIC':'7D4Z2V63L','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'1/01/0001 12:00:00 AM','Folder':'Year 10','SchYr':'10','ImagePortrait':'True','DstImage':'4239/37951/154581077(7D4Z2V63L).jpg','CostCode':'Pk13','YearPhoto':'2013','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'107696','ID':'3390429','PrimarySubjectID':'844157','SIC':'8Y89W7NNF','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'9D1','SchYr':'9','ImagePortrait':'True','DstImage':'4239/34084/154462433(8Y89W7NNF).jpg','CostCode':'Pk12','YearPhoto':'2012','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'105157','ID':'2414323','PrimarySubjectID':'844157','SIC':'BGYQZZZ4F','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 8','SchYr':'8','ImagePortrait':'True','DstImage':'4239/29458/155437383(XQXKATL).jpg','CostCode':'Pk11','YearPhoto':'2011','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'103396','ID':'1548011','PrimarySubjectID':'844157','SIC':'FKNWYJKX5','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Year 7','SchYr':'7','ImagePortrait':'True','DstImage':'4239/25210/156486702(XQX81T3).jpg','CostCode':'Pk10','YearPhoto':'2010','Cost':'4.00','EnrolmentYear':'2003'},
					{'EventID':'102036','ID':'844157','PrimarySubjectID':'844157','SIC':'3JQ8ZDAX1','LastName':'Isherwood','FirstName':'Tom','DateOfBirth':'23/05/1997 12:00:00 AM','Folder':'Class 6P','SchYr':'6','ImagePortrait':'True','DstImage':'4239/21722/252684724(XAXRYXL).jpg','CostCode':'Pk09','YearPhoto':'2009','Cost':'4.00','EnrolmentYear':'2003'}
					];
	
	groupData = [{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'89067_ULT_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'3R - 2011','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'45345_ULT_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'2T - 2010','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'126971_ULT_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'5-4D - 2012','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'172436_ULT_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'6F 2014','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'214299_ULT_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'Class 1D 2009','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'9954_SS.jpg','ProductID':'SampleNumber','searchTag1':'Class Patrons 2014','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'181281_USSN.jpg','ProductID':'SampleNumber','searchTag1':'SRC 2013','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'127104_ECS30.jpg','ProductID':'SampleNumber','searchTag1':'Whole School ECS30 2012','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'89189_ECS30.jpg','ProductID':'SampleNumber','searchTag1':'Whole School ECS30 2011','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'},
			{'webClientAssetID':'25','ClientID':'744','SubFolder':'Groups/Album','fileName':'213945_GW1_ZZALB.jpg','ProductID':'SampleNumber','searchTag1':'Year 6 2014','dateOfPhotography':'23/10/2011','unitPrice':'25.00','Description':'Photographic Print Large','webName':'Balgowlah Heights Public School'}];

	group_num = groupData.length;	
	num 	= portraitData.length;												   // get string length 	
	
	//====================================//									   // Student Details
	
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
	
	logoPathway = "https://advancedimage.com.au/lifebuyimages/" + schoolData.ClientID + "/Assets/PublicPortal/Logo.png";
	$('.school_logo').attr('src',logoPathway);
	
	name_school = schoolData.WebName.replace('?','\'');
	console.log(bannerImages.img_0);
	//logo  = "/lifebuyimages/" + schoolData.ClientID + "/Assets/PublicPortal/Logo.png"; /lifebuyimages/21674/Assets/PublicPortal/Banner_2012 33369 schoolimage1.jpg
	img_banner = "https://advancedimage.com.au/lifebuyimages/" + schoolData.ClientID + "/Assets/PublicPortal/" + bannerImages.img_0 ; //+ image;
	
	$('.school_name').html(name_school);
	$('.img_banner').attr('src', img_banner);
	
	if( portraitData[0].Cost == "0.00"){
		$('.download_promo').removeClass('hidden');
	};
	
	
	
});
// JavaScript Document