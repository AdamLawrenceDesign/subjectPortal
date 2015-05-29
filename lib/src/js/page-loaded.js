/***********************************************
    Function:   Page is Loaded
    Author:     Adam Lawrence
    Contact:    me@adamlawrence.com.au
*************************************************/

function PageIsLoaded()
{
    this.init();
}

PageIsLoaded.prototype.init = function()
{
    setTimeout(function()
    {
        $('header').css('margin-top','0px')

        setTimeout(function()
        {
            $('#opening_load').addClass('scale_hide');  
        }, 1000);
        
        setTimeout(function()
        {
            $('.img_banner').cycle(
            {                                                      
                fx:'fade',         
                speed: 2000,
                timeout: 5000,      
            });
        }, 1000);
    }, 1600);
};
