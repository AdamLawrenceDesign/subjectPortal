// Downloads

var DownloadData, items;

$(window).load(function() {

    DownloadData  =  { 
						ServerData : eval("[" + document.getElementById('hPortraitData').value + "]"),
						
						CreateList : function(){
							for(var i  = 0; i < this.ServerData.length; i++){
								
								var PortraitLink = 'https://advancedimage.com.au/lifebuyimages//' + this.ServerData[i].DstImage;
								var template = $('#wrapper' + i);
								
								template.removeClass('hidden');
								template.find('.ProductThumb').attr('src',PortraitLink);
								template.find('.ProductTitle').html(this.ServerData[i].YearPhoto + ' Portrait');
								
								if(i==0){
									
									var price = Number(this.ServerData[i].Cost);
									(price > 0) ? price = 20 : price = 0;
									
									template.find('.DownloadPrice').html('$ ' + price + '.00');
									
									//=============================================== // 							Update Cart
									
									var CartValue = 'ID: ' + DownloadData.ServerData[i].ID + 
													'; PrimarySubjectID: ' + DownloadData.ServerData[i].PrimarySubjectID + 
													'; LastName: ' + DownloadData.ServerData[i].LastName + 
													'; FirstName: ' + DownloadData.ServerData[i].FirstName +
													'; DstImage: https://advancedimage.com.au/lifebuyimages//' + DownloadData.ServerData[i].DstImage + 
													'; YearPhoto: ' + DownloadData.ServerData[i].YearPhoto +
													'; Cost: ' + price + '.00' +
													'; SIC: ' + DownloadData.ServerData[i].SIC;


									template.find('input[type=hidden]').val(CartValue);
									
								} else {
									template.find('.DownloadPrice').html('$ 8.00');
									
									//=============================================== // 							Update Cart
									
									var CartValue = 'ID: ' + DownloadData.ServerData[i].ID + 
													'; PrimarySubjectID: ' + DownloadData.ServerData[i].PrimarySubjectID + 
													'; LastName: ' + DownloadData.ServerData[i].LastName + 
													'; FirstName: ' + DownloadData.ServerData[i].FirstName +
													'; DstImage: https://advancedimage.com.au/lifebuyimages//' + DownloadData.ServerData[i].DstImage + 
													'; YearPhoto: ' + DownloadData.ServerData[i].YearPhoto +
													'; Cost: 8.00' +
													'; SIC: ' + DownloadData.ServerData[i].SIC;
													
									template.find('input[type=hidden]').val(CartValue);
									
								}
								
								
							}
							
							for(var i = 0; i < 3; i++){ 
								var spacer = $('#spacer').clone();
								spacer.removeClass('hidden');
								spacer.attr('id','spacer'+0);
								spacer.css('visibility','hidden');
								$('#image_list').append(spacer);
								
							}
							
						},
						
						//=================================================// 									 Watermarking Images 
												
						Watermark : function(){
								var overlay = document.createElement('img');
								
								function setAttributes(el, attrs){
									for(var key in attrs){
										el.setAttribute(key, attrs[key]);
									}
								}
								
								setAttributes(overlay, {'src':'img/overlay.png','alt':'','class':'overlay'});
								$(overlay).css({'top': '35%','left': '25%', 'margin': '0','width':'50%'});
								
								$('.ProductThumb').parent().append(overlay);
	
						},
						
						//=================================================// 									 Buy All  
						
						BuyAll : function(){
							
								var FindLast = this.ServerData.length - 1,											// Correct to find the last entry
									PriceTotal = 0,
									UnitPrice = 8;						
								
								if(this.ServerData.length > 2 ){
									var PortraitLink = 'img/icons/download_all.jpg';
									var template = $('#wrapperAll');
									
									template.removeClass('hidden');
									template.find('.overlay').css('display','none');
									template.find('.ProductThumb').attr('src',PortraitLink);
									template.find('.ProductTitle').html('All Portraits');
									template.find('.pack_year').html( this.ServerData[0].YearPhoto);
									
									// ======================================= // 									// Add Price 
									
									function PriceScale(discount){
										var StrikeTotal = (FindLast * UnitPrice) + parseInt(DownloadData.ServerData[0].Cost);
										var total = (( FindLast * UnitPrice) + parseInt(DownloadData.ServerData[0].Cost)) -  ( UnitPrice * discount );

										template.find('strike').html('$ ' + StrikeTotal + '.00').removeClass('hidden').addClass('txt_red');
										template.find('.DownloadPrice').html('&nbsp;&nbsp;' + '$ ' + total + '.00');
										
										// ======================================== //									// Cart Items
										
										var CartValue = 'ID: ' + DownloadData.ServerData[0].ID + 
														'; PrimarySubjectID: ' + DownloadData.ServerData[0].PrimarySubjectID + 
														'; LastName: ' + DownloadData.ServerData[0].LastName + 
														'; FirstName: ' + DownloadData.ServerData[0].FirstName +
														'; DstImage: https://advancedimage.com.au/subjectPortal/img/icons/download_all.jpg; YearPhoto: AllPhotos; Cost: ' + total + '.00' +
													    '; SIC: ' + DownloadData.ServerData[0].SIC;

														
										template.find('#CartInfoAll').val(CartValue);												// 
											
									}
									
									if(FindLast < 3){
										$('#wrapperAll').addClass('hidden');
									}
									 
									else if (FindLast >= 3 && FindLast < 5){
										PriceScale(1);																// Get 1 Free 
									}
									
									else if (FindLast >= 5 && FindLast < 9){
										PriceScale(2);																// Get 2 Free 
									}
									
									else if (FindLast >= 9){
										PriceScale(3);																// Get 3 Free 
									};
									
									// ======================================= // 									// Add Sticker
									/*
									var icon = document.createElement('img');
									$(icon).attr('src','img/icons/all_images.png');
									$(icon).css({'top': '0','left': '0', 'margin': '0','width':'60%','position':'absolute','z-index':'10'});
									var wrap = $('#iconAll').append(icon);
									*/
									
								};
						},
						
						//=================================================// 									 	Add Sticker
												
						Sticker : function(){
								var CurrentCost = parseInt(this.ServerData[0].Cost);
								var icon = document.createElement('img');
								$(icon).css({'top': '0','left': '0', 'margin': '0','width':'60%','position':'absolute','z-index':'10'});
								
								switch (CurrentCost){
									
									case 20 :
										$(icon).attr('src','img/icons/new_image.png');
									break;
										
									case 0 :
										$(icon).attr('src','img/icons/free_image.png');
										$('#wrapper0').find('strike').html('$ 8.00').removeClass('hidden').addClass('txt_red');
										$('#wrapper0').find('.DownloadPrice').html('&nbsp;&nbsp;'+'$ 0.00');
									break;
									
								};
								
								$('#wrapper0').find('.additional_link').append(icon);
						},
												
						// ==================================== // 									// 		First and Last
						
						FirstLast : function(){
							//var first_image = (this.ServerData.length)-1;
							var last_image = (this.ServerData.length)-1;
							$('.img_latest_year').html(DownloadData.ServerData[0].YearPhoto); //found bugs, need to swap index & change variable name - Arlen
							$('.img_oldest_year').html(DownloadData.ServerData[last_image].YearPhoto);							
						}
						
					};
	
	
	$('.load_item').css({'top':'20em','bottom':'auto'});

	DownloadData.CreateList();
	DownloadData.Watermark();
	DownloadData.BuyAll();
	DownloadData.Sticker();
	DownloadData.FirstLast();
	
	setTimeout(function(){
		var main = $('main'),
			placeHolderY = main.height();
		
		main.height(placeHolderY);
		$('#image_list').hide().removeClass('invisible');
		$('.load_item').addClass('opacity_0');
		$('#image_list').fadeIn(800);
			
	},1000);	
	
	
	
});
