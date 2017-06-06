/* Change Background-image */

var ua = navigator.userAgent;

function wiidsiAdjust(linkpass) {
	if(ua.indexOf("Nintendo DSi")!=-1){ // for DSi
		document.write (
		'<LINK REL="stylesheet" TYPE="text/css" HREF="' + linkpass + 'css/dsi_adjust.css">'
		);
	} else if(ua.indexOf("Nintendo Wii")!=-1){ // for Wii
		document.write (
		'<LINK REL="stylesheet" TYPE="text/css" HREF="' + linkpass + 'css/wii_adjust.css">'
		);
	} else{ // for other UA
		// no script
	}
}
