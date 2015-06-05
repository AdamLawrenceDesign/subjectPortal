/***********************************************
	Function:	Build List
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function BuildList(defaults, webpage, userInfo, type, data)
{
	this.defaults = defaults;
	this.webpage = webpage;
	this.userInfo = userInfo;
	this.userId = this.userInfo.userId;
	this.id1 = this.userInfo.id1;
	this.id2 = this.userInfo.id2;
	this.id3 = this.userInfo.id3;
	this.firstName = this.userInfo.firstName;
	this.lastName = this.userInfo.lastName;
	this.type = 'cartItem';		// HACK FOR NOW COULDN'T GET TO WORK OTHERWISE
	this.data = data;
	this.jsonId = null;
	this.defaultsInit();
};

BuildList.prototype.scroll = function()
{
	$('html, body').animate(
	{ 
		scrollTop : $('main').offset().top
	}, 1200 );
};

BuildList.prototype.nav = function()
{
	var node = this.defaults;

	// RETURN TO CATERGORIES VIEW
	node.navCatergories.on('click', function(event)
	{
		node.loading.css('opacity', '1');

		if(node.wrapProducts.attr('data-active') == 'true')
		{
			node.wrapProducts.fadeOut(800, function()
			{
				node.wrapProducts.empty();
				node.wrapCatergory.fadeIn(800);
				node.navProducts.html('');
				node.loading.css('opacity','0');
			});				
		}

		if(node.wrapLayouts.attr('data-active') == 'true')
		{
			node.wrapLayouts.fadeOut(800, function()
			{
				node.wrapLayouts.empty();
				node.navLayouts.addClass('hidden');
				node.navProducts.html('');
				node.wrapCatergory.fadeIn(800);
				node.loading.css('opacity','0');
			});

		};

		$.each([node.wrapProducts, node.wrapCatergory, node.wrapLayouts], function()
		{
			this.attr('data-active','false')
		});

		node.wrapCatergory.attr('data-active','true');

		event.preventDefault();	
	});

	// RETURN TO CATERGORIES VIEW
	node.navProducts.on('click', function(event)
	{
		node.loading.css('opacity','1');
		node.wrapLayouts.fadeOut(800, function()
		{
			node.wrapProducts.fadeIn(800);
			node.wrapLayouts.empty();
			node.navLayouts.addClass('hidden');
			node.loading.css('opacity','0');
		});	
		event.preventDefault();		
	});
};

BuildList.prototype.redirectPage = function()
{
	var _this = this;

	function loadCanvas (jsonId)
	{
		var url = '?webpage=' + _this.webpage + 
					'&userId=' + _this.userId + 
					'&userName=' + _this.firstName + 
					'&id1=' + _this.id1 + 
					'&id2=' + _this.id2 + 
					'&id3=' + _this.id3 +
					'&firstName=' + _this.firstName + 
					'&lastName=' + _this.lastName + 
					'&type=' + _this.type + 
					'&productId=' + _this.productId + 
					'&layoutId=' + _this.layoutId + 
					'&jsonId=' + jsonId +
					'&end' + '&webLink=' + 'SIC=' + _this.id1 + '?close';	

		location = 'http://192.168.0.216/canvas/index.html' + url;	
	};

	var jsonId = new ServerRequest('http://192.168.0.216/AdvAPI/api/WJValues/WL/' + this.layoutId, 'GET', null, function(data)
		{
			var jsonId;

			$.each(data, function(index)
			{
				if(typeof jsonId === 'undefined')
				{
					jsonId = this.jsonID;
				} else {
					jsonId = jsonId + '_' + this.jsonID;
				}
			});

			//console.log('this layout id: ', _this.layoutId, 'This page: ', this.jsonID, ' concat: ', jsonId, ' and data: ', data)

			loadCanvas(jsonId);

		});

};

BuildList.prototype.layoutEvent = function()
{
	var _this, node;
	_this = this;
	node = this.defaults;

	node.wrapLayouts.on('click', 'a', function()
	{
		_this.productId = $(this).attr('data-productid');
		_this.layoutId = $(this).attr('data-layoutid');
		_this.redirectPage();
	});
};

BuildList.prototype.buildLayouts = function()
{
	var _this, node;
	_this = this;
	node = this.defaults;

	node.wrapProducts.on('click', 'a', function(event)
	{
		$.each([node.wrapProducts, node.wrapCatergory, node.wrapLayouts], function()
		{
			this.attr('data-active','false')
		});

		node.wrapLayouts.attr('data-active','true').empty();

		var productId = $(this).attr('id');
		var getLayouts = new ServerRequest('http://192.168.0.216/AdvAPI/api/WLValues/' + productId + '/All/Last Edited/false/', 'GET', null, function(data)
		{
			// IF DATA ONLY HAS ONE ENTRY ITS TIME TO REDIRECT THEM TO A BLANK CANVAS

			if (data.length == 1)
			{
				_this.layoutId = data[0].layoutID;
				_this.productId = data[0].productID;
				_this.redirectPage();
			};

			$.each(data, function(index, value)
			{
				var template;

				template = node.templateLayouts.clone();
                template.attr({'id':'layoutLink' + index, 'data-layoutId' : this.layoutID });
                template.find('img').attr('src', 'https://www.advancedimage.com.au/CreateJS/Layouts/' + this.layoutID + '.jpg')
                                        .error(function()
                                        { 
                                            $(this).attr('src', 'https://www.advancedimage.com.au/CreateJS/Layouts/placeholder.jpg')
                                        });
                template.find('a').attr({'data-productId': this.productID, 'data-layoutId': this.layoutID })
                template.find('.lastEdited').html(this.lastEditedBy)
                node.wrapLayouts.append(template);   
			});

			node.navLayouts.removeClass('hidden');
			node.loading.css('opacity', '1');
			node.wrapProducts.fadeOut(800, function()
			{
				node.wrapLayouts.fadeIn(800);
				node.loading.css('opacity', '0');
			});
		});	

		_this.scroll();

		event.preventDefault();
	});

	_this.layoutEvent();
};

BuildList.prototype.buildProducts = function()
{
	var _this, node;

	_this = this;
	node = this.defaults;
	
	node.wrapCatergory.on('click', 'a', function(event)
	{
		$.each([node.wrapProducts, node.wrapCatergory, node.wrapLayouts], function()
		{
			this.attr('data-active','false')
		});

		node.wrapProducts.attr('data-active','true').empty();
		node.loading.css('opacity', '1');

		_this.groupName = $(this).parent().attr('id');
		
		node.wrapCatergory.fadeOut(800);
		
		var getProductsByGroupName = new ServerRequest('http://192.168.0.216/AdvAPI/api/WCAPValues/Photocreate/' + _this.groupName, 'GET', null, function(data)
		{
			$.each(data, function(index, value)
			{
				var template;

				template = node.templateProducts.clone();
				template.attr('id', 'item-' + value.id)
				template.find('a').attr('id', value.id);
				template.find('.description').html(value.description);
				template.find('.groupName').html(value.groupName);
				template.find('.price').html('$ ' + value.unitPrice);
				template.find('img').attr('src','https://www.advancedimage.com.au/CreateJs/Products/Description/' + value.id + '.jpg');
				node.wrapProducts.append(template);
			});
			node.navProducts.html(data[0].itemName);
			node.wrapProducts.fadeIn(800);
			node.loading.css('opacity', '0');
		});
		
		_this.scroll();
		event.preventDefault();	
	});

	_this.buildLayouts();
};

BuildList.prototype.buildCatergories = function()
{
	var node = this.defaults;

	node.navProducts.html('');

	$.each(this.data, function(index, value)
	{
		var template, imgName;

		template = node.templateCatergory.clone();
		imgName = value.itemName.replace(/ /g,'-');
		template.attr('id', value.itemName);
		template.find(node.classSelectorName).html(value.itemName);
		template.find('img').attr('src','https://www.advancedimage.com.au/CreateJs/Products/Types/' + imgName + '.jpg');	
		node.wrapCatergory.append(template);
	});

	setTimeout(function()
	{
		node.main.css('min-height', node.main.outerHeight() + 'px');
		console.log('set height')
	}, 300);

	this.buildProducts();
	this.nav();
};

BuildList.prototype.defaultsInit = function()
{
	if(!this.defaults)
	{
		// NOT SURE IF THIS IS A GOOD IDEA
		this.defaults = {
							'main': $('main'),
							'wrapCatergory': $('#resultsItemName'),
							'templateCatergory': $('#templateItemName'),
							'labelName': $('.itemName'),
							'classSelectorName': '.itemName',
							'wrapProducts': $('#resultsGroupName'),
							'templateProducts': $('#templateGroupName'),
							'wrapLayouts': $('#resultsLayouts'),
							'templateLayouts': $('#templateLayoutName'),
							'navCatergories': $('.productsLink'),
							'navProducts': $('.productLabel'),
							'navLayouts': $('.layoutLabel'),
							'loading': $('#loading-main')
		}
	};

	this.buildCatergories();
};
