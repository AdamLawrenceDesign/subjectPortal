/***********************************************
	Function:	Create Packages
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/
/*
$(function(){

var school = eval("[" + document.getElementById('hSchoolData').value + "]"),
	person = eval("[" + document.getElementById('hData').value + "]");
*/
function BuyPacks(school, person, name, items, info)
{
	this.school = school;
	this.person = person;
	this.name = name;
	this.items = items;
	this.info = info;
} 

BuyPacks.prototype.showPacks = function()
{
	for(var i  = 0; i < this.person.length; i++)
	{
		var groupType = this.person[i].GroupType,
			template = $('#wrapper' + i),
			portraitPath = 'https://advancedimage.com.au/lifebuyimages//' + this.person[i].DstImage;
		
		if(groupType == 'NoGroup') return;
		
		template.find('.package_icon').attr('src','assets/img/icons/' + groupType + '.png');
		
		switch(groupType)
		{
			case 'Photo':
				groupType = 'Traditional Group';
				break;
			case 'Book':
				groupType = 'Photobook';
				break;
			case 'Folder':
				groupType = 'Custom Folder';
				break;
		}
		
		var packInfo = '<b>CONTAINS: </b>' + groupType + ', ' + this.items[2].Description,
			cartDesc = groupType + ', ' + this.items[2].Description;
		
		this.listItem(template, i, groupType, packInfo, portraitPath);
		this.cart(template,i, cartDesc, portraitPath);

		$('#products').append(template);
		
	}
	
	$('select').val('2');
	
	this.changePack();
	this.helpMenu();
	this.watermark();	
};

BuyPacks.prototype.changePack = function()
{
	var school = this.school,
		items = this.items,
		person = this.person;
	
	$('.change_pack_type').on('change',function()
	{
		var wrapper = $(this).parents().eq(3).find('.package_info_wrapper'),
			description_update,
			packages_data_Id = $(this).val(),
			height = wrapper.height(),
			title = wrapper.find('h3'),
			h4 = wrapper.find('h4'),
			description = wrapper.find('p'),
			loader = wrapper.find('.load_item'),
			pack_type = wrapper.find('.pack_type').html(),
			template = wrapper.parents().eq(1),
			img_path = template.find('.subject_portrait img').attr('src'),
			lookUp = wrapper.parents().eq(1).attr('data-lookUp'),
			group_type;							
		
		loader.removeClass('hidden');	
		wrapper.css('height',height + 'px');
		title.fadeOut(800);
		h4.fadeOut(800);
	
		switch(pack_type)
		{
			case 'Traditional Group':
				group_type = 'PHOTO';
				break;
			case 'Photobook':
				group_type = 'BOOK';
				break;
			case 'Custom Folder':
				group_type = 'FOLDER';
				break;
		}
		
		description.fadeOut(800, function()
		{
			wrapper.find('.pack_title').html(items[packages_data_Id].Title);
			wrapper.find('.price').html('$ ' + items[packages_data_Id].Price + '.00');
	
			var product_text = items[packages_data_Id].Description;
			
			(packages_data_Id != 5) ? description_update = pack_type + ', ' + product_text : description_update = product_text  ;  
			
			wrapper.find('.package_info').html('<b>CONTAINS: </b> ' + description_update);
			
			wrapper.css('height','auto');
			title.fadeIn(800);
			h4.fadeIn(800);
			description.fadeIn(800);
			loader.addClass('hidden');
		
		});

		setTimeout(function()
		{
			console.log(description_update);
			
			$(template).find('input[type=hidden]').val(
				'WebClient:' + school[0].ClientID + 
				'; SubjectID:' + person[lookUp].Id + 
				'; PrimarySubjectID:' + person[lookUp].PrimarySubjectID + 
				'; URL:' + img_path + 
				'; GroupType:' + person[lookUp].GroupType + 
				'; PackRef: ' + items[packages_data_Id].PackRef + 
				'; Title: ' + items[packages_data_Id].Title + 
				'; Description: ' + description_update + 
				'; PhotoYear: ' + person[lookUp].YearPhoto + 
				'; Price: ' +  items[packages_data_Id].Price + 
				'; Quantity: ' + 1);
		},1000);
	});
};

BuyPacks.prototype.watermark = function()
{
	var overlay = document.createElement('img');
	
	function setAttributes(el, attrs)
	{
		for(var key in attrs){
			el.setAttribute(key, attrs[key]);
		}
	}
	
	setAttributes(overlay, {'src':'assets/img/overlay.png','alt':'','class':'overlay'});
	$(overlay).css({'top':'45%','left': '25%', 'margin-left': '1.2em', 'width':'40%'});
	
	$('.subject_portrait').append(overlay);
};

BuyPacks.prototype.helpMenu = function()
{	
	$('main .additional_link').attr('data-link',this.info);
};

BuyPacks.prototype.listItem = function(template, ref, groupType, packInfo, portraitPath)
{
	template.removeClass('hidden').attr('data-lookUp',ref);
	template.find('.pack_year').html(this.person[ref].YearPhoto);
	template.find('.more_options').attr({'data-year':this.person[ref].YearPhoto, 'data-str-id': ref});
	template.find('.add_to_cart').attr('id','AddToCart' + ref);
	template.find('.pack_type').html(groupType);														// Variable
	template.find('.price').html('$ ' + this.items[2].Price + '.00');
	template.find('.additional_link').attr('data-link',this.info);
	template.find('.package_info').html(packInfo);
	template.find('.subject_portrait img').attr('src', portraitPath);
};

BuyPacks.prototype.cart = function(template,ref,packInfo,portraitPath)
{
	template.find('input[type=hidden]').attr('id','CartInfo' + ref).val(
		'WebClient:' + this.school[0].ClientID + 
		'; SubjectID:' + this.person[ref].Id + 
		'; PrimarySubjectID:' + this.person[ref].PrimarySubjectID + 
		'; URL:' + portraitPath + 
		'; GroupType:' + this.person[ref].GroupType + 
		'; PackRef: ' + this.items[2].PackRef + 
		'; Title: ' + this.items[2].Title + 
		'; Description: ' + packInfo + 
		'; PhotoYear: ' + this.person[ref].YearPhoto + 
		'; Price: ' + this.items[2].Price + 
		'; Quantity: ' + 1);              
};
/*	
var schoolPacks = new BuyPacks(school, person, 'school', [
			{ PackRef:'A', Title:'Deluxe Package', Price: '60', Description: '10x8 Inch Print,  10x8 Inch B&W Print,  5x7 Inch B&W Print, 2x (5x7) Prints, 4x Wallet Size Prints (53x74mm), 4x Keyring Prints (29x41mm),  3x NOVELTY Prints,  3x BOOKMARKS,  3x ID Tags,  3x Magnets.'},
			{ PackRef:'B', Title:'Value Package', Price: '56', Description: '10x8 Inch Print,  5x7 Print,  5x7 Inch B&W Print,  2x (5x7) Prints, 4x Wallet Size Prints (53x74mm), 4x Keyring Prints (29x41mm)., 3x NOVELTY Prints,  3x BOOKMARKS,  3x ID Tags.'}, // make zero
			{ PackRef:'C', Title:'Regular Package', Price: '55', Description: '2x (5x7) Print, 5x7 Inch B&W Print, 4x Wallet Size Prints (53x74mm), 4x Keyring Prints (29x41mm).'}, // make zero	
			{ PackRef:'D', Title:'Basic Package', Price: '50', Description: '5x7 Print, 4x Wallet Size Prints (53x74mm), 4x Keyring Prints (29x41mm).'}, // 
			{ PackRef:'F', Title:'Group Only', Price: '45', Description: ''}, // make zero	
			{ PackRef:'G', Title:'Portrait Only', Price: '40', Description: '5x7 PRINT, WALLET SIZE PRINTS, 4x KEYRING PRINTS.'}
		], 'packages');	
		
	
		
var siblingPacks = new BuyPacks(school, person, 'sibling', [
			{ PackRef:'A', Title:'Deluxe Package', Price: '40', Description: '10x8 Inch Print, 10x8 Inch B&W Print, 2x (5x7) Prints, 3x Wallet Size Prints (53x74mm).'},
			{ PackRef:'B', Title:'Regular Package', Price: '35', Description: '10x8 Inch Print, 2x (5x7) Print, 3x Wallet Size Prints (53x74mm).'}, // make zero
			{ PackRef:'C', Title:'Basic Package', Price: '33', Description: '2x (5x7) Print, 3x Wallet Size Prints (53x74mm).'}, // make zero	
		], 'packages');

siblingPacks.showPacks = function()
{
	for(var i  = 0; i < this.person.length; i++)
	{
		var groupType = 'FamilySiblings',
			template = $('#wrapper' + i),
			portraitPath = 'https://advancedimage.com.au/lifebuyimages//' + this.person[i].DstImage;
		
		if(groupType == 'NoGroup') return;
		
		template.find('.package_icon').attr('src','img/icons/' + groupType + '.png');
		
		var packInfo = '<b>CONTAINS: </b>' + this.items[2].Description;	
		
		this.listItem(template, i, 'Sibling', packInfo, portraitPath);
		this.cart(template, i, this.items[2].Description, portraitPath);
		
		$('.package_icon').remove();
		$('option:nth-child(5)').addClass('hidden');
		$('option:nth-child(6)').addClass('hidden');
		$('option:nth-child(7)').addClass('hidden');
		
		var orientation = Boolean(this.person[0].ImageIsPortrait);
		orientation === true ? $('.subject_portrait').addClass('_90_s p_m_top') : '';
		
		$('#products').append(template);
		
	}
	
	$('select').val('2');
	
	this.changePack();
	this.helpMenu();
	this.watermark();
};
		
siblingPacks.changePack = function()
{
	var school = this.school,
		items = this.items,
		person = this.person;
	
	$('.change_pack_type').on('change',function()
	{
		var wrapper = $(this).parents().eq(3).find('.package_info_wrapper'),
			description_update,
			packages_data_Id = $(this).val(),
			height = wrapper.height(),
			title = wrapper.find('h3'),
			h4 = wrapper.find('h4'),
			description = wrapper.find('p'),
			loader = wrapper.find('.load_item'),
			// pack_type = wrapper.find('.pack_type').html(),
			template = wrapper.parents().eq(1),
			img_path = template.find('.subject_portrait img').attr('src'),
			lookUp = wrapper.parents().eq(1).attr('data-lookUp');
			// group_type;							
		
		loader.removeClass('hidden');	
		wrapper.css('height',height + 'px');
		title.fadeOut(800);
		h4.fadeOut(800);

		description.fadeOut(800, function()
		{
			wrapper.find('.pack_title').html(items[packages_data_Id].Title);
			wrapper.find('.price').html('$ ' + items[packages_data_Id].Price + '.00');
			
			wrapper.find('.package_info').html('<b>CONTAINS: </b> ' + items[packages_data_Id].Description);
			
			wrapper.css('height','auto');
			title.fadeIn(800);
			h4.fadeIn(800);
			description.fadeIn(800);
			loader.addClass('hidden');
		
		});

		setTimeout(function()
		{
			
			$(template).find('input[type=hidden]').val(
				'WebClient:' + school[0].ClientID + 
				'; SubjectID:' + person[lookUp].Id + 
				'; PrimarySubjectID:' + person[lookUp].PrimarySubjectID + 
				'; URL:' + img_path + 
				'; GroupType:' + person[lookUp].GroupType + 
				'; PackRef: ' + items[packages_data_Id].PackRef + 
				'; Title: ' + items[packages_data_Id].Title + 
				'; Description: ' + items[packages_data_Id].Description + 
				'; PhotoYear: ' + person[lookUp].YearPhoto + 
				'; Price: ' +  items[packages_data_Id].Price + 
				'; Quantity: ' + 1);
		},1000);
	});
};		
*/		
//*****************************************//		
/*	
var sportsPacks = new BuyPacks(school, person, 'sports', [
			{ PackRef:'A', Title:'Deluxe Package', Price: '50', Description: 'Team Group, Memory Mate, Magazine Cover, Calendar, 10x8 Inch Portrait, 5x7 Inch Print, 2 x (3.5x5) Inch Prints, 2 x Novelty Prints, 2 x Wallet Size Prints, 8 x Keyring Prints, 1 x Novelty Game Day Ticket.'},
			{ PackRef:'B', Title:'Value Package', Price: '45', Description: 'Team Group, Memory Mate, Magazine Cover, Calendar, 5x7 Inch Print, 2 x (3.5x5) Inch Prints.'}, // make zero
			{ PackRef:'C', Title:'Regular Package', Price: '41', Description: 'Team Group, Magazine Cover, 5x7 Inch Print, 2 x (3.5x5) Inch Prints.'}, // make zero	
			{ PackRef:'D', Title:'Team Group', Price: '30', Description: 'Team Group.'}, // 
			{ PackRef:'F', Title:'Memory Mate', Price: '33', Description: 'Memory Mate.'},
			{ PackRef:'G', Title:'Portrait Only', Price: '31', Description: 'Portrait Only.'}
		], 'packages_sports');

sportsPacks.showPacks = function()
{
	for(var i  = 0; i < this.person.length; i++)
	{
		var groupType = this.person[i].GroupType,														// Variable
			template = $('#wrapper' + i),
			portraitPath = 'https://advancedimage.com.au/lifebuyimages//' + this.person[i].DstImage;
		
		if(groupType == 'NoGroup') return;
		
		template.find('.package_icon').attr('src','img/icons/sports.png');
		var packInfo = '<b>CONTAINS: </b>' + this.items[2].Description;									// Variable
		
		this.listItem(template, i, 'Sports', packInfo, portraitPath);
		this.cart(template, i, this.items[2].Description, portraitPath);

		$('option:nth-child(5)').html('Team Group');													// Variable
		$('option:nth-child(6)').html('Memory Mate');

		$('#products').append(template);
		
	}
	
	$('main h2').html('My Sports Days');
	$('select').val('2');
	
	this.changePack();
	this.helpMenu();
	this.watermark();
};
		
sportsPacks.changePack = function()
{
	var school = this.school,
		items = this.items,
		person = this.person;
	
	$('.change_pack_type').on('change',function()
	{
		var wrapper = $(this).parents().eq(3).find('.package_info_wrapper'),
			description_update,
			packages_data_Id = $(this).val(),
			height = wrapper.height(),
			title = wrapper.find('h3'),
			h4 = wrapper.find('h4'),
			description = wrapper.find('p'),
			loader = wrapper.find('.load_item'),
			template = wrapper.parents().eq(1),
			img_path = template.find('.subject_portrait img').attr('src'),
			lookUp = wrapper.parents().eq(1).attr('data-lookUp');
		
		loader.removeClass('hidden');	
		wrapper.css('height',height + 'px');
		title.fadeOut(800);
		h4.fadeOut(800);

		description.fadeOut(800, function()
		{
			wrapper.find('.pack_title').html(items[packages_data_Id].Title);
			wrapper.find('.price').html('$ ' + items[packages_data_Id].Price + '.00');
	
			//var product_text = items[packages_data_Id].Description;
			//product_text : description_update = product_text; 
			
			wrapper.find('.package_info').html('<b>CONTAINS: </b> ' + items[packages_data_Id].Description);
			
			wrapper.css('height','auto');
			title.fadeIn(800);
			h4.fadeIn(800);
			description.fadeIn(800);
			loader.addClass('hidden');
		
		});
		
		setTimeout(function()
		{
			
			$(template).find('input[type=hidden]').val(
				'WebClient:' + school[0].ClientID + 
				'; SubjectID:' + person[lookUp].Id + 
				'; PrimarySubjectID:' + person[lookUp].PrimarySubjectID + 
				'; URL:' + img_path + 
				'; GroupType:' + person[lookUp].GroupType + 
				'; PackRef: ' + items[packages_data_Id].PackRef + 
				'; Title: ' + items[packages_data_Id].Title + 
				'; Description: ' + items[packages_data_Id].Description + 
				'; PhotoYear: ' + person[lookUp].YearPhoto + 
				'; Price: ' +  items[packages_data_Id].Price + 
				'; Quantity: ' + 1);
		},1000);
		
	});
};		

var type = person[0].SchYr;			// initialise

if(type == 44)
{
	sportsPacks.showPacks();
	return;
}
else if(type == 22) 
{
	siblingPacks.showPacks();
	return;
}
else 
{
	schoolPacks.showPacks();
	return;
}

*/