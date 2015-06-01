/***********************************************
	Function:	Idex Page
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function IndexPage(portraitData, groupData)
{
	this.portraitData = portraitData;
	this.groupData = groupData;
	this.init();
}

IndexPage.prototype.init = function()
{
	var portraitData, groupData;

	portraitData = this.portraitData;
	groupData = this.groupData;

	// CONTROLS SPECIFIC FOR THIS PAGE
    // PORTRAITS                                   
    var portraits = {
                        list : function()
                        {
                            
                            for(var i  = 0; i < portraitData.length; i++){
                                
                                var PortraitLink = 'https://advancedimage.com.au/lifebuyimages//' + portraitData[i].DstImage;
                                var li = $('.template_portrait').clone();
                                
                                li.removeClass('template_portrait hidden').addClass('watermark');
                                li.find('img').attr('src',PortraitLink);
                                li.find('h4').html(portraitData[i].YearPhoto);
                                
                                $('#portrait_images').append('\n\r');
                                $('#portrait_images').append(li);
                                
                            }
                            
                            var spacer = document.createElement('div');
                            spacer.setAttribute('class','stretch');
                            $('#portrait_images').append(spacer);    
                        },
                                                
                        Label : function()
                        {
                                var CurrentCost = parseInt(portraitData[0].Cost);
                                var icon = document.createElement('img');
                                $(icon).css({'top': '0','left': '0', 'margin': '0','width':'60%','position':'absolute','z-index':'10','pointer-events':'none'});
                                
                                switch (CurrentCost){
                                    
                                    case 20 :
                                        $(icon).attr('src','assets/img/icons/new_image.png');
                                    break;
                                        
                                    case 0 :
                                        $(icon).attr('src','assets/img/icons/free_image.png');
                                    break;
                                    
                                };
                                
                                $('#portrait_images li:first').append(icon);   
                        }                                                   
    };
    
    // GROUPS
    var groups = {
                    list : function()
                    {
                        var strLength = groupData.length;
                        var currentYear = new Date().getFullYear();
                        
                        for(var i  = 0; i < strLength; i++)
                        {      
                            if( i <= 5 )
                            {
                                var GroupLink = 'https://advancedimage.com.au/lifebuyimages//' + groupData[i].ClientID + '/' + groupData[i].SubFolder + '/' + groupData[i].fileName ;
                                var li = $('.template_group').clone();
                                
                                li.removeClass('template_group hidden');
                                li.find('img').attr('src', GroupLink);
                                
                                var list_date = groupData[i].dateOfPhotography,
                                    date = list_date.substr(list_date.length - 4);
                                                
                                li.find('span').html(date);
                                
                                $('#group_images').append('\n\r');
                                $('#group_images').append(li);
                                
                                if(date == currentYear)
                                {
                                    var icon = document.createElement('img');
                                    $(icon).css({'top': '0','left': '0', 'margin': '0','width':'40%','position':'absolute','z-index':'10','pointer-events':'none'});
                                    $(icon).attr('src','img/icons/new_image.png');
                                    $(li).append(icon);
                                };
                                
                            };
                            
                        }
                        
                        var spacer = document.createElement('div');
                        spacer.setAttribute('class','stretch');
                        $('#portrait_images').append(spacer);                      
                    }
    };
    
    portraits.list();
    portraits.Label();

    var watermarkPortraits = new Watermark('.watermark');

    groups.list();
};
