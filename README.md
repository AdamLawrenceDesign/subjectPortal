##########################################
DOCUMENTATION 
##########################################

Website:	Subject Portal
Author: 	Adam Lawrence
Contact: 	me@adamlawrence.com.au

------------------------------------------
PAGES
------------------------------------------

- index.aspx
- downloads.aspx
- group_img.aspx
- packages.aspx
- gift_items.aspx
- cart.aspx
- contact_us.aspx
- Payment_nil.aspx
- Payment.aspx
- Message-sent.aspx
- Thank_you.aspx

------------------------------------------
DIRECTORY STRUCTURE 
------------------------------------------
- ROOT 	- All pages 

- assets - contains all generic assets for pages
		- fonts - contains icon fonts for graphics 
				- Other fonts on the page are supplied by google
		- img 	- Where all images can be found for the project
		- svg 	- contains advancedyou logos

- lib 	- Where all production and working javascript files can be found contains 
		- GRUNT - Gruntfile.js
				- package.json
		- SASS
		- prod - All production files for the project
				- project.js
				- project.min.js
				- popUp.css
				- screen.css
				- screen_ie.css
		- src 	- Contains all Javascript and sass 	
				- js
					- all working javascript
				- sass 
					- all working scss files

------------------------------------------
HOW THE SITE WORKS 
------------------------------------------

Developed using a combination of ASP, html and javascript.

To Push data into the page JSON is pushed into the below elements 

	<input id="hSchoolData" runat="server" type="hidden"/> 				  	
	<input id="hBannerImages" runat="server" type="hidden"/> 		
	<input id="hFirstImgPortrait" runat="server" type="hidden"/> 
	<input id="hFirstImgGroup" runat="server" type="hidden"/>    
	<input id="hPortraitData" runat="server" type="hidden" />
	<input id="hGroupData" runat="server" type="hidden" /> 
	<input id="hUserId" type="hidden" />

FROM HERE THE DATA IS PARSED INTO JAVASCRIPT OBJECTS TO BE USED TO BUILD THE CONTENT OF THE PAGE

    schoolData = eval("[" + document.getElementById('hSchoolData').value + "]"),
    bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]"),
    firstPortraitData = eval("[" + document.getElementById('hFirstImgPortrait').value + "]"), 
    firstGroupData = eval("[" + document.getElementById('hFirstImgGroup').value + "]"), 
    portraitData = eval("[" + document.getElementById('hPortraitData').value + "]"),
    groupData = eval("[" + document.getElementById('hGroupData').value + "]");

Methods of building content and styling the page.

-------------------------------------------------------------
JAVASCRIPT
-------------------------------------------------------------

ALL JAVASCRIPT PAGES USE A PSEUDO-CLASSICAL PATTERN WITH EACH PAGE CONSITING OF 
A CONTRUCTOR FUNCTION WITH ALL METHODS PROTOTYPED FROM THIS.

MORE INFO ON PSEUDO-CLASSICAL PATTERN
http://javascript.info/tutorial/pseudo-classical-pattern#pseudo-class-declaration

All javascript files can be found in 	ROOT\lib\src\js\
	
Then they are compiled using grunt and outputted to ROOT\lib\prod

Some pages contain functions that are mean't to be reused a number of times such as analytics, 
build-links and page-style while other pages are specific to certain pages eg groups_page.aspx | groups-page.js

-------------------------------------------------------------
CSS
-------------------------------------------------------------

ALL SASS FILES CAN BE FOUND IN THE WORKING SECTION OF THE DIR ROOT\lib\src\sass\
THESE FILES COMPILED USING GRUNT OR SASS AND MOVED TO THE PRODUCTION FOLDER 

