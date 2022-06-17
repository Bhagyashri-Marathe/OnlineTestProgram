/**
 * 
 */

//Disable Right Click
document.addEventListener('contextmenu', event => event.preventDefault());

//disable refresh F5 BUTTON
function disableF5(e) { if ((e.which || e.keyCode) == 116) e.preventDefault(); };
// To disable f5
    /* jQuery < 1.7 */
$(document).bind("keydown", disableF5);
/* OR jQuery >= 1.7 */
$(document).on("keydown", disableF5);

//DISABLE BACK BUTTON OF BROWSER [FIREFOX]

history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
});




 function preventBack(){

    window.history.forward();

  }
  setTimeout("preventBack()",0);
    window.onunload=function(){null};