/*!
 * jScrollPane - v2.0.19 - 2013-11-16
 * http://jscrollpane.kelvinluck.com/
 *
 * Copyright (c) 2013 Kelvin Luck
 * Dual licensed under the MIT or GPL licenses.
 */
!function(a,b){var c=function(c){return a(c,b)};"function"==typeof define&&define.amd?define(["jquery"],c):"object"==typeof exports?module.exports=c:c(jQuery)}(function(a,b,c){a.fn.jScrollPane=function(d){function e(d,e){function f(b){var e,h,j,l,m,n,q=!1,r=!1;if(P=b,Q===c)m=d.scrollTop(),n=d.scrollLeft(),d.css({overflow:"hidden",padding:0}),R=d.innerWidth()+tb,S=d.innerHeight(),d.width(R),Q=a('<div class="jspPane" />').css("padding",sb).append(d.children()),T=a('<div class="jspContainer" />').css({width:R+"px",height:S+"px"}).append(Q).appendTo(d);else{if(d.css("width",""),q=P.stickToBottom&&C(),r=P.stickToRight&&D(),l=d.innerWidth()+tb!=R||d.outerHeight()!=S,l&&(R=d.innerWidth()+tb,S=d.innerHeight(),T.css({width:R+"px",height:S+"px"})),!l&&ub==U&&Q.outerHeight()==V)return void d.width(R);ub=U,Q.css("width",""),d.width(R),T.find(">.jspVerticalBar,>.jspHorizontalBar").remove().end()}Q.css("overflow","auto"),U=b.contentWidth?b.contentWidth:Q[0].scrollWidth,V=Q[0].scrollHeight,Q.css("overflow",""),W=U/R,X=V/S,Y=X>1,Z=W>1,Z||Y?(d.addClass("jspScrollable"),e=P.maintainPosition&&(ab||db),e&&(h=A(),j=B()),g(),i(),k(),e&&(y(r?U-R:h,!1),x(q?V-S:j,!1)),H(),E(),N(),P.enableKeyboardNavigation&&J(),P.clickOnTrack&&o(),L(),P.hijackInternalLinks&&M()):(d.removeClass("jspScrollable"),Q.css({top:0,left:0,width:T.width()-tb}),F(),I(),K(),p()),P.autoReinitialise&&!rb?rb=setInterval(function(){f(P)},P.autoReinitialiseDelay):!P.autoReinitialise&&rb&&clearInterval(rb),m&&d.scrollTop(0)&&x(m,!1),n&&d.scrollLeft(0)&&y(n,!1),d.trigger("jsp-initialised",[Z||Y])}function g(){Y&&(T.append(a('<div class="jspVerticalBar" />').append(a('<div class="jspCap jspCapTop" />'),a('<div class="jspTrack" />').append(a('<div class="jspDrag" />').append(a('<div class="jspDragTop" />'),a('<div class="jspDragBottom" />'))),a('<div class="jspCap jspCapBottom" />'))),eb=T.find(">.jspVerticalBar"),fb=eb.find(">.jspTrack"),$=fb.find(">.jspDrag"),P.showArrows&&(jb=a('<a class="jspArrow jspArrowUp" />').bind("mousedown.jsp",m(0,-1)).bind("click.jsp",G),kb=a('<a class="jspArrow jspArrowDown" />').bind("mousedown.jsp",m(0,1)).bind("click.jsp",G),P.arrowScrollOnHover&&(jb.bind("mouseover.jsp",m(0,-1,jb)),kb.bind("mouseover.jsp",m(0,1,kb))),l(fb,P.verticalArrowPositions,jb,kb)),hb=S,T.find(">.jspVerticalBar>.jspCap:visible,>.jspVerticalBar>.jspArrow").each(function(){hb-=a(this).outerHeight()}),$.hover(function(){$.addClass("jspHover")},function(){$.removeClass("jspHover")}).bind("mousedown.jsp",function(b){a("html").bind("dragstart.jsp selectstart.jsp",G),$.addClass("jspActive");var c=b.pageY-$.position().top;return a("html").bind("mousemove.jsp",function(a){r(a.pageY-c,!1)}).bind("mouseup.jsp mouseleave.jsp",q),!1}),h())}function h(){fb.height(hb+"px"),ab=0,gb=P.verticalGutter+fb.outerWidth(),Q.width(R-gb-tb);try{0===eb.position().left&&Q.css("margin-left",gb+"px")}catch(a){}}function i(){Z&&(T.append(a('<div class="jspHorizontalBar" />').append(a('<div class="jspCap jspCapLeft" />'),a('<div class="jspTrack" />').append(a('<div class="jspDrag" />').append(a('<div class="jspDragLeft" />'),a('<div class="jspDragRight" />'))),a('<div class="jspCap jspCapRight" />'))),lb=T.find(">.jspHorizontalBar"),mb=lb.find(">.jspTrack"),bb=mb.find(">.jspDrag"),P.showArrows&&(pb=a('<a class="jspArrow jspArrowLeft" />').bind("mousedown.jsp",m(-1,0)).bind("click.jsp",G),qb=a('<a class="jspArrow jspArrowRight" />').bind("mousedown.jsp",m(1,0)).bind("click.jsp",G),P.arrowScrollOnHover&&(pb.bind("mouseover.jsp",m(-1,0,pb)),qb.bind("mouseover.jsp",m(1,0,qb))),l(mb,P.horizontalArrowPositions,pb,qb)),bb.hover(function(){bb.addClass("jspHover")},function(){bb.removeClass("jspHover")}).bind("mousedown.jsp",function(b){a("html").bind("dragstart.jsp selectstart.jsp",G),bb.addClass("jspActive");var c=b.pageX-bb.position().left;return a("html").bind("mousemove.jsp",function(a){t(a.pageX-c,!1)}).bind("mouseup.jsp mouseleave.jsp",q),!1}),nb=T.innerWidth(),j())}function j(){T.find(">.jspHorizontalBar>.jspCap:visible,>.jspHorizontalBar>.jspArrow").each(function(){nb-=a(this).outerWidth()}),mb.width(nb+"px"),db=0}function k(){if(Z&&Y){var b=mb.outerHeight(),c=fb.outerWidth();hb-=b,a(lb).find(">.jspCap:visible,>.jspArrow").each(function(){nb+=a(this).outerWidth()}),nb-=c,S-=c,R-=b,mb.parent().append(a('<div class="jspCorner" />').css("width",b+"px")),h(),j()}Z&&Q.width(T.outerWidth()-tb+"px"),V=Q.outerHeight(),X=V/S,Z&&(ob=Math.ceil(1/W*nb),ob>P.horizontalDragMaxWidth?ob=P.horizontalDragMaxWidth:ob<P.horizontalDragMinWidth&&(ob=P.horizontalDragMinWidth),bb.width(ob+"px"),cb=nb-ob,u(db)),Y&&(ib=Math.ceil(1/X*hb),ib>P.verticalDragMaxHeight?ib=P.verticalDragMaxHeight:ib<P.verticalDragMinHeight&&(ib=P.verticalDragMinHeight),$.height(ib+"px"),_=hb-ib,s(ab))}function l(a,b,c,d){var e,f="before",g="after";"os"==b&&(b=/Mac/.test(navigator.platform)?"after":"split"),b==f?g=b:b==g&&(f=b,e=c,c=d,d=e),a[f](c)[g](d)}function m(a,b,c){return function(){return n(a,b,this,c),this.blur(),!1}}function n(b,c,d,e){d=a(d).addClass("jspActive");var f,g,h=!0,i=function(){0!==b&&vb.scrollByX(b*P.arrowButtonSpeed),0!==c&&vb.scrollByY(c*P.arrowButtonSpeed),g=setTimeout(i,h?P.initialDelay:P.arrowRepeatFreq),h=!1};i(),f=e?"mouseout.jsp":"mouseup.jsp",e=e||a("html"),e.bind(f,function(){d.removeClass("jspActive"),g&&clearTimeout(g),g=null,e.unbind(f)})}function o(){p(),Y&&fb.bind("mousedown.jsp",function(b){if(b.originalTarget===c||b.originalTarget==b.currentTarget){var d,e=a(this),f=e.offset(),g=b.pageY-f.top-ab,h=!0,i=function(){var a=e.offset(),c=b.pageY-a.top-ib/2,f=S*P.scrollPagePercent,k=_*f/(V-S);if(0>g)ab-k>c?vb.scrollByY(-f):r(c);else{if(!(g>0))return void j();c>ab+k?vb.scrollByY(f):r(c)}d=setTimeout(i,h?P.initialDelay:P.trackClickRepeatFreq),h=!1},j=function(){d&&clearTimeout(d),d=null,a(document).unbind("mouseup.jsp",j)};return i(),a(document).bind("mouseup.jsp",j),!1}}),Z&&mb.bind("mousedown.jsp",function(b){if(b.originalTarget===c||b.originalTarget==b.currentTarget){var d,e=a(this),f=e.offset(),g=b.pageX-f.left-db,h=!0,i=function(){var a=e.offset(),c=b.pageX-a.left-ob/2,f=R*P.scrollPagePercent,k=cb*f/(U-R);if(0>g)db-k>c?vb.scrollByX(-f):t(c);else{if(!(g>0))return void j();c>db+k?vb.scrollByX(f):t(c)}d=setTimeout(i,h?P.initialDelay:P.trackClickRepeatFreq),h=!1},j=function(){d&&clearTimeout(d),d=null,a(document).unbind("mouseup.jsp",j)};return i(),a(document).bind("mouseup.jsp",j),!1}})}function p(){mb&&mb.unbind("mousedown.jsp"),fb&&fb.unbind("mousedown.jsp")}function q(){a("html").unbind("dragstart.jsp selectstart.jsp mousemove.jsp mouseup.jsp mouseleave.jsp"),$&&$.removeClass("jspActive"),bb&&bb.removeClass("jspActive")}function r(a,b){Y&&(0>a?a=0:a>_&&(a=_),b===c&&(b=P.animateScroll),b?vb.animate($,"top",a,s):($.css("top",a),s(a)))}function s(a){a===c&&(a=$.position().top),T.scrollTop(0),ab=a;var b=0===ab,e=ab==_,f=a/_,g=-f*(V-S);(wb!=b||yb!=e)&&(wb=b,yb=e,d.trigger("jsp-arrow-change",[wb,yb,xb,zb])),v(b,e),Q.css("top",g),d.trigger("jsp-scroll-y",[-g,b,e]).trigger("scroll")}function t(a,b){Z&&(0>a?a=0:a>cb&&(a=cb),b===c&&(b=P.animateScroll),b?vb.animate(bb,"left",a,u):(bb.css("left",a),u(a)))}function u(a){a===c&&(a=bb.position().left),T.scrollTop(0),db=a;var b=0===db,e=db==cb,f=a/cb,g=-f*(U-R);(xb!=b||zb!=e)&&(xb=b,zb=e,d.trigger("jsp-arrow-change",[wb,yb,xb,zb])),w(b,e),Q.css("left",g),d.trigger("jsp-scroll-x",[-g,b,e]).trigger("scroll")}function v(a,b){P.showArrows&&(jb[a?"addClass":"removeClass"]("jspDisabled"),kb[b?"addClass":"removeClass"]("jspDisabled"))}function w(a,b){P.showArrows&&(pb[a?"addClass":"removeClass"]("jspDisabled"),qb[b?"addClass":"removeClass"]("jspDisabled"))}function x(a,b){var c=a/(V-S);r(c*_,b)}function y(a,b){var c=a/(U-R);t(c*cb,b)}function z(b,c,d){var e,f,g,h,i,j,k,l,m,n=0,o=0;try{e=a(b)}catch(p){return}for(f=e.outerHeight(),g=e.outerWidth(),T.scrollTop(0),T.scrollLeft(0);!e.is(".jspPane");)if(n+=e.position().top,o+=e.position().left,e=e.offsetParent(),/^body|html$/i.test(e[0].nodeName))return;h=B(),j=h+S,h>n||c?l=n-P.horizontalGutter:n+f>j&&(l=n-S+f+P.horizontalGutter),isNaN(l)||x(l,d),i=A(),k=i+R,i>o||c?m=o-P.horizontalGutter:o+g>k&&(m=o-R+g+P.horizontalGutter),isNaN(m)||y(m,d)}function A(){return-Q.position().left}function B(){return-Q.position().top}function C(){var a=V-S;return a>20&&a-B()<10}function D(){var a=U-R;return a>20&&a-A()<10}function E(){T.unbind(Bb).bind(Bb,function(a,b,c,d){var e=db,f=ab,g=a.deltaFactor||P.mouseWheelSpeed;return vb.scrollBy(c*g,-d*g,!1),e==db&&f==ab})}function F(){T.unbind(Bb)}function G(){return!1}function H(){Q.find(":input,a").unbind("focus.jsp").bind("focus.jsp",function(a){z(a.target,!1)})}function I(){Q.find(":input,a").unbind("focus.jsp")}function J(){function b(){var a=db,b=ab;switch(c){case 40:vb.scrollByY(P.keyboardSpeed,!1);break;case 38:vb.scrollByY(-P.keyboardSpeed,!1);break;case 34:case 32:vb.scrollByY(S*P.scrollPagePercent,!1);break;case 33:vb.scrollByY(-S*P.scrollPagePercent,!1);break;case 39:vb.scrollByX(P.keyboardSpeed,!1);break;case 37:vb.scrollByX(-P.keyboardSpeed,!1)}return e=a!=db||b!=ab}var c,e,f=[];Z&&f.push(lb[0]),Y&&f.push(eb[0]),Q.focus(function(){d.focus()}),d.attr("tabindex",0).unbind("keydown.jsp keypress.jsp").bind("keydown.jsp",function(d){if(d.target===this||f.length&&a(d.target).closest(f).length){var g=db,h=ab;switch(d.keyCode){case 40:case 38:case 34:case 32:case 33:case 39:case 37:c=d.keyCode,b();break;case 35:x(V-S),c=null;break;case 36:x(0),c=null}return e=d.keyCode==c&&g!=db||h!=ab,!e}}).bind("keypress.jsp",function(a){return a.keyCode==c&&b(),!e}),P.hideFocus?(d.css("outline","none"),"hideFocus"in T[0]&&d.attr("hideFocus",!0)):(d.css("outline",""),"hideFocus"in T[0]&&d.attr("hideFocus",!1))}function K(){d.attr("tabindex","-1").removeAttr("tabindex").unbind("keydown.jsp keypress.jsp")}function L(){if(location.hash&&location.hash.length>1){var b,c,d=escape(location.hash.substr(1));try{b=a("#"+d+', a[name="'+d+'"]')}catch(e){return}b.length&&Q.find(d)&&(0===T.scrollTop()?c=setInterval(function(){T.scrollTop()>0&&(z(b,!0),a(document).scrollTop(T.position().top),clearInterval(c))},50):(z(b,!0),a(document).scrollTop(T.position().top)))}}function M(){a(document.body).data("jspHijack")||(a(document.body).data("jspHijack",!0),a(document.body).delegate("a[href*=#]","click",function(c){var d,e,f,g,h,i,j=this.href.substr(0,this.href.indexOf("#")),k=location.href;if(-1!==location.href.indexOf("#")&&(k=location.href.substr(0,location.href.indexOf("#"))),j===k){d=escape(this.href.substr(this.href.indexOf("#")+1));try{e=a("#"+d+', a[name="'+d+'"]')}catch(l){return}e.length&&(f=e.closest(".jspScrollable"),g=f.data("jsp"),g.scrollToElement(e,!0),f[0].scrollIntoView&&(h=a(b).scrollTop(),i=e.offset().top,(h>i||i>h+a(b).height())&&f[0].scrollIntoView()),c.preventDefault())}}))}function N(){var a,b,c,d,e,f=!1;T.unbind("touchstart.jsp touchmove.jsp touchend.jsp click.jsp-touchclick").bind("touchstart.jsp",function(g){var h=g.originalEvent.touches[0];a=A(),b=B(),c=h.pageX,d=h.pageY,e=!1,f=!0}).bind("touchmove.jsp",function(g){if(f){var h=g.originalEvent.touches[0],i=db,j=ab;return vb.scrollTo(a+c-h.pageX,b+d-h.pageY),e=e||Math.abs(c-h.pageX)>5||Math.abs(d-h.pageY)>5,i==db&&j==ab}}).bind("touchend.jsp",function(){f=!1}).bind("click.jsp-touchclick",function(){return e?(e=!1,!1):void 0})}function O(){var a=B(),b=A();d.removeClass("jspScrollable").unbind(".jsp"),d.replaceWith(Ab.append(Q.children())),Ab.scrollTop(a),Ab.scrollLeft(b),rb&&clearInterval(rb)}var P,Q,R,S,T,U,V,W,X,Y,Z,$,_,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb,nb,ob,pb,qb,rb,sb,tb,ub,vb=this,wb=!0,xb=!0,yb=!1,zb=!1,Ab=d.clone(!1,!1).empty(),Bb=a.fn.mwheelIntent?"mwheelIntent.jsp":"mousewheel.jsp";"border-box"===d.css("box-sizing")?(sb=0,tb=0):(sb=d.css("paddingTop")+" "+d.css("paddingRight")+" "+d.css("paddingBottom")+" "+d.css("paddingLeft"),tb=(parseInt(d.css("paddingLeft"),10)||0)+(parseInt(d.css("paddingRight"),10)||0)),a.extend(vb,{reinitialise:function(b){b=a.extend({},P,b),f(b)},scrollToElement:function(a,b,c){z(a,b,c)},scrollTo:function(a,b,c){y(a,c),x(b,c)},scrollToX:function(a,b){y(a,b)},scrollToY:function(a,b){x(a,b)},scrollToPercentX:function(a,b){y(a*(U-R),b)},scrollToPercentY:function(a,b){x(a*(V-S),b)},scrollBy:function(a,b,c){vb.scrollByX(a,c),vb.scrollByY(b,c)},scrollByX:function(a,b){var c=A()+Math[0>a?"floor":"ceil"](a),d=c/(U-R);t(d*cb,b)},scrollByY:function(a,b){var c=B()+Math[0>a?"floor":"ceil"](a),d=c/(V-S);r(d*_,b)},positionDragX:function(a,b){t(a,b)},positionDragY:function(a,b){r(a,b)},animate:function(a,b,c,d){var e={};e[b]=c,a.animate(e,{duration:P.animateDuration,easing:P.animateEase,queue:!1,step:d})},getContentPositionX:function(){return A()},getContentPositionY:function(){return B()},getContentWidth:function(){return U},getContentHeight:function(){return V},getPercentScrolledX:function(){return A()/(U-R)},getPercentScrolledY:function(){return B()/(V-S)},getIsScrollableH:function(){return Z},getIsScrollableV:function(){return Y},getContentPane:function(){return Q},scrollToBottom:function(a){r(_,a)},hijackInternalLinks:a.noop,destroy:function(){O()}}),f(e)}return d=a.extend({},a.fn.jScrollPane.defaults,d),a.each(["arrowButtonSpeed","trackClickSpeed","keyboardSpeed"],function(){d[this]=d[this]||d.speed}),this.each(function(){var b=a(this),c=b.data("jsp");c?c.reinitialise(d):(a("script",b).filter('[type="text/javascript"],:not([type])').remove(),c=new e(b,d),b.data("jsp",c))})},a.fn.jScrollPane.defaults={showArrows:!1,maintainPosition:!0,stickToBottom:!1,stickToRight:!1,clickOnTrack:!0,autoReinitialise:!1,autoReinitialiseDelay:500,verticalDragMinHeight:0,verticalDragMaxHeight:99999,horizontalDragMinWidth:0,horizontalDragMaxWidth:99999,contentWidth:c,animateScroll:!1,animateDuration:300,animateEase:"linear",hijackInternalLinks:!1,verticalGutter:4,horizontalGutter:4,mouseWheelSpeed:3,arrowButtonSpeed:0,arrowRepeatFreq:50,arrowScrollOnHover:!1,trackClickSpeed:0,trackClickRepeatFreq:70,verticalArrowPositions:"split",horizontalArrowPositions:"split",enableKeyboardNavigation:!0,hideFocus:!1,keyboardSpeed:0,initialDelay:300,speed:30,scrollPagePercent:.8}},this);
/*!
* jQuery Cycle2; version: 2.1.5 build: 20140415
* http://jquery.malsup.com/cycle2/
* Copyright (c) 2014 M. Alsup; Dual licensed: MIT/GPL
*/

/* Cycle2 core engine */
;(function($) {
"use strict";

var version = '2.1.5';

$.fn.cycle = function( options ) {
    // fix mistakes with the ready state
    var o;
    if ( this.length === 0 && !$.isReady ) {
        o = { s: this.selector, c: this.context };
        $.fn.cycle.log('requeuing slideshow (dom not ready)');
        $(function() {
            $( o.s, o.c ).cycle(options);
        });
        return this;
    }

    return this.each(function() {
        var data, opts, shortName, val;
        var container = $(this);
        var log = $.fn.cycle.log;

        if ( container.data('cycle.opts') )
            return; // already initialized

        if ( container.data('cycle-log') === false || 
            ( options && options.log === false ) ||
            ( opts && opts.log === false) ) {
            log = $.noop;
        }

        log('--c2 init--');
        data = container.data();
        for (var p in data) {
            // allow props to be accessed sans 'cycle' prefix and log the overrides
            if (data.hasOwnProperty(p) && /^cycle[A-Z]+/.test(p) ) {
                val = data[p];
                shortName = p.match(/^cycle(.*)/)[1].replace(/^[A-Z]/, lowerCase);
                log(shortName+':', val, '('+typeof val +')');
                data[shortName] = val;
            }
        }

        opts = $.extend( {}, $.fn.cycle.defaults, data, options || {});

        opts.timeoutId = 0;
        opts.paused = opts.paused || false; // #57
        opts.container = container;
        opts._maxZ = opts.maxZ;

        opts.API = $.extend ( { _container: container }, $.fn.cycle.API );
        opts.API.log = log;
        opts.API.trigger = function( eventName, args ) {
            opts.container.trigger( eventName, args );
            return opts.API;
        };

        container.data( 'cycle.opts', opts );
        container.data( 'cycle.API', opts.API );

        // opportunity for plugins to modify opts and API
        opts.API.trigger('cycle-bootstrap', [ opts, opts.API ]);

        opts.API.addInitialSlides();
        opts.API.preInitSlideshow();

        if ( opts.slides.length )
            opts.API.initSlideshow();
    });
};

$.fn.cycle.API = {
    opts: function() {
        return this._container.data( 'cycle.opts' );
    },
    addInitialSlides: function() {
        var opts = this.opts();
        var slides = opts.slides;
        opts.slideCount = 0;
        opts.slides = $(); // empty set
        
        // add slides that already exist
        slides = slides.jquery ? slides : opts.container.find( slides );

        if ( opts.random ) {
            slides.sort(function() {return Math.random() - 0.5;});
        }

        opts.API.add( slides );
    },

    preInitSlideshow: function() {
        var opts = this.opts();
        opts.API.trigger('cycle-pre-initialize', [ opts ]);
        var tx = $.fn.cycle.transitions[opts.fx];
        if (tx && $.isFunction(tx.preInit))
            tx.preInit( opts );
        opts._preInitialized = true;
    },

    postInitSlideshow: function() {
        var opts = this.opts();
        opts.API.trigger('cycle-post-initialize', [ opts ]);
        var tx = $.fn.cycle.transitions[opts.fx];
        if (tx && $.isFunction(tx.postInit))
            tx.postInit( opts );
    },

    initSlideshow: function() {
        var opts = this.opts();
        var pauseObj = opts.container;
        var slideOpts;
        opts.API.calcFirstSlide();

        if ( opts.container.css('position') == 'static' )
            opts.container.css('position', 'relative');

        $(opts.slides[opts.currSlide]).css({
            opacity: 1,
            display: 'block',
            visibility: 'visible'
        });
        opts.API.stackSlides( opts.slides[opts.currSlide], opts.slides[opts.nextSlide], !opts.reverse );

        if ( opts.pauseOnHover ) {
            // allow pauseOnHover to specify an element
            if ( opts.pauseOnHover !== true )
                pauseObj = $( opts.pauseOnHover );

            pauseObj.hover(
                function(){ opts.API.pause( true ); }, 
                function(){ opts.API.resume( true ); }
            );
        }

        // stage initial transition
        if ( opts.timeout ) {
            slideOpts = opts.API.getSlideOpts( opts.currSlide );
            opts.API.queueTransition( slideOpts, slideOpts.timeout + opts.delay );
        }

        opts._initialized = true;
        opts.API.updateView( true );
        opts.API.trigger('cycle-initialized', [ opts ]);
        opts.API.postInitSlideshow();
    },

    pause: function( hover ) {
        var opts = this.opts(),
            slideOpts = opts.API.getSlideOpts(),
            alreadyPaused = opts.hoverPaused || opts.paused;

        if ( hover )
            opts.hoverPaused = true; 
        else
            opts.paused = true;

        if ( ! alreadyPaused ) {
            opts.container.addClass('cycle-paused');
            opts.API.trigger('cycle-paused', [ opts ]).log('cycle-paused');

            if ( slideOpts.timeout ) {
                clearTimeout( opts.timeoutId );
                opts.timeoutId = 0;
                
                // determine how much time is left for the current slide
                opts._remainingTimeout -= ( $.now() - opts._lastQueue );
                if ( opts._remainingTimeout < 0 || isNaN(opts._remainingTimeout) )
                    opts._remainingTimeout = undefined;
            }
        }
    },

    resume: function( hover ) {
        var opts = this.opts(),
            alreadyResumed = !opts.hoverPaused && !opts.paused,
            remaining;

        if ( hover )
            opts.hoverPaused = false; 
        else
            opts.paused = false;

    
        if ( ! alreadyResumed ) {
            opts.container.removeClass('cycle-paused');
            // #gh-230; if an animation is in progress then don't queue a new transition; it will
            // happen naturally
            if ( opts.slides.filter(':animated').length === 0 )
                opts.API.queueTransition( opts.API.getSlideOpts(), opts._remainingTimeout );
            opts.API.trigger('cycle-resumed', [ opts, opts._remainingTimeout ] ).log('cycle-resumed');
        }
    },

    add: function( slides, prepend ) {
        var opts = this.opts();
        var oldSlideCount = opts.slideCount;
        var startSlideshow = false;
        var len;

        if ( $.type(slides) == 'string')
            slides = $.trim( slides );

        $( slides ).each(function(i) {
            var slideOpts;
            var slide = $(this);

            if ( prepend )
                opts.container.prepend( slide );
            else
                opts.container.append( slide );

            opts.slideCount++;
            slideOpts = opts.API.buildSlideOpts( slide );

            if ( prepend )
                opts.slides = $( slide ).add( opts.slides );
            else
                opts.slides = opts.slides.add( slide );

            opts.API.initSlide( slideOpts, slide, --opts._maxZ );

            slide.data('cycle.opts', slideOpts);
            opts.API.trigger('cycle-slide-added', [ opts, slideOpts, slide ]);
        });

        opts.API.updateView( true );

        startSlideshow = opts._preInitialized && (oldSlideCount < 2 && opts.slideCount >= 1);
        if ( startSlideshow ) {
            if ( !opts._initialized )
                opts.API.initSlideshow();
            else if ( opts.timeout ) {
                len = opts.slides.length;
                opts.nextSlide = opts.reverse ? len - 1 : 1;
                if ( !opts.timeoutId ) {
                    opts.API.queueTransition( opts );
                }
            }
        }
    },

    calcFirstSlide: function() {
        var opts = this.opts();
        var firstSlideIndex;
        firstSlideIndex = parseInt( opts.startingSlide || 0, 10 );
        if (firstSlideIndex >= opts.slides.length || firstSlideIndex < 0)
            firstSlideIndex = 0;

        opts.currSlide = firstSlideIndex;
        if ( opts.reverse ) {
            opts.nextSlide = firstSlideIndex - 1;
            if (opts.nextSlide < 0)
                opts.nextSlide = opts.slides.length - 1;
        }
        else {
            opts.nextSlide = firstSlideIndex + 1;
            if (opts.nextSlide == opts.slides.length)
                opts.nextSlide = 0;
        }
    },

    calcNextSlide: function() {
        var opts = this.opts();
        var roll;
        if ( opts.reverse ) {
            roll = (opts.nextSlide - 1) < 0;
            opts.nextSlide = roll ? opts.slideCount - 1 : opts.nextSlide-1;
            opts.currSlide = roll ? 0 : opts.nextSlide+1;
        }
        else {
            roll = (opts.nextSlide + 1) == opts.slides.length;
            opts.nextSlide = roll ? 0 : opts.nextSlide+1;
            opts.currSlide = roll ? opts.slides.length-1 : opts.nextSlide-1;
        }
    },

    calcTx: function( slideOpts, manual ) {
        var opts = slideOpts;
        var tx;

        if ( opts._tempFx )
            tx = $.fn.cycle.transitions[opts._tempFx];
        else if ( manual && opts.manualFx )
            tx = $.fn.cycle.transitions[opts.manualFx];

        if ( !tx )
            tx = $.fn.cycle.transitions[opts.fx];

        opts._tempFx = null;
        this.opts()._tempFx = null;

        if (!tx) {
            tx = $.fn.cycle.transitions.fade;
            opts.API.log('Transition "' + opts.fx + '" not found.  Using fade.');
        }
        return tx;
    },

    prepareTx: function( manual, fwd ) {
        var opts = this.opts();
        var after, curr, next, slideOpts, tx;

        if ( opts.slideCount < 2 ) {
            opts.timeoutId = 0;
            return;
        }
        if ( manual && ( !opts.busy || opts.manualTrump ) ) {
            opts.API.stopTransition();
            opts.busy = false;
            clearTimeout(opts.timeoutId);
            opts.timeoutId = 0;
        }
        if ( opts.busy )
            return;
        if ( opts.timeoutId === 0 && !manual )
            return;

        curr = opts.slides[opts.currSlide];
        next = opts.slides[opts.nextSlide];
        slideOpts = opts.API.getSlideOpts( opts.nextSlide );
        tx = opts.API.calcTx( slideOpts, manual );

        opts._tx = tx;

        if ( manual && slideOpts.manualSpeed !== undefined )
            slideOpts.speed = slideOpts.manualSpeed;

        // if ( opts.nextSlide === opts.currSlide )
        //     opts.API.calcNextSlide();

        // ensure that:
        //      1. advancing to a different slide
        //      2. this is either a manual event (prev/next, pager, cmd) or 
        //              a timer event and slideshow is not paused
        if ( opts.nextSlide != opts.currSlide && 
            (manual || (!opts.paused && !opts.hoverPaused && opts.timeout) )) { // #62

            opts.API.trigger('cycle-before', [ slideOpts, curr, next, fwd ]);
            if ( tx.before )
                tx.before( slideOpts, curr, next, fwd );

            after = function() {
                opts.busy = false;
                // #76; bail if slideshow has been destroyed
                if (! opts.container.data( 'cycle.opts' ) )
                    return;

                if (tx.after)
                    tx.after( slideOpts, curr, next, fwd );
                opts.API.trigger('cycle-after', [ slideOpts, curr, next, fwd ]);
                opts.API.queueTransition( slideOpts);
                opts.API.updateView( true );
            };

            opts.busy = true;
            if (tx.transition)
                tx.transition(slideOpts, curr, next, fwd, after);
            else
                opts.API.doTransition( slideOpts, curr, next, fwd, after);

            opts.API.calcNextSlide();
            opts.API.updateView();
        } else {
            opts.API.queueTransition( slideOpts );
        }
    },

    // perform the actual animation
    doTransition: function( slideOpts, currEl, nextEl, fwd, callback) {
        var opts = slideOpts;
        var curr = $(currEl), next = $(nextEl);
        var fn = function() {
            // make sure animIn has something so that callback doesn't trigger immediately
            next.animate(opts.animIn || { opacity: 1}, opts.speed, opts.easeIn || opts.easing, callback);
        };

        next.css(opts.cssBefore || {});
        curr.animate(opts.animOut || {}, opts.speed, opts.easeOut || opts.easing, function() {
            curr.css(opts.cssAfter || {});
            if (!opts.sync) {
                fn();
            }
        });
        if (opts.sync) {
            fn();
        }
    },

    queueTransition: function( slideOpts, specificTimeout ) {
        var opts = this.opts();
        var timeout = specificTimeout !== undefined ? specificTimeout : slideOpts.timeout;
        if (opts.nextSlide === 0 && --opts.loop === 0) {
            opts.API.log('terminating; loop=0');
            opts.timeout = 0;
            if ( timeout ) {
                setTimeout(function() {
                    opts.API.trigger('cycle-finished', [ opts ]);
                }, timeout);
            }
            else {
                opts.API.trigger('cycle-finished', [ opts ]);
            }
            // reset nextSlide
            opts.nextSlide = opts.currSlide;
            return;
        }
        if ( opts.continueAuto !== undefined ) {
            if ( opts.continueAuto === false || 
                ($.isFunction(opts.continueAuto) && opts.continueAuto() === false )) {
                opts.API.log('terminating automatic transitions');
                opts.timeout = 0;
                if ( opts.timeoutId )
                    clearTimeout(opts.timeoutId);
                return;
            }
        }
        if ( timeout ) {
            opts._lastQueue = $.now();
            if ( specificTimeout === undefined )
                opts._remainingTimeout = slideOpts.timeout;

            if ( !opts.paused && ! opts.hoverPaused ) {
                opts.timeoutId = setTimeout(function() { 
                    opts.API.prepareTx( false, !opts.reverse ); 
                }, timeout );
            }
        }
    },

    stopTransition: function() {
        var opts = this.opts();
        if ( opts.slides.filter(':animated').length ) {
            opts.slides.stop(false, true);
            opts.API.trigger('cycle-transition-stopped', [ opts ]);
        }

        if ( opts._tx && opts._tx.stopTransition )
            opts._tx.stopTransition( opts );
    },

    // advance slide forward or back
    advanceSlide: function( val ) {
        var opts = this.opts();
        clearTimeout(opts.timeoutId);
        opts.timeoutId = 0;
        opts.nextSlide = opts.currSlide + val;
        
        if (opts.nextSlide < 0)
            opts.nextSlide = opts.slides.length - 1;
        else if (opts.nextSlide >= opts.slides.length)
            opts.nextSlide = 0;

        opts.API.prepareTx( true,  val >= 0 );
        return false;
    },

    buildSlideOpts: function( slide ) {
        var opts = this.opts();
        var val, shortName;
        var slideOpts = slide.data() || {};
        for (var p in slideOpts) {
            // allow props to be accessed sans 'cycle' prefix and log the overrides
            if (slideOpts.hasOwnProperty(p) && /^cycle[A-Z]+/.test(p) ) {
                val = slideOpts[p];
                shortName = p.match(/^cycle(.*)/)[1].replace(/^[A-Z]/, lowerCase);
                opts.API.log('['+(opts.slideCount-1)+']', shortName+':', val, '('+typeof val +')');
                slideOpts[shortName] = val;
            }
        }

        slideOpts = $.extend( {}, $.fn.cycle.defaults, opts, slideOpts );
        slideOpts.slideNum = opts.slideCount;

        try {
            // these props should always be read from the master state object
            delete slideOpts.API;
            delete slideOpts.slideCount;
            delete slideOpts.currSlide;
            delete slideOpts.nextSlide;
            delete slideOpts.slides;
        } catch(e) {
            // no op
        }
        return slideOpts;
    },

    getSlideOpts: function( index ) {
        var opts = this.opts();
        if ( index === undefined )
            index = opts.currSlide;

        var slide = opts.slides[index];
        var slideOpts = $(slide).data('cycle.opts');
        return $.extend( {}, opts, slideOpts );
    },
    
    initSlide: function( slideOpts, slide, suggestedZindex ) {
        var opts = this.opts();
        slide.css( slideOpts.slideCss || {} );
        if ( suggestedZindex > 0 )
            slide.css( 'zIndex', suggestedZindex );

        // ensure that speed settings are sane
        if ( isNaN( slideOpts.speed ) )
            slideOpts.speed = $.fx.speeds[slideOpts.speed] || $.fx.speeds._default;
        if ( !slideOpts.sync )
            slideOpts.speed = slideOpts.speed / 2;

        slide.addClass( opts.slideClass );
    },

    updateView: function( isAfter, isDuring, forceEvent ) {
        var opts = this.opts();
        if ( !opts._initialized )
            return;
        var slideOpts = opts.API.getSlideOpts();
        var currSlide = opts.slides[ opts.currSlide ];

        if ( ! isAfter && isDuring !== true ) {
            opts.API.trigger('cycle-update-view-before', [ opts, slideOpts, currSlide ]);
            if ( opts.updateView < 0 )
                return;
        }

        if ( opts.slideActiveClass ) {
            opts.slides.removeClass( opts.slideActiveClass )
                .eq( opts.currSlide ).addClass( opts.slideActiveClass );
        }

        if ( isAfter && opts.hideNonActive )
            opts.slides.filter( ':not(.' + opts.slideActiveClass + ')' ).css('visibility', 'hidden');

        if ( opts.updateView === 0 ) {
            setTimeout(function() {
                opts.API.trigger('cycle-update-view', [ opts, slideOpts, currSlide, isAfter ]);
            }, slideOpts.speed / (opts.sync ? 2 : 1) );
        }

        if ( opts.updateView !== 0 )
            opts.API.trigger('cycle-update-view', [ opts, slideOpts, currSlide, isAfter ]);
        
        if ( isAfter )
            opts.API.trigger('cycle-update-view-after', [ opts, slideOpts, currSlide ]);
    },

    getComponent: function( name ) {
        var opts = this.opts();
        var selector = opts[name];
        if (typeof selector === 'string') {
            // if selector is a child, sibling combinator, adjancent selector then use find, otherwise query full dom
            return (/^\s*[\>|\+|~]/).test( selector ) ? opts.container.find( selector ) : $( selector );
        }
        if (selector.jquery)
            return selector;
        
        return $(selector);
    },

    stackSlides: function( curr, next, fwd ) {
        var opts = this.opts();
        if ( !curr ) {
            curr = opts.slides[opts.currSlide];
            next = opts.slides[opts.nextSlide];
            fwd = !opts.reverse;
        }

        // reset the zIndex for the common case:
        // curr slide on top,  next slide beneath, and the rest in order to be shown
        $(curr).css('zIndex', opts.maxZ);

        var i;
        var z = opts.maxZ - 2;
        var len = opts.slideCount;
        if (fwd) {
            for ( i = opts.currSlide + 1; i < len; i++ )
                $( opts.slides[i] ).css( 'zIndex', z-- );
            for ( i = 0; i < opts.currSlide; i++ )
                $( opts.slides[i] ).css( 'zIndex', z-- );
        }
        else {
            for ( i = opts.currSlide - 1; i >= 0; i-- )
                $( opts.slides[i] ).css( 'zIndex', z-- );
            for ( i = len - 1; i > opts.currSlide; i-- )
                $( opts.slides[i] ).css( 'zIndex', z-- );
        }

        $(next).css('zIndex', opts.maxZ - 1);
    },

    getSlideIndex: function( el ) {
        return this.opts().slides.index( el );
    }

}; // API

// default logger
$.fn.cycle.log = function log() {
    /*global console:true */
    if (window.console && console.log)
        console.log('[cycle2] ' + Array.prototype.join.call(arguments, ' ') );
};

$.fn.cycle.version = function() { return 'Cycle2: ' + version; };

// helper functions

function lowerCase(s) {
    return (s || '').toLowerCase();
}

// expose transition object
$.fn.cycle.transitions = {
    custom: {
    },
    none: {
        before: function( opts, curr, next, fwd ) {
            opts.API.stackSlides( next, curr, fwd );
            opts.cssBefore = { opacity: 1, visibility: 'visible', display: 'block' };
        }
    },
    fade: {
        before: function( opts, curr, next, fwd ) {
            var css = opts.API.getSlideOpts( opts.nextSlide ).slideCss || {};
            opts.API.stackSlides( curr, next, fwd );
            opts.cssBefore = $.extend(css, { opacity: 0, visibility: 'visible', display: 'block' });
            opts.animIn = { opacity: 1 };
            opts.animOut = { opacity: 0 };
        }
    },
    fadeout: {
        before: function( opts , curr, next, fwd ) {
            var css = opts.API.getSlideOpts( opts.nextSlide ).slideCss || {};
            opts.API.stackSlides( curr, next, fwd );
            opts.cssBefore = $.extend(css, { opacity: 1, visibility: 'visible', display: 'block' });
            opts.animOut = { opacity: 0 };
        }
    },
    scrollHorz: {
        before: function( opts, curr, next, fwd ) {
            opts.API.stackSlides( curr, next, fwd );
            var w = opts.container.css('overflow','hidden').width();
            opts.cssBefore = { left: fwd ? w : - w, top: 0, opacity: 1, visibility: 'visible', display: 'block' };
            opts.cssAfter = { zIndex: opts._maxZ - 2, left: 0 };
            opts.animIn = { left: 0 };
            opts.animOut = { left: fwd ? -w : w };
        }
    }
};

// @see: http://jquery.malsup.com/cycle2/api
$.fn.cycle.defaults = {
    allowWrap:        true,
    autoSelector:     '.cycle-slideshow[data-cycle-auto-init!=false]',
    delay:            0,
    easing:           null,
    fx:              'fade',
    hideNonActive:    true,
    loop:             0,
    manualFx:         undefined,
    manualSpeed:      undefined,
    manualTrump:      true,
    maxZ:             100,
    pauseOnHover:     false,
    reverse:          false,
    slideActiveClass: 'cycle-slide-active',
    slideClass:       'cycle-slide',
    slideCss:         { position: 'absolute', top: 0, left: 0 },
    slides:          '> img',
    speed:            500,
    startingSlide:    0,
    sync:             true,
    timeout:          4000,
    updateView:       0
};

// automatically find and run slideshows
$(document).ready(function() {
    $( $.fn.cycle.defaults.autoSelector ).cycle();
});

})(jQuery);

/*! Cycle2 autoheight plugin; Copyright (c) M.Alsup, 2012; version: 20130913 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    autoHeight: 0, // setting this option to false disables autoHeight logic
    autoHeightSpeed: 250,
    autoHeightEasing: null
});    

$(document).on( 'cycle-initialized', function( e, opts ) {
    var autoHeight = opts.autoHeight;
    var t = $.type( autoHeight );
    var resizeThrottle = null;
    var ratio;

    if ( t !== 'string' && t !== 'number' )
        return;

    // bind events
    opts.container.on( 'cycle-slide-added cycle-slide-removed', initAutoHeight );
    opts.container.on( 'cycle-destroyed', onDestroy );

    if ( autoHeight == 'container' ) {
        opts.container.on( 'cycle-before', onBefore );
    }
    else if ( t === 'string' && /\d+\:\d+/.test( autoHeight ) ) { 
        // use ratio
        ratio = autoHeight.match(/(\d+)\:(\d+)/);
        ratio = ratio[1] / ratio[2];
        opts._autoHeightRatio = ratio;
    }

    // if autoHeight is a number then we don't need to recalculate the sentinel
    // index on resize
    if ( t !== 'number' ) {
        // bind unique resize handler per slideshow (so it can be 'off-ed' in onDestroy)
        opts._autoHeightOnResize = function () {
            clearTimeout( resizeThrottle );
            resizeThrottle = setTimeout( onResize, 50 );
        };

        $(window).on( 'resize orientationchange', opts._autoHeightOnResize );
    }

    setTimeout( onResize, 30 );

    function onResize() {
        initAutoHeight( e, opts );
    }
});

function initAutoHeight( e, opts ) {
    var clone, height, sentinelIndex;
    var autoHeight = opts.autoHeight;

    if ( autoHeight == 'container' ) {
        height = $( opts.slides[ opts.currSlide ] ).outerHeight();
        opts.container.height( height );
    }
    else if ( opts._autoHeightRatio ) { 
        opts.container.height( opts.container.width() / opts._autoHeightRatio );
    }
    else if ( autoHeight === 'calc' || ( $.type( autoHeight ) == 'number' && autoHeight >= 0 ) ) {
        if ( autoHeight === 'calc' )
            sentinelIndex = calcSentinelIndex( e, opts );
        else if ( autoHeight >= opts.slides.length )
            sentinelIndex = 0;
        else 
            sentinelIndex = autoHeight;

        // only recreate sentinel if index is different
        if ( sentinelIndex == opts._sentinelIndex )
            return;

        opts._sentinelIndex = sentinelIndex;
        if ( opts._sentinel )
            opts._sentinel.remove();

        // clone existing slide as sentinel
        clone = $( opts.slides[ sentinelIndex ].cloneNode(true) );
        
        // #50; remove special attributes from cloned content
        clone.removeAttr( 'id name rel' ).find( '[id],[name],[rel]' ).removeAttr( 'id name rel' );

        clone.css({
            position: 'static',
            visibility: 'hidden',
            display: 'block'
        }).prependTo( opts.container ).addClass('cycle-sentinel cycle-slide').removeClass('cycle-slide-active');
        clone.find( '*' ).css( 'visibility', 'hidden' );

        opts._sentinel = clone;
    }
}    

function calcSentinelIndex( e, opts ) {
    var index = 0, max = -1;

    // calculate tallest slide index
    opts.slides.each(function(i) {
        var h = $(this).height();
        if ( h > max ) {
            max = h;
            index = i;
        }
    });
    return index;
}

function onBefore( e, opts, outgoing, incoming, forward ) {
    var h = $(incoming).outerHeight();
    opts.container.animate( { height: h }, opts.autoHeightSpeed, opts.autoHeightEasing );
}

function onDestroy( e, opts ) {
    if ( opts._autoHeightOnResize ) {
        $(window).off( 'resize orientationchange', opts._autoHeightOnResize );
        opts._autoHeightOnResize = null;
    }
    opts.container.off( 'cycle-slide-added cycle-slide-removed', initAutoHeight );
    opts.container.off( 'cycle-destroyed', onDestroy );
    opts.container.off( 'cycle-before', onBefore );

    if ( opts._sentinel ) {
        opts._sentinel.remove();
        opts._sentinel = null;
    }
}

})(jQuery);

/*! caption plugin for Cycle2;  version: 20130306 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    caption:          '> .cycle-caption',
    captionTemplate:  '{{slideNum}} / {{slideCount}}',
    overlay:          '> .cycle-overlay',
    overlayTemplate:  '<div>{{title}}</div><div>{{desc}}</div>',
    captionModule:    'caption'
});    

$(document).on( 'cycle-update-view', function( e, opts, slideOpts, currSlide ) {
    if ( opts.captionModule !== 'caption' )
        return;
    var el;
    $.each(['caption','overlay'], function() {
        var name = this; 
        var template = slideOpts[name+'Template'];
        var el = opts.API.getComponent( name );
        if( el.length && template ) {
            el.html( opts.API.tmpl( template, slideOpts, opts, currSlide ) );
            el.show();
        }
        else {
            el.hide();
        }
    });
});

$(document).on( 'cycle-destroyed', function( e, opts ) {
    var el;
    $.each(['caption','overlay'], function() {
        var name = this, template = opts[name+'Template'];
        if ( opts[name] && template ) {
            el = opts.API.getComponent( 'caption' );
            el.empty();
        }
    });
});

})(jQuery);

/*! command plugin for Cycle2;  version: 20140415 */
(function($) {
"use strict";

var c2 = $.fn.cycle;

$.fn.cycle = function( options ) {
    var cmd, cmdFn, opts;
    var args = $.makeArray( arguments );

    if ( $.type( options ) == 'number' ) {
        return this.cycle( 'goto', options );
    }

    if ( $.type( options ) == 'string' ) {
        return this.each(function() {
            var cmdArgs;
            cmd = options;
            opts = $(this).data('cycle.opts');

            if ( opts === undefined ) {
                c2.log('slideshow must be initialized before sending commands; "' + cmd + '" ignored');
                return;
            }
            else {
                cmd = cmd == 'goto' ? 'jump' : cmd; // issue #3; change 'goto' to 'jump' internally
                cmdFn = opts.API[ cmd ];
                if ( $.isFunction( cmdFn )) {
                    cmdArgs = $.makeArray( args );
                    cmdArgs.shift();
                    return cmdFn.apply( opts.API, cmdArgs );
                }
                else {
                    c2.log( 'unknown command: ', cmd );
                }
            }
        });
    }
    else {
        return c2.apply( this, arguments );
    }
};

// copy props
$.extend( $.fn.cycle, c2 );

$.extend( c2.API, {
    next: function() {
        var opts = this.opts();
        if ( opts.busy && ! opts.manualTrump )
            return;
        
        var count = opts.reverse ? -1 : 1;
        if ( opts.allowWrap === false && ( opts.currSlide + count ) >= opts.slideCount )
            return;

        opts.API.advanceSlide( count );
        opts.API.trigger('cycle-next', [ opts ]).log('cycle-next');
    },

    prev: function() {
        var opts = this.opts();
        if ( opts.busy && ! opts.manualTrump )
            return;
        var count = opts.reverse ? 1 : -1;
        if ( opts.allowWrap === false && ( opts.currSlide + count ) < 0 )
            return;

        opts.API.advanceSlide( count );
        opts.API.trigger('cycle-prev', [ opts ]).log('cycle-prev');
    },

    destroy: function() {
        this.stop(); //#204

        var opts = this.opts();
        var clean = $.isFunction( $._data ) ? $._data : $.noop;  // hack for #184 and #201
        clearTimeout(opts.timeoutId);
        opts.timeoutId = 0;
        opts.API.stop();
        opts.API.trigger( 'cycle-destroyed', [ opts ] ).log('cycle-destroyed');
        opts.container.removeData();
        clean( opts.container[0], 'parsedAttrs', false );

        // #75; remove inline styles
        if ( ! opts.retainStylesOnDestroy ) {
            opts.container.removeAttr( 'style' );
            opts.slides.removeAttr( 'style' );
            opts.slides.removeClass( opts.slideActiveClass );
        }
        opts.slides.each(function() {
            $(this).removeData();
            clean( this, 'parsedAttrs', false );
        });
    },

    jump: function( index, fx ) {
        // go to the requested slide
        var fwd;
        var opts = this.opts();
        if ( opts.busy && ! opts.manualTrump )
            return;
        var num = parseInt( index, 10 );
        if (isNaN(num) || num < 0 || num >= opts.slides.length) {
            opts.API.log('goto: invalid slide index: ' + num);
            return;
        }
        if (num == opts.currSlide) {
            opts.API.log('goto: skipping, already on slide', num);
            return;
        }
        opts.nextSlide = num;
        clearTimeout(opts.timeoutId);
        opts.timeoutId = 0;
        opts.API.log('goto: ', num, ' (zero-index)');
        fwd = opts.currSlide < opts.nextSlide;
        opts._tempFx = fx;
        opts.API.prepareTx( true, fwd );
    },

    stop: function() {
        var opts = this.opts();
        var pauseObj = opts.container;
        clearTimeout(opts.timeoutId);
        opts.timeoutId = 0;
        opts.API.stopTransition();
        if ( opts.pauseOnHover ) {
            if ( opts.pauseOnHover !== true )
                pauseObj = $( opts.pauseOnHover );
            pauseObj.off('mouseenter mouseleave');
        }
        opts.API.trigger('cycle-stopped', [ opts ]).log('cycle-stopped');
    },

    reinit: function() {
        var opts = this.opts();
        opts.API.destroy();
        opts.container.cycle();
    },

    remove: function( index ) {
        var opts = this.opts();
        var slide, slideToRemove, slides = [], slideNum = 1;
        for ( var i=0; i < opts.slides.length; i++ ) {
            slide = opts.slides[i];
            if ( i == index ) {
                slideToRemove = slide;
            }
            else {
                slides.push( slide );
                $( slide ).data('cycle.opts').slideNum = slideNum;
                slideNum++;
            }
        }
        if ( slideToRemove ) {
            opts.slides = $( slides );
            opts.slideCount--;
            $( slideToRemove ).remove();
            if (index == opts.currSlide)
                opts.API.advanceSlide( 1 );
            else if ( index < opts.currSlide )
                opts.currSlide--;
            else
                opts.currSlide++;

            opts.API.trigger('cycle-slide-removed', [ opts, index, slideToRemove ]).log('cycle-slide-removed');
            opts.API.updateView();
        }
    }

});

// listen for clicks on elements with data-cycle-cmd attribute
$(document).on('click.cycle', '[data-cycle-cmd]', function(e) {
    // issue cycle command
    e.preventDefault();
    var el = $(this);
    var command = el.data('cycle-cmd');
    var context = el.data('cycle-context') || '.cycle-slideshow';
    $(context).cycle(command, el.data('cycle-arg'));
});


})(jQuery);

/*! hash plugin for Cycle2;  version: 20130905 */
(function($) {
"use strict";

$(document).on( 'cycle-pre-initialize', function( e, opts ) {
    onHashChange( opts, true );

    opts._onHashChange = function() {
        onHashChange( opts, false );
    };

    $( window ).on( 'hashchange', opts._onHashChange);
});

$(document).on( 'cycle-update-view', function( e, opts, slideOpts ) {
    if ( slideOpts.hash && ( '#' + slideOpts.hash ) != window.location.hash ) {
        opts._hashFence = true;
        window.location.hash = slideOpts.hash;
    }
});

$(document).on( 'cycle-destroyed', function( e, opts) {
    if ( opts._onHashChange ) {
        $( window ).off( 'hashchange', opts._onHashChange );
    }
});

function onHashChange( opts, setStartingSlide ) {
    var hash;
    if ( opts._hashFence ) {
        opts._hashFence = false;
        return;
    }
    
    hash = window.location.hash.substring(1);

    opts.slides.each(function(i) {
        if ( $(this).data( 'cycle-hash' ) == hash ) {
            if ( setStartingSlide === true ) {
                opts.startingSlide = i;
            }
            else {
                var fwd = opts.currSlide < i;
                opts.nextSlide = i;
                opts.API.prepareTx( true, fwd );
            }
            return false;
        }
    });
}

})(jQuery);

/*! loader plugin for Cycle2;  version: 20131121 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    loader: false
});

$(document).on( 'cycle-bootstrap', function( e, opts ) {
    var addFn;

    if ( !opts.loader )
        return;

    // override API.add for this slideshow
    addFn = opts.API.add;
    opts.API.add = add;

    function add( slides, prepend ) {
        var slideArr = [];
        if ( $.type( slides ) == 'string' )
            slides = $.trim( slides );
        else if ( $.type( slides) === 'array' ) {
            for (var i=0; i < slides.length; i++ )
                slides[i] = $(slides[i])[0];
        }

        slides = $( slides );
        var slideCount = slides.length;

        if ( ! slideCount )
            return;

        slides.css('visibility','hidden').appendTo('body').each(function(i) { // appendTo fixes #56
            var count = 0;
            var slide = $(this);
            var images = slide.is('img') ? slide : slide.find('img');
            slide.data('index', i);
            // allow some images to be marked as unimportant (and filter out images w/o src value)
            images = images.filter(':not(.cycle-loader-ignore)').filter(':not([src=""])');
            if ( ! images.length ) {
                --slideCount;
                slideArr.push( slide );
                return;
            }

            count = images.length;
            images.each(function() {
                // add images that are already loaded
                if ( this.complete ) {
                    imageLoaded();
                }
                else {
                    $(this).load(function() {
                        imageLoaded();
                    }).on("error", function() {
                        if ( --count === 0 ) {
                            // ignore this slide
                            opts.API.log('slide skipped; img not loaded:', this.src);
                            if ( --slideCount === 0 && opts.loader == 'wait') {
                                addFn.apply( opts.API, [ slideArr, prepend ] );
                            }
                        }
                    });
                }
            });

            function imageLoaded() {
                if ( --count === 0 ) {
                    --slideCount;
                    addSlide( slide );
                }
            }
        });

        if ( slideCount )
            opts.container.addClass('cycle-loading');
        

        function addSlide( slide ) {
            var curr;
            if ( opts.loader == 'wait' ) {
                slideArr.push( slide );
                if ( slideCount === 0 ) {
                    // #59; sort slides into original markup order
                    slideArr.sort( sorter );
                    addFn.apply( opts.API, [ slideArr, prepend ] );
                    opts.container.removeClass('cycle-loading');
                }
            }
            else {
                curr = $(opts.slides[opts.currSlide]);
                addFn.apply( opts.API, [ slide, prepend ] );
                curr.show();
                opts.container.removeClass('cycle-loading');
            }
        }

        function sorter(a, b) {
            return a.data('index') - b.data('index');
        }
    }
});

})(jQuery);

/*! pager plugin for Cycle2;  version: 20140415 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    pager:            '> .cycle-pager',
    pagerActiveClass: 'cycle-pager-active',
    pagerEvent:       'click.cycle',
    pagerEventBubble: undefined,
    pagerTemplate:    '<span>&bull;</span>'
});

$(document).on( 'cycle-bootstrap', function( e, opts, API ) {
    // add method to API
    API.buildPagerLink = buildPagerLink;
});

$(document).on( 'cycle-slide-added', function( e, opts, slideOpts, slideAdded ) {
    if ( opts.pager ) {
        opts.API.buildPagerLink ( opts, slideOpts, slideAdded );
        opts.API.page = page;
    }
});

$(document).on( 'cycle-slide-removed', function( e, opts, index, slideRemoved ) {
    if ( opts.pager ) {
        var pagers = opts.API.getComponent( 'pager' );
        pagers.each(function() {
            var pager = $(this);
            $( pager.children()[index] ).remove();
        });
    }
});

$(document).on( 'cycle-update-view', function( e, opts, slideOpts ) {
    var pagers;

    if ( opts.pager ) {
        pagers = opts.API.getComponent( 'pager' );
        pagers.each(function() {
           $(this).children().removeClass( opts.pagerActiveClass )
            .eq( opts.currSlide ).addClass( opts.pagerActiveClass );
        });
    }
});

$(document).on( 'cycle-destroyed', function( e, opts ) {
    var pager = opts.API.getComponent( 'pager' );

    if ( pager ) {
        pager.children().off( opts.pagerEvent ); // #202
        if ( opts.pagerTemplate )
            pager.empty();
    }
});

function buildPagerLink( opts, slideOpts, slide ) {
    var pagerLink;
    var pagers = opts.API.getComponent( 'pager' );
    pagers.each(function() {
        var pager = $(this);
        if ( slideOpts.pagerTemplate ) {
            var markup = opts.API.tmpl( slideOpts.pagerTemplate, slideOpts, opts, slide[0] );
            pagerLink = $( markup ).appendTo( pager );
        }
        else {
            pagerLink = pager.children().eq( opts.slideCount - 1 );
        }
        pagerLink.on( opts.pagerEvent, function(e) {
            if ( ! opts.pagerEventBubble )
                e.preventDefault();
            opts.API.page( pager, e.currentTarget);
        });
    });
}

function page( pager, target ) {
    /*jshint validthis:true */
    var opts = this.opts();
    if ( opts.busy && ! opts.manualTrump )
        return;

    var index = pager.children().index( target );
    var nextSlide = index;
    var fwd = opts.currSlide < nextSlide;
    if (opts.currSlide == nextSlide) {
        return; // no op, clicked pager for the currently displayed slide
    }
    opts.nextSlide = nextSlide;
    opts._tempFx = opts.pagerFx;
    opts.API.prepareTx( true, fwd );
    opts.API.trigger('cycle-pager-activated', [opts, pager, target ]);
}

})(jQuery);

/*! prevnext plugin for Cycle2;  version: 20140408 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    next:           '> .cycle-next',
    nextEvent:      'click.cycle',
    disabledClass:  'disabled',
    prev:           '> .cycle-prev',
    prevEvent:      'click.cycle',
    swipe:          false
});

$(document).on( 'cycle-initialized', function( e, opts ) {
    opts.API.getComponent( 'next' ).on( opts.nextEvent, function(e) {
        e.preventDefault();
        opts.API.next();
    });

    opts.API.getComponent( 'prev' ).on( opts.prevEvent, function(e) {
        e.preventDefault();
        opts.API.prev();
    });

    if ( opts.swipe ) {
        var nextEvent = opts.swipeVert ? 'swipeUp.cycle' : 'swipeLeft.cycle swipeleft.cycle';
        var prevEvent = opts.swipeVert ? 'swipeDown.cycle' : 'swipeRight.cycle swiperight.cycle';
        opts.container.on( nextEvent, function(e) {
            opts._tempFx = opts.swipeFx;
            opts.API.next();
        });
        opts.container.on( prevEvent, function() {
            opts._tempFx = opts.swipeFx;
            opts.API.prev();
        });
    }
});

$(document).on( 'cycle-update-view', function( e, opts, slideOpts, currSlide ) {
    if ( opts.allowWrap )
        return;

    var cls = opts.disabledClass;
    var next = opts.API.getComponent( 'next' );
    var prev = opts.API.getComponent( 'prev' );
    var prevBoundry = opts._prevBoundry || 0;
    var nextBoundry = (opts._nextBoundry !== undefined)?opts._nextBoundry:opts.slideCount - 1;

    if ( opts.currSlide == nextBoundry )
        next.addClass( cls ).prop( 'disabled', true );
    else
        next.removeClass( cls ).prop( 'disabled', false );

    if ( opts.currSlide === prevBoundry )
        prev.addClass( cls ).prop( 'disabled', true );
    else
        prev.removeClass( cls ).prop( 'disabled', false );
});


$(document).on( 'cycle-destroyed', function( e, opts ) {
    opts.API.getComponent( 'prev' ).off( opts.nextEvent );
    opts.API.getComponent( 'next' ).off( opts.prevEvent );
    opts.container.off( 'swipeleft.cycle swiperight.cycle swipeLeft.cycle swipeRight.cycle swipeUp.cycle swipeDown.cycle' );
});

})(jQuery);

/*! progressive loader plugin for Cycle2;  version: 20130315 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    progressive: false
});

$(document).on( 'cycle-pre-initialize', function( e, opts ) {
    if ( !opts.progressive )
        return;

    var API = opts.API;
    var nextFn = API.next;
    var prevFn = API.prev;
    var prepareTxFn = API.prepareTx;
    var type = $.type( opts.progressive );
    var slides, scriptEl;

    if ( type == 'array' ) {
        slides = opts.progressive;
    }
    else if ($.isFunction( opts.progressive ) ) {
        slides = opts.progressive( opts );
    }
    else if ( type == 'string' ) {
        scriptEl = $( opts.progressive );
        slides = $.trim( scriptEl.html() );
        if ( !slides )
            return;
        // is it json array?
        if ( /^(\[)/.test( slides ) ) {
            try {
                slides = $.parseJSON( slides );
            }
            catch(err) {
                API.log( 'error parsing progressive slides', err );
                return;
            }
        }
        else {
            // plain text, split on delimeter
            slides = slides.split( new RegExp( scriptEl.data('cycle-split') || '\n') );
            
            // #95; look for empty slide
            if ( ! slides[ slides.length - 1 ] )
                slides.pop();
        }
    }



    if ( prepareTxFn ) {
        API.prepareTx = function( manual, fwd ) {
            var index, slide;

            if ( manual || slides.length === 0 ) {
                prepareTxFn.apply( opts.API, [ manual, fwd ] );
                return;
            }

            if ( fwd && opts.currSlide == ( opts.slideCount-1) ) {
                slide = slides[ 0 ];
                slides = slides.slice( 1 );
                opts.container.one('cycle-slide-added', function(e, opts ) {
                    setTimeout(function() {
                        opts.API.advanceSlide( 1 );
                    },50);
                });
                opts.API.add( slide );
            }
            else if ( !fwd && opts.currSlide === 0 ) {
                index = slides.length-1;
                slide = slides[ index ];
                slides = slides.slice( 0, index );
                opts.container.one('cycle-slide-added', function(e, opts ) {
                    setTimeout(function() {
                        opts.currSlide = 1;
                        opts.API.advanceSlide( -1 );
                    },50);
                });
                opts.API.add( slide, true );
            }
            else {
                prepareTxFn.apply( opts.API, [ manual, fwd ] );
            }
        };
    }

    if ( nextFn ) {
        API.next = function() {
            var opts = this.opts();
            if ( slides.length && opts.currSlide == ( opts.slideCount - 1 ) ) {
                var slide = slides[ 0 ];
                slides = slides.slice( 1 );
                opts.container.one('cycle-slide-added', function(e, opts ) {
                    nextFn.apply( opts.API );
                    opts.container.removeClass('cycle-loading');
                });
                opts.container.addClass('cycle-loading');
                opts.API.add( slide );
            }
            else {
                nextFn.apply( opts.API );    
            }
        };
    }
    
    if ( prevFn ) {
        API.prev = function() {
            var opts = this.opts();
            if ( slides.length && opts.currSlide === 0 ) {
                var index = slides.length-1;
                var slide = slides[ index ];
                slides = slides.slice( 0, index );
                opts.container.one('cycle-slide-added', function(e, opts ) {
                    opts.currSlide = 1;
                    opts.API.advanceSlide( -1 );
                    opts.container.removeClass('cycle-loading');
                });
                opts.container.addClass('cycle-loading');
                opts.API.add( slide, true );
            }
            else {
                prevFn.apply( opts.API );
            }
        };
    }
});

})(jQuery);

/*! tmpl plugin for Cycle2;  version: 20121227 */
(function($) {
"use strict";

$.extend($.fn.cycle.defaults, {
    tmplRegex: '{{((.)?.*?)}}'
});

$.extend($.fn.cycle.API, {
    tmpl: function( str, opts /*, ... */) {
        var regex = new RegExp( opts.tmplRegex || $.fn.cycle.defaults.tmplRegex, 'g' );
        var args = $.makeArray( arguments );
        args.shift();
        return str.replace(regex, function(_, str) {
            var i, j, obj, prop, names = str.split('.');
            for (i=0; i < args.length; i++) {
                obj = args[i];
                if ( ! obj )
                    continue;
                if (names.length > 1) {
                    prop = obj;
                    for (j=0; j < names.length; j++) {
                        obj = prop;
                        prop = prop[ names[j] ] || str;
                    }
                } else {
                    prop = obj[str];
                }

                if ($.isFunction(prop))
                    return prop.apply(obj, args);
                if (prop !== undefined && prop !== null && prop != str)
                    return prop;
            }
            return str;
        });
    }
});    

})(jQuery);

// JavaScript Document
var _debug = false;
var _placeholderSupport = function() {
	var t = document.createElement("input");
	t.type = "text";
	return (typeof t.placeholder !== "undefined");
}();
 
window.onload = function() {
	var arrInputs = document.getElementsByTagName("input");
	var arrTextareas = document.getElementsByTagName("textarea");
	var combinedArray = [];
	for (var i = 0; i < arrInputs.length; i++)
		combinedArray.push(arrInputs[i]);
	for (var i = 0; i < arrTextareas.length; i++)
		combinedArray.push(arrTextareas[i]);
	for (var i = 0; i < combinedArray.length; i++) {
		var curInput = combinedArray[i];
		if (!curInput.type || curInput.type == "" || curInput.type == "text" || curInput.type == "textarea")
			HandlePlaceholder(curInput);
		else if (curInput.type == "password")
			ReplaceWithText(curInput);
	}

	if (!_placeholderSupport) {
		for (var i = 0; i < document.forms.length; i++) {
			var oForm = document.forms[i];
			if (oForm.attachEvent) {
				oForm.attachEvent("onsubmit", function() {
					PlaceholderFormSubmit(oForm);
				});
			}
			else if (oForm.addEventListener)
				oForm.addEventListener("submit", function() {
					PlaceholderFormSubmit(oForm);
				}, false);
		}
	}
};

function PlaceholderFormSubmit(oForm) {    
	for (var i = 0; i < oForm.elements.length; i++) {
		var curElement = oForm.elements[i];
		HandlePlaceholderItemSubmit(curElement);
	}
}

function HandlePlaceholderItemSubmit(element) {
	if (element.name) {
		var curPlaceholder = element.getAttribute("placeholder");
		if (curPlaceholder && curPlaceholder.length > 0 && element.value === curPlaceholder) {
			element.value = "";
			window.setTimeout(function() {
				element.value = curPlaceholder;
			}, 100);
		}
	}
}

function ReplaceWithText(oPasswordTextbox) {
	if (_placeholderSupport)
		return;
	var oTextbox = document.createElement("input");
	oTextbox.type = "text";
	oTextbox.id = oPasswordTextbox.id;
	oTextbox.name = oPasswordTextbox.name;
	//oTextbox.style = oPasswordTextbox.style;
	oTextbox.className = oPasswordTextbox.className;
	for (var i = 0; i < oPasswordTextbox.attributes.length; i++) {
		var curName = oPasswordTextbox.attributes.item(i).nodeName;
		var curValue = oPasswordTextbox.attributes.item(i).nodeValue;
		if (curName !== "type" && curName !== "name") {
			oTextbox.setAttribute(curName, curValue);
		}
	}
	oTextbox.originalTextbox = oPasswordTextbox;
	oPasswordTextbox.parentNode.replaceChild(oTextbox, oPasswordTextbox);
	HandlePlaceholder(oTextbox);
	if (!_placeholderSupport) {
		oPasswordTextbox.onblur = function() {
			if (this.dummyTextbox && this.value.length === 0) {
				this.parentNode.replaceChild(this.dummyTextbox, this);
			}
		};
	}
}

function HandlePlaceholder(oTextbox) {
	if (!_placeholderSupport) {
		var curPlaceholder = oTextbox.getAttribute("placeholder");
		if (curPlaceholder && curPlaceholder.length > 0) {
			Debug("Placeholder found for input box '" + oTextbox.name + "': " + curPlaceholder);
			oTextbox.value = curPlaceholder;
			oTextbox.setAttribute("old_color", oTextbox.style.color);
			oTextbox.style.color = "#c0c0c0";
			oTextbox.onfocus = function() {
				var _this = this;
				if (this.originalTextbox) {
					_this = this.originalTextbox;
					_this.dummyTextbox = this;
					this.parentNode.replaceChild(this.originalTextbox, this);
					_this.focus();
				}
				Debug("input box '" + _this.name + "' focus");
				_this.style.color = _this.getAttribute("old_color");
				if (_this.value === curPlaceholder)
					_this.value = "";
			};
			oTextbox.onblur = function() {
				var _this = this;
				Debug("input box '" + _this.name + "' blur");
				if (_this.value === "") {
					_this.style.color = "#c0c0c0";
					_this.value = curPlaceholder;
				}
			};
		}
		else {
			Debug("input box '" + oTextbox.name + "' does not have placeholder attribute");
		}
	}
	else {
		Debug("browser has native support for placeholder");
	}
}

function Debug(msg) {
	if (typeof _debug !== "undefined" && _debug) {
		var oConsole = document.getElementById("Console");
		if (!oConsole) {
			oConsole = document.createElement("div");
			oConsole.id = "Console";
			document.body.appendChild(oConsole);
		}
		oConsole.innerHTML += msg + "<br />";
	}
}	

/***********************************************
    Function:   Server Query
    Author:     Adam Lawrence
    Contact:    adam@adamlawrencedesign.com 
*************************************************/

function ServerRequest(url, type, data, callback)
{
    this.url = url;
    this.type = type;
    this.data = data;
    this.callback = callback;
    this.init();
}

ServerRequest.prototype.getRequest = function(url)
{
    var _this = this;

    $.ajax(
    {
        url: url, 
        type: 'GET',
        username: 'WebAPIPhotocreateUser',
        password: '@dvw3b@piu$3r',
        success: function(data)
        {
            _this.callback(data);
        }
    })
};

ServerRequest.prototype.postRequest = function(url, data)
{
    var _this = this;

    $.ajax(
    {
        url: url, 
        type: 'POST',
        username: 'WebAPIPhotocreateUser',
        password: '@dvw3b@piu$3r',
        data: data,
        success: function(data)
        {
            _this.callback(data);
        }
    });   
}

ServerRequest.prototype.putRequest = function(url, data)
{
    var _this = this;

    $.ajax(
    {
        url: url, 
        type: 'PUT',
        username: 'WebAPIPhotocreateUser',
        password: '@dvw3b@piu$3r',
        data: data,
        success: function(data)
        {
            _this.callback(data);
        }
    });   
}

ServerRequest.prototype.init = function()
{
    switch(this.type)
    {
        case 'GET':
            this.getRequest(this.url)
        break;

        case 'POST':
            this.postRequest(this.url, this.data)
        break;

        case 'PUT':
            this.putRequest(this.url, this.data)
        break;

    }
};

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

/***********************************************
	Function:	Create Packages
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function PackagesPage()
{
	this.init();
}

PackagesPage.prototype.init = function()
{
	var school = eval("[" + document.getElementById('hSchoolData').value + "]"),
		person = eval("[" + document.getElementById('hData').value + "]");

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
			
			template.find('.package_icon').attr('src','assets/img/icons/' + groupType + '.png');
			
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
		
	//*****************************************//		

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
			
			template.find('.package_icon').attr('src','assets/img/icons/sports.png');
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

};
/***********************************************
	Function:	Groups Page
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function GroupsPage()
{
	this.init();
}

GroupsPage.prototype.init = function()
{
	var schoolData, groupData, preOrderData, num, bannerImages, images,															
		loader, name, year, price, year, description, preview, pathway, pathway_0,						
		list_item, list, list_link, key; 								
	 
    schoolData  =  eval("[" + document.getElementById('hSchoolData').value + "]"); 							//   schoolData format[WebName,WebAddress,WebTown,Principal,CssStyle];
    bannerImages = eval("[" + document.getElementById('hBannerImages').value + "]");
	groupData  =  eval("[" + document.getElementById('hGroupData').value + "]"); 

	num 	= groupData.length;															   // get string length 	
	
	pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + groupData[0].ClientID + "/" + groupData[0].SubFolder + "/" + groupData[0].fileName;
	
	
	loader 	= $('.load_item');																   // div and span items 
	name	= $('.img_name');
	year 	= $('.img_year');
	price 	= $('.img_price');
	description = $('.img_description');
	preview = $('#img_preview');
	list 	= $('#img_list');
	phone_list 	= $('#img_phone_list');
	list_link 	= $('#img_list a');
	
	for( i = 0; i < num ; i++ ) {																// Create List main view	
		list_item =  "<li><a href=\"#\" data-link_ref=\"link_lg\" data-num=\"" + i + "\"><span>" + groupData[i].searchTag1.replace('?','\'') + "</span></a></li>";
		list.append(list_item);
	}
	
	for( i = 0; i < num ; i++ ) {																// Create phone view
		list_item =  "<option data-link_ref=\"link_sm\" data-num=\"" + i + "\"><span>" + groupData[i].searchTag1.replace('?','\'') + "</span></option>";
		phone_list.append(list_item);
	}
		
	setTimeout(function(){																			// Display first image	
		loader.fadeOut(800).css('opacity','0');
		$('.img_name').html(groupData[0].searchTag1.replace('?','\''));
		$('.img_year').html(groupData[0].dateOfPhotography);
		$('.img_price').html(groupData[0].unitPrice);
		$('.img_price').attr('data-price',groupData[0].unitPrice);
		$('.img_description').html(groupData[0].Description.replace('-',' ').replace('Album',' Album'));
		$('.img_price').attr('data-price',groupData[0].unitPrice);
		
		document.getElementById('hfValue').value = groupData[0].webClientAssetID; //passing value to hidden field -arlen
		document.getElementById('hfDescription').value = groupData[0].Description; //passing description to hidden field -arlen
		document.getElementById('hfUnitPrice').value = groupData[0].unitPrice; //passing unit price to hidden field - arlen	
		
		$('#cart_qty').val('1');																	// Reset Quantiy
		
		$('#productID').html(groupData[0].webClientAssetID)										// load cart items

		preview.hide('slide',800, function(){
			preview.attr('src',pathway_0).animate({opacity: 'toggle'}, 1000);						// Swing is the default show option work out how to add easing
			$('#main_wrapper').removeClass('opacity_0');
			$('#sec_wrapper').removeClass('opacity_0');
		});
		
		setTimeout(function(){
			$('#document').removeClass('no-event');
		},1600);
		
	},3000) 

	$('#img_list li a:first').addClass('selected_left');											// add selected to first

	$('#img_list li a').click(function(e){
		e.preventDefault();			 															// Stop jumping 
	});
	
	
	$('#nav_rt, #nav_lt, #img_list li a, #img_phone_list option').click(function(e){
		e.preventDefault();																						// Prevent Page skip
		$('#cart_qty').val('1');																				// Reset Quantiy
		loader.stop().fadeIn();
		
		function info_update(key){																				// Update Items
			$('.img_name').html(groupData[key].searchTag1.replace('?','\''));
			$('.img_year').html(groupData[key].dateOfPhotography);
			$('.img_price').html(groupData[key].unitPrice);
			$('.img_description').html(groupData[key].Description.replace('-',' ').replace('Album',' Album'));
			$('.img_price').attr('data-price',groupData[key].unitPrice);
	
			$('#cart_items').html(groupData[key].ProductID)													// load cart items
			pathway_0 = "https://advancedimage.com.au/lifebuyimages//" + groupData[key].ClientID + "/" + groupData[key].SubFolder + "/" + groupData[key].fileName;
		   
		    document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		    document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		    document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen
		    
			preview.fadeOut(600, function(){
				preview.attr('src',pathway_0).fadeIn(600);	
			});

		}
		
		var object_value = $(this).attr('data-link_ref');
		
		switch(object_value){
			
			case 'nav_lt':
					if ($('#img_list li a.selected_left').parent().is(':first-child')){
						
						$('#img_list li a.selected_left').removeClass('selected_left');
						var current = $('#img_list li a:last').addClass('selected_left');
						
						key   = current.attr('data-num');
						info_update(key);		
						
						return false
					}
					
					var place = $('#img_list li a.selected_left').parent().prev();
					
					$('#img_list li a.selected_left').removeClass('selected_left');
					
					var	next  = place.find('a').addClass('selected_left');
											
					key   = next.attr('data-num');
					info_update(key);
					
					document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		            document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		            document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen
		            
			break;
			
			case 'nav_rt':
					if ($('#img_list li a.selected_left').parent().is(':last-child')){
						
						$('#img_list li a.selected_left').removeClass('selected_left');
						var current = $('#img_list li a:first').addClass('selected_left');
						
						key   = current.attr('data-num');
						info_update(key);	
												
						return false
					}
					
					var place = $('#img_list li a.selected_left').parent().next();
					
					$('#img_list li a.selected_left').removeClass('selected_left');
					
					var	next  = place.find('a').addClass('selected_left');
						
					key   = next.attr('data-num');
					info_update(key);	
					
					document.getElementById('hfValue').value = groupData[key].webClientAssetID; //passing value to hidden field -arlen
		            document.getElementById('hfDescription').value = groupData[key].Description; //passing description to hidden field -arlen
		            document.getElementById('hfUnitPrice').value = groupData[key].unitPrice; //passing unit price to hidden field - arlen																	// Update Info
			break;
			
			case 'link_lg':
				
				$('#img_list li a').removeClass('selected_left');
				$(this).addClass('selected_left');
				
				var key = $(this).attr('data-num');
				info_update(key);
				
			break;
			
			case 'link_sm':
				
				var key = $(this).attr('data-num');
				info_update(key);
				
			break;
			
		}
		loader.fadeOut();
	});
	
	
	function preload() {																		// function to preload images | Leave till end of functions
		for (i = 0; i < num ; i++) {															// hack for google chrome
			var img = img + i;
			img_new = new Image();
			img_new.src = "https://advancedimage.com.au/lifebuyimages//" + groupData[i].ClientID + "/" + groupData[i].SubFolder + "/" + groupData[i].fileName;
			img_new_path = "https://advancedimage.com.au/lifebuyimages//" + groupData[i].ClientID + "/" + groupData[i].SubFolder + "/" + groupData[i].fileName;
			
			$('#img_preload').append("<img src=\"" + img_new_path + "\" alt=\"\" />");
			
		}
	}
	preload();	
	
	
	$('#cart_qty').on('change',function(){																	// change price
		var newPrice = $(this).val() * $('.img_price').attr('data-price');
		$('.img_price').html(newPrice);

	});
	
	$('.cart_add').click(function(){																	// Add to cart
		var qty = "Quantity:" + $('#cart_qty').val() + ";";
		var productID = "Product:" + $('#productID').html() + ";";
	});
	
	
	$(function(){
		var wrapper_h = $('main').outerHeight(),
			ntl_h = $('.title_ntl').outerHeight(),
			img_list_h = wrapper_h - ntl_h;
			
		$('#img_list').innerHeight(img_list_h + 'px').css('overflow','auto');
		
		console.log(wrapper_h);
	});
	
	$('#addCart').css('background-color','rgb(108, 173, 223)');
	
	$(function(){
		$('.scroll-pane').jScrollPane();
	});
};

/***********************************************
	Function:	Contact Validation
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function ContactValidation()
{
	this.count = 0;
	this.init();
}

ContactValidation.prototype.init = function()
{
	var _this = this;

	var contact_validation = {
				
				ClientInfo : eval("[" + document.getElementById('hSchoolData').value + "]"),
				UserInfo : eval("[" + document.getElementById('hFirstImgPortrait').value + "]"),
				
				// ================================================// 										Update form items  
				
				update_details : function(){
                      $('#PortalInfo').val(this.ClientInfo[0].ClientID);
                      $('#UserInfo').val(this.UserInfo[0].FirstName + ' ' + this.UserInfo[0].LastName + '; Class: ' + this.UserInfo[0].Folder );
					  console.log(this.ClientInfo[0].ClientID);
				},
				  
				// ================================================// 										Object Status  
			
				remove_status:function(event){	
					$('.input-icon').empty();																// Remove all spinners
					$(event).parent().removeClass('error').removeClass('focus').removeClass('valid');		// Remove Errors
					$(event).parent().find('.input-icon').empty().removeClass('icon-cross').removeClass('icon-checkmark2');	// Remove Valid
				},
				
				error_status:function(event){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(this).parent().removeClass('valid').addClass('error');
					$(this).parent().find('span').removeClass('icon-checkmark2').addClass('icon-cross');
				},
				
				error_status_obejct:function(object){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(object).parent().removeClass('valid').addClass('error');
					$(object).parent().find('span').removeClass('icon-checkmark2').addClass('icon-cross');
				},
				
				valid_status:function(event){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(this).parent().removeClass('error').addClass('valid');
					$(this).parent().find('span').removeClass('icon-cross').addClass('icon-checkmark2');
				},
				
				valid_status_object:function(object){
					var remove = contact_validation.remove_status.bind();
					remove();
	
					$(object).parent().removeClass('error').addClass('valid');
					$(object).parent().find('span').removeClass('icon-cross').addClass('icon-checkmark2');
				},
				
				spinner:function(event){
					var remove = this.remove_status.bind(event);
					remove(event);
					
					var focus_img = document.createElement('img');										// Create Image spinner
					focus_img.src = 'svg/loading/loader_grey.gif';
					
					$(event).parent().find('span').append(focus_img).attr('src','svg/loading/loader_grey.gif');
					$(event).parent().addClass('focus'); 
					
					setTimeout(function(){																		// Later add some server validation
						$(event).parent().find('span').empty();
					},2000);					
				},
				
				empty_value:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val();
					$(event).val() === '' ? error(event): valid(event);	
						
				},
				
				empty_check:function(event){
					var error = contact_validation.error_status.bind(event);
					$(event).val() === "" ? error(event) : "";													// Replacement for Error Status					
				},
				
				check_email:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val(),
						filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

					!filter.test(value) === true ? error(event): valid(event);

				},
				
				email_match:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val(),
						email = $('#email').val();
					
					if(value == ''){
						error(event);
						return false
					} else {
						if(value != email){
							error(event);
						} else {
							valid(event);
						};
					}
				},
				
				phone_check:function(event){
					var error = contact_validation.error_status.bind(event),
						valid = contact_validation.valid_status.bind(event),
						value = $(event).val().replace(/ |-/g,''),
						filter = /^\d{8}$|^\d{10}$/;

					!filter.test(value) === true ? error(event): valid(event);
				}						
	};
	
	contact_validation.update_details();
	
	$('input[type=text]').on('focus',function(){
		contact_validation.spinner(this)
	});
	
	$('input[type=text]').on('blur',function(){
		contact_validation.empty_check(this)
	});
	
	$('#name').on('blur',function(){
		contact_validation.empty_value(this);
	});
	
	$('#email').on('blur',function(){
		contact_validation.check_email(this);
	});
	
	$('#email_match').on('blur',function(){
		contact_validation.email_match(this);
	});
	
	$('#phone').on('blur',function(){
		contact_validation.phone_check(this);
	});
	
	$('#message').on('blur',function(){
		contact_validation.empty_value(this);
	});
	
	$('#submit').click(function(){
		//contact_validation.button_click(this);
		//console.log(this);
		
		var form = [0,0,0,0,0];
		var	total = 0,
			name = $('#name').val(),
			email = $('#email').val(),
			email_match = $('#email_match').val(),
			phone = $('#phone').val().replace(/ |-/g,''),
			contact_preference = $('#contact_preference').val(),
			message = $('#message').val(),
			phone_filter = /^\d{8}$|^\d{10}$/,
			email_filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		var error = contact_validation.error_status_obejct.bind(),
			valid = contact_validation.valid_status_object.bind();
		
		name != '' === false ? error('#name'):valid('#name');
		!email_filter.test(email) === true ? error('#email'):valid('#email');
		email_match != email  === true ? error('#email_match') : valid('#email_match') ;	
		!phone_filter.test(phone) === true ? error('#phone'): valid('#phone');	
		message === "" ? error('#message') : valid('#message');
			
		form[0] = (name != '') ? 1:0;
		form[1] = (email != 'Select') ? 1:0;
		form[2] = (email_match != email || email_match != '' ) ? 1:0; 
		form[3] = (!phone_filter.test(phone) != true) ? 1:0; 
		form[4] = (message != "") ? 1:0; 
		
		for(var i = 0; i < 5; i++){
			total += form[i];
		}
		
		if(total != 5){
			$('#form_errors').addClass('m_l_top').html('<b>Error:</b> There are errors with your form, please check valid fields are entered correctly')
			
			return false;
		} else {
			$('#form_errors').removeClass('m_l_top').html('');

			_this.count = _this.count + 1;
	        if(_this.count > 0)
	        {
	          $('#submit').css('pointer-events','none');
	        };	        

		}
		
	});
	
	
	/*
	
	// ================================================// 										binding example incase I forget  
	  
	Test:function(TestPortrait){
		console.log(TestPortrait);
	},
	TestBind:function(){
		var showDataVar = this.Test.bind(); 								// This is how you bind functions within your Object;
		showDataVar('Bind Successful');
	},
	
	// ================================================// 										How to create a time on typing 

	var typingTimer;                		//timer identifier									//setup before functions
	var doneTypingInterval = 5000;  		//time in ms, 5 second for example
	
	$('input').keyup(function(){																//on keyup, start the countdown
		clearTimeout(typingTimer);
		typingTimer = setTimeout(doneTyping, doneTypingInterval);
	});
	
	$('input').keydown(function(){															//on keydown, clear the countdown 
		clearTimeout(typingTimer);
	});
	
	function doneTyping () {																	//user is "finished typing," do something
		//do something
	}
	*/
};

/***********************************************
	Function:	Downloads Page
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function DownloadsPage()
{
	this.init();
};

DownloadsPage.prototype.init = function()
{
	var DownloadData, items;

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
								
								setAttributes(overlay, {'src':'assets/img/overlay.png','alt':'','class':'overlay'});
								$(overlay).css({'top': '35%','left': '25%', 'margin': '0','width':'50%'});
								
								$('.ProductThumb').parent().append(overlay);

						},
						
						//=================================================// 									 Buy All  
						
						BuyAll : function(){
							
								var FindLast = this.ServerData.length - 1,											// Correct to find the last entry
									PriceTotal = 0,
									UnitPrice = 8;						
								
								if(this.ServerData.length > 2 ){
									var PortraitLink = 'assets/img/icons/download_all.jpg';
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
														'; DstImage: https://advancedimage.com.au/subjectPortal/assets/img/icons/download_all.jpg; YearPhoto: AllPhotos; Cost: ' + total + '.00' +
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
										$(icon).attr('src','assets/img/icons/new_image.png');
									break;
										
									case 0 :
										$(icon).attr('src','assets/img/icons/free_image.png');
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
};

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
    
    setAttributes(overlay, {'src':'assets/img/overlay.png','alt':'','class':'overlay'});
    $(overlay).css({'top': '35%','left': '25%', 'margin': '0','width':'50%','pointer-events':'none'});
    $(el).append(overlay);
};

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

	console.log('links are now added', this.urlInfo);

};

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
	$('.img_banner').empty().append("<img class=\"full\" src=\"assets/img/sports/sports_hands.jpg\" alt=\"\" />");
	$('body').css('background-image','url(assets/img/sports/bg_crowd.jpg)');
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

/***********************************************
	Function:	Page Info
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function PageInfo(schoolData, bannerData, portraitData, groupData)
{
	this.schoolData = schoolData;
	this.bannerData = bannerData;
	this.portraitData = portraitData;
	this.groupData = groupData;
	this.init();
};

PageInfo.prototype.siblingCheck = function()
{
	var isSibling = this.portraitData[0].ImageIsPortrait,
		LastName = this.portraitData[0].LastName;
	
	if(isSibling == 'False')
	{
		$('.group_img').parent().addClass('hidden');
		$('aside h3').html(LastName + ' Family');

		$('.main_wrapper h2').html('Our Photos');
		$('.name_full').html('The ' + LastName + ' Family');
		$('title').html(LastName + ' Family | Photo Portal');
		$('.name_given').html('The ' + LastName + ' Family');	
	};
};

PageInfo.prototype.bannerInit = function()
{
	var img_banner = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/" + this.bannerData[0]; //[0].img_0;							

	var objCount=0;
	for(_obj in this.bannerData[0]){ objCount++};
	
	for( var i = 0; i < objCount ; i = i + 1){		// Hide div's
		var image = this.bannerData[0][i];
			
		if( image != ''){
			var bannerPathway = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/" + image   ;
			var imageObject = "<img class=\"full border_ntl \" src=\"" + bannerPathway + "\"" + " alt=\"\" style=\"padding:.2em\" />";
			$('.img_banner').append(imageObject);
		}
		
	}
	
	if ($('.img_banner').html() == ''){
		$('.img_banner').append("<img class=\"full\" src=\"assets/img/generic_banner.png\" alt=\"\" />");
	};	
};

PageInfo.prototype.updateClientDetails = function()
{
	var logoPathway = "https://advancedimage.com.au/lifebuyimages/" + this.schoolData[0].ClientID + "/Assets/PublicPortal/Logo.png",
		name_school = this.schoolData[0].WebName.replace('?','\'');
		
	$('.school_logo').attr('src',logoPathway);
	$('.school_name').html(name_school);
	
	var link = document.createElement('link');
	link.type = 'image/x-icon';
	link.rel = 'shortcut icon';
	link.href = logoPathway;
	document.getElementsByTagName('head')[0].appendChild(link);			
};

PageInfo.prototype.updateIndividualDetails = function()
{
	var name_given = this.portraitData[0].FirstName.replace('?','\''),
		name_surname = this.portraitData[0].LastName.replace('?','\''),
		name_full = name_given + " " + name_surname,
		img_latest = "https://advancedimage.com.au/lifebuyimages//" + this.portraitData[0].DstImage,
		photo_year = this.portraitData[0].YearPhoto;
	
	$('.name_full').html(name_full);
	$('.name_given').html(name_given);
	$('.img_latest').attr('src',img_latest);
	$('.img_latest_year').html(this.portraitData[0].YearPhoto);
	$('title').html(name_full + ' | My Photos' );
	
	if(typeof this.groupData[0] === 'undefined')
	{
		$('.group_img').parent().addClass('hidden');
	};	
};

PageInfo.prototype.init = function()
{
	this.updateIndividualDetails();
	this.updateClientDetails();
	this.bannerInit();
	this.siblingCheck();
};

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

/***********************************************
	Function:	Menu Controllers
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/

function MenuControllers()
{
	this.init();
}

MenuControllers.prototype.init = function()
{
	var menu_lg		 = $("#menu_lg"),															//======= Slide Toggle ========//
		menu_help	 = $("#menu_help_lg"),
		menu_preview = $("#menu_preview"),
		menu_toggle  = $('.menu_lg_toggle'),
		menu_toggle_h= $('.menu_help_toggle'),
		nav_li		 = $('nav li');
	
	function slide_toggle(x,y) {																//======= menu Show Hide ========//
		y.click(function(){
			$('html, body').animate({scrollTop: 0},800);
			x.slideToggle();
		})
	}
	
	slide_toggle(menu_lg, menu_toggle);
	slide_toggle(menu_help, menu_toggle_h);
	
	$('.show_expand').click(function(){
		$(this).next(
			$('.show_area').slideDown()
		)
	});
	
	$('.show_collapse').click(function(){
		$('.show_area').slideUp();
	});
	
	var additional_info = {
		
			show : function($item){
				
				$('html, body').animate({scrollTop: 0},800);
				$('#additional_content .absolute_vert_center').removeClass('opacity_0');
				$('#additional_wrap').empty();
				
				var target = 'additional/' + $($item).attr('data-link') + '.html';
				var height = $(window).height() + 'px';
				
				$('#additional_wrap').load(target, function(){
					$('#additional_content').slideDown();
					$('#additional_content .absolute_vert_center').addClass('opacity_0');
				});
			},
			
			hide : function($item){
				var parent = $($item).parents('div');
				parent.slideUp(800);
				//$('html, body').animate({scrollTop: 0},800);
			}
	};
	
	$('.additional_link').click(function(event){
		event.preventDefault();
		additional_info.show(this);
	});
	
	$('.collapse').click(function(){
		additional_info.hide(this);
	});
};


/***********************************************
	Function:	IE WARNING
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/
if(navigator.appVersion.indexOf("MSIE 8.")!=-1 || navigator.appVersion.indexOf("MSIE 7.")!=-1)
alert("Notice! This website does not support versions of Internet Explorer. We recommend using Firefox, Google Chrome, Safari or Opera. Sorry for the inconvenience");
/***********************************************
	Function:	GOOGLE ANALYTICS
	Author: 	Adam Lawrence
	Contact: 	me@adamlawrence.com.au
*************************************************/
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-55035205-1', 'auto');
ga('send', 'pageview');
