/***********************************************
	Function:	Page Style 
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function PageStyle(style)
{
	this.style = style;
	this.colours = 	[
						{ name:'ubl', prm: '#00578a', sec : '#0099bc', lt : 'rgba(192, 222, 237, 0.6)', op : '#ffbb00' },
						{ name:'ubk', prm : '#292f33', sec : '#ffa800', lt : 'rgba(209, 214, 215, 0.6)', op : '#ffa800' }, 	
						{ name:'ucb', prm : '#4f2d82', sec : '#ffc425', lt : 'rgba(192, 222, 237, 0.6)', op : '#ffc425' }, 		
						{ name:'ubm', prm : '#006bb1', sec : '#0099bc', lt : 'rgba(192, 222, 237, 0.6)', op : '#f6b200' }, 		
						{ name:'udo', prm : '#017051', sec : '#017051', lt : 'rgba(161, 178, 187, 0.6)', op : '#9c1b3a' },		
						{ name:'ugr', prm : '#005c2f', sec : '#00894b', lt : 'rgba(192, 222, 237, 0.6)', op : '#00894b' },	
						{ name:'ugo', prm : '#fcb600', sec : '#ffa800', lt : 'rgba(209, 214, 215, 0.6)', op : '#ffa800' },	
						{ name:'uma', prm : '#711a3f', sec : '#6caddf', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' },	
						{ name:'umn', prm : '#6f2f40', sec : '#ffa800', lt : 'rgba(192, 222, 237, 0.6)', op : '#d59693' },					
						{ name:'una', prm : '#002b5c', sec : '#6caddf', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' },	
						{ name:'une', prm : '#292f33', sec : '#ffa800', lt : 'rgba(192, 222, 237, 0.6)', op : '#ffa800' },		
						{ name:'upl', prm : '#b62e2e', sec : '#ffa800', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' },			
						{ name:'upu', prm : '#753b92', sec : '#6caddf', lt : 'rgba(193, 223, 237, 0.6)', op : '#6caddf' },	
						{ name:'ute', prm : '#3ca3ac', sec : '#6caddf', lt : 'rgba(193, 223, 237, 0.6)', op : '#6caddf' },	
						{ name:'ure', prm : '#c41425', sec : '#07778b', lt : 'rgba(192, 222, 237, 0.6)', op : '#6caddf' }, 
						{ name:'sports', prm : '#292f33', sec : '#ffa800', lt : 'rgba(0, 0, 0, 0.1)', op : '#ffa800' }
					];
	this.init();
}

PageStyle.prototype.colourSetUp = function(colour)
{
	$('.prm').css('background-color', colour.prm);							
	$('.sec').css('background-color',  colour.sec);   		
	$('.prm_lt').css('background-color', colour.lt);			
	$('.button_dk').css('background-color',  colour.op);		
	$('.links_line_left li a').css('border-left-color', colour.op);		
	$('.links_line_right li a').css('border-right-color',  colour.op);		
	$('blockquote p').css('border-color', colour.sec)
	$('a:hover').css('color', colour.op);	
};

PageStyle.prototype.setUpSports = function()
{
	$('header').removeClass('pattern').addClass('pattern_sports');
	$('.title_nav').removeClass('pattern').addClass('pattern_sports');
	$('.img_banner').empty().append("<img class=\"full\" src=\"img/sports/sports_hands.jpg\" alt=\"\" />");
	$('body').css('background-image','url(img/sports/bg_crowd.jpg)');
	$('.sports_fff').addClass('txt_fff').css('text-shadow','0 1px 1px rgba(0,0,0,.8)');
	$('.sports_fff h2').css('color','#f9f9f9');	
};

PageStyle.prototype.setUpFamilies = function()
{
	// FAMILIES STYLE TO BE ADDED 
};

PageStyle.prototype.init = function()
{
	var _this = this;

	// GET MATCH FOR COLOUR
	$.each(this.colours, function()
	{
		if(this.name == _this.style)
		{
			_this.colourSetUp(this);

			if(this.name == 'sports')
			{
				_this.setUpSports();
			}
		}
	});
};
