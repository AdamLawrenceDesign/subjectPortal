/***********************************************
	Function:	Build List
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function BuildLinks(urlInfo)
{
	this.urlInfo = urlInfo;
	this.links = [
					{ el: $('.index'), href:  'index.aspx' },
				    { el: $('.downloads'), href: 'downloads.aspx' },
				    { el: $('.group_img'), href: 'group_img.aspx' }, 
				    { el: $('.packages'), href: 'packages.aspx' },
				    { el: $('.gift_items'), href: 'gift_items.aspx' },
				    { el: $('.payment'), href: 'payment.aspx' },
				    { el: $('.thank_you'), href: 'thank_you.aspx' },
				    { el: $('.cart'), href: 'cart.aspx' },
				    { el: $('.contact_us'), href: 'contact_us.aspx'}
				];
	this.applyLinks();
};

BuildLinks.prototype.applyLinks = function()
{
	var _this = this;

	$.each(this.links, function()
	{
		this.el.attr('href', this.href + _this.urlInfo);
	});

	console.log('links are now added');

};
