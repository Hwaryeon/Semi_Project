

var didScroll;
var lastScrollTop = 0; 
var delta = 5;
var navbarHeight = $('headr-wrap').outerHeight();

var st = document.getElementById("headr-wrap");

$(window).scroll(function(event){ didScroll = true;

});

setInterval(function() { if (didScroll) { hasScrolled(); didScroll = false; } 
}, 250); 

function hasScrolled() { var st = $(this).scrollTop(); 
if(Math.abs(lastScrollTop - st) <= delta) return; 
if (st > lastScrollTop && st > navbarHeight){ 
	// Scroll Down 
	 $('.headr-wrap').hide();
	} else { 
		// Scroll Up
		if(st + $(window).height() < $(document).height()) {
			 $('.headr-wrap').show();
		}
	} 
lastScrollTop = st;

}

