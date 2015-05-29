/***********************************************
	Function:	Menu Controllers
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function ToTop(el)
{
	this.el = el;
	this.init();
}

ToTop.prototype.init = function()
{
	var el = this.el;

	$(window).scroll(function()
	{
		var y_position = $('body').scrollTop();


		if(y_position == 0 )
		{
			$(el).addClass('hidden');
		} else {
			$(el).removeClass('hidden');
		}
	});

	$(el).click(function()
	{
		$('html, body').animate({scrollTop: 0},800);
		return false
	});
};
