/***********************************************
	Function:	Watermark
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function Watermark(target)
{
	this.target = target;
	this.init();
}

Watermark.prototype.init = function()
{
	var el = this.target;

    var overlay = document.createElement('img');
    
    function setAttributes(el, attrs)
    {
        for(var key in attrs)
        {
            el.setAttribute(key, attrs[key]);
        }
    }
    
    setAttributes(overlay, {'src':'img/overlay.png','alt':'','class':'overlay'});
    $(overlay).css({'top': '35%','left': '25%', 'margin': '0','width':'50%','pointer-events':'none'});
    $(el).append(overlay);
};
