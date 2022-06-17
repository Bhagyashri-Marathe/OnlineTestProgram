/**
 * 
 */
// const stringMinutes=60;
// let time =stringMinutes*60;

// const countdown1=document.getElementById('countdown');

// setInterval(updateCountdown, 1000);
// function updateCountdown(){
//     const minutes= Math.floor(time/60);
//     let seconds= time%60;

//     countdown1.innerHTML= ${minutes}: ${seconds};
//     time--;
// }



//TIMER JS
var dtimer=document.getElementById("tot").value;
    var fiveMinutes = dtimer*60;
var display = document.getElementById('time');
var myTimer;

function startTime(duration, display) {
    var start = Date.now(),
        diff,
        minutes,
        seconds;

    function timer() {
        diff = duration - (((Date.now() - start) / 1000) | 0);
        minutes = (diff / 60) | 0;
        seconds = (diff % 60) | 0;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
        display.textContent = minutes + ":" + seconds;
        if (diff <= 0) {
            display.textContent = "TIME IS UP!";
            autoClick();
            clearInterval(myTimer);
        }
    };
    timer();
    myTimer = setInterval(timer, 1000);
}
window.onload = function() {
    startTime(fiveMinutes, display);
};

var mainNo;
function setval(no){
   mainNo=no;
}


//NUMBER OPENS QUESTION DIV
// var currentTab = 0;
$("#content1").show();

$(document).on('click', 'div.button-line>a',
function(){
    var TabId = $(this).attr('data-trigger');
    $('div#'+TabId+' ').show();
     
    console.log("Current Tab: " + TabId);
   
    currentTab = parseInt(TabId.replace("content", ""))-1;
    setval(currentTab);
    endExam();
    $('.tabcontent:not(#'+TabId+')').hide()

});


//NEXT PRIVIOUS BUTTON JS 
var currentTab = 0;
function showDiv()
{
  $(".grid").hide();
  $(".grid:eq("+ currentTab +")").show();
  setval(currentTab);
  endExam();
 
}
showDiv()


function showNext()
{
if(currentTab== $(".grid").length-1)
{
  currentTab = 0;
  setval(currentTab);
  endExam();
}
else {
  currentTab ++;
  setval(currentTab);
  endExam();
}
showDiv();

}


function showPrev()
{
if (currentTab == 0)
{
  currentTab= $(".grid").length-1
}
else {
  currentTab --;
  setval(currentTab);
  endExam();
}
showDiv();
 setval(currentTab);
 endExam();
}

// END EXAM JS

var tquestion=document.getElementById("tot").value;
console.log(tquestion);
function endExam(){    
	            
  if(mainNo==(tquestion-1)){                      /*CHANGE HERE THE NUMBER TO TOTAL NUMBER OF QUESTION-1 TO SHOW END EXAM BUTTON*/                             
    $('.end-exam').show();
    
  }
  else{
    $('.end-exam').hide();
  
  }
  }

  // automatic submit exam after time end feature
 function autoClick(){
    
    let button = document.querySelector("#end-exam");
  
      button.click();
  }

function submit() {
	 console.log("hello..");
	
	 	document.getElementById("myForm").action="./exam_WindowController";
		document.getElementById("myForm").method="post";
		document.getElementById("myForm").submit();
		
		

}


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


// NEW TAB ALERT
/*window.top.onblur = function() { alert("Dont Open Other Window") }
*/
 function preventBack(){

    window.history.forward();

  }
  setTimeout("preventBack()",0);
    window.onunload=function(){null};
