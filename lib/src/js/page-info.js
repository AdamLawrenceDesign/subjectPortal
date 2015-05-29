/***********************************************
	Function:	Page Info
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function PageInfo(schoolData, bannerData, portraitData, groupData)
{
	this.schoolData = schoolData;
	this.bannerData = bannerData;
	this.portraitData = portraitData;
	this.groupData = groupData;
	this.init();
};

PageInfo.prototype.siblingCheck = function()
{
	var isSibling = this.portraitData[0].ImageIsPortrait,
		LastName = this.portraitData[0].LastName;
	
	if(isSibling == 'False')
	{
		$('.group_img').parent().addClass('hidden');
		$('aside h3').html(LastName + ' Family');

		$('.main_wrapper h2').html('Our Photos');
		$('.name_full').html('The ' + LastName + ' Family');
		$('title').html(LastName + ' Family | Photo Portal');
		$('.name_given').html('The ' + LastName + ' Family');	
	};
};

PageInfo.prototype.bannerInit = function()
{
	var img_banner = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/" + this.bannerData[0]; //[0].img_0;							

	var objCount=0;
	for(_obj in this.bannerData[0]){ objCount++};
	
	for( var i = 0; i < objCount ; i = i + 1){		// Hide div's
		var image = this.bannerData[0][i];
			
		if( image != ''){
			var bannerPathway = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/" + image   ;
			var imageObject = "<img class=\"full border_ntl \" src=\"" + bannerPathway + "\"" + " alt=\"\" style=\"padding:.2em\" />";
			$('.img_banner').append(imageObject);
		}
		
	}
	
	if ($('.img_banner').html() == ''){
		$('.img_banner').append("<img class=\"full\" src=\"img/generic_banner.png\" alt=\"\" />");
	};	
};

PageInfo.prototype.updateClientDetails = function()
{
	var logoPathway = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/Logo.png",
		name_school = this.schoolData[0].WebName.replace('?','\'');
		
	$('.school_logo').attr('src',logoPathway);
	$('.school_name').html(name_school);
	
	var link = document.createElement('link');
	link.type = 'image/x-icon';
	link.rel = 'shortcut icon';
	link.href = logoPathway;
	document.getElementsByTagName('head')[0].appendChild(link);			
};

PageInfo.prototype.updateIndividualDetails = function()
{
	var name_given = this.portraitData[0].FirstName.replace('?','\''),
		name_surname = this.portraitData[0].LastName.replace('?','\''),
		name_full = name_given + " " + name_surname,
		img_latest = "https://advancedimage.com.au/lifebuyimages//" + this.portraitData[0].DstImage,
		photo_year = this.portraitData[0].YearPhoto;
	
	$('.name_full').html(name_full);
	$('.name_given').html(name_given);
	$('.img_latest').attr('src',img_latest);
	$('.img_latest_year').html(this.portraitData[0].YearPhoto);
	$('title').html(name_full + ' | My Photos' );
	
	if(typeof this.groupData[0] === 'undefined')
	{
		$('.group_img').parent().addClass('hidden');
	};	
};

PageInfo.prototype.init = function()
{
	this.updateIndividualDetails();
	this.updateClientDetails();
	this.bannerInit();
	this.siblingCheck();
};
