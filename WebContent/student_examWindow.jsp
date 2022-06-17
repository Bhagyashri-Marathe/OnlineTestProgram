<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.model.question"%>
<%@page import="com.dao.examDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.questionDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Exam Window</title>

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="css/examWindow.css">
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://code.jquery.com/jquery-1.7.1.min.js" integrity="sha256-iBcUE/x23aI6syuqF7EeT/+JFBxjPs5zeFJEXxumwb0=" crossorigin="anonymous"></script>
<script type="text/javascript">


  function preventBack(){

    window.history.forward();

  }
  setTimeout("preventBack()",0);
    window.onunload=function(){null};

</script>
<script>
document.addEventListener('visibilitychange',function(){
	document.title=document.visibilityState;
	var state=document.visibilityState;
	if(state==='hidden'){
		alert("You are switching tabs")
	}
})
</script>

<!--  -->
<!-- <script type="text/javascript">

let video=document.getElementById("video")
let model;

const setupCamera = () => {
    navigator.mediaDevices.getUserMedia({
        video:{width:600 , height:400},
    })
    .then((stream) => {
        video.srcObject=stream;
    });
};

const detectFaces = async() => {
    const prediction=await model.estimateFaces(video,false);
    console.log('inside detectFaces')
    console.log(prediction)
    console.log(prediction.length)
    if(prediction.length>1){
        alert("Multiple faces found")
    }

}
setupCamera();
// video.addEventListener("loadeddata",async () => {
//     console.log('inside function')
//     model=await blazeface.load();
//     setInterval(detectFaces(),1000)
// });

video.addEventListener("loadeddata",setInterval(async () => {
    console.log('inside function')
    model=await blazeface.load();
    detectFaces()
}),1000);


</script> -->
<!--  -->

 
<script>
  //  var message = document.querySelector('#message');

var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

var grammar = '#JSGF V1.0;'

var recognition = new SpeechRecognition();
var speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
recognition.lang = 'en-US';
recognition.interimResults = false;

recognition.onresult = function(event) {
    var last = event.results.length - 1;
    var command = event.results[last][0].transcript;
  //  message.textContent = 'Voice Input: ' + command + '.';

    // if(command.toLowerCase() === 'select steve'){
    //     document.querySelector('#chkSteve').checked = true;
    // }
    // else if (command.toLowerCase() === 'select tony'){
    //     document.querySelector('#chkTony').checked = true;
    // }
    // else if (command.toLowerCase() === 'select bruce'){
    //     document.querySelector('#chkBruce').checked = true;
    // }
    // else if (command.toLowerCase() === 'select nick'){
    //     document.querySelector('#chkNick').checked = true;
    // }   

    if(command!==null){
/*         alert("It seems you are talking...This will lead to registering Malpractice case")
 */    
	 Swal.fire({
		//  position: 'top-end',
				icon: 'error',
				title: 'It seems you are talking...This will lead to registering Malpractice case.',
				showConfirmButton: false,
				timer: 1500,
			})
    }
};

recognition.onspeechend = function() {
    recognition.stop();
};

recognition.onerror = function(event) {
  //  message.textContent = 'Error occurred in recognition: ' + event.error;
}        

// document.querySelector('#btnGiveCommand').addEventListener('click', function(){
//     recognition.start();

// });

// document.addEventListener('DOMContentLoaded', function(){
//     recognition.start();

// });

document.addEventListener('DOMContentLoaded',setInterval(function(){
    recognition.start();
}),1000)

</script>



</head>
<body>


	
<%
	String course=(String)session.getAttribute("loginUserCourse");
	int examId=(int)session.getAttribute("loginUserExamId");
	System.out.println(examId);
	List<question> qlist=new LinkedList<question>();
	int tquestions=0;
	examDao ed=new examDao();
	ResultSet rs=ed.getExamQuestions(examId);
	if(rs.next())
	{
		System.out.println("hello");
		tquestions=rs.getInt(1);
	}
	System.out.println(" total questions : "+tquestions);
	int cnt=0;
	questionDao qd=new questionDao();
	rs=qd.exam_questions(course);
	while(rs.next())
	{
		cnt++;
		if(cnt<=tquestions)
		{
			System.out.println("hello");
			question qs=new question(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
			qlist.add(qs);
		}
		//System.out.println("cnt : "+cnt);
		request.setAttribute("examQuestions", qlist);
	}
%>
<input type="hidden" value="<%=tquestions%>" id="tot">
	<nav class="navbar   bg-dark">
        <b class="navbar-brand" href="#">TechnoGenix</b>
        <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->
       
          <ul class="navbar-nav">
           
            <li class="nav-item">
           <p id="time"><%=tquestions %>:00</p>
            </li>
         
          </ul>
     
      </nav>
     
      <div class="mainbox inline">  <!-- mainbox is box which contains question and options it is used to decide size and specifiy border of box-->
       	<c:if test="${requestScope.message !=null }">
		NOTE : ${message}	
		</c:if>
		<c:if test="${requestScope.examQuestions!=null and not empty requestScope.examQuestions }">
		<form method="post" id="myForm">
		<c:forEach items="${requestScope.examQuestions}" var="cl" varStatus="loopCounter">
       <div class="grid  tabcontent " id="content${loopCounter.count }">  <!-- tab content class and content+var is must for every question div -->
       	<!-- question box code -->
      	<input type="hidden" value="${cl.quesId}" name="question${loopCounter.count}_id">	
        <div class="qnumber">  <!--qnumber used for showing question number -->
          <p>question ${loopCounter.count}</p>
        </div>
      <h4>${cl.questionText }</h4>
      <div class="options" >   <!--option class is used for margins to set options at correct position-->
      <span><input type="radio" name="question${loopCounter.count }_option" value="1" required="required"></span></span><h4>${cl.opt1}</h4>
       <span><input type="radio" name="question${loopCounter.count }_option" value="2" required="required"></span><h4>${cl.opt2 }</h4>
       <span><input type="radio" name="question${loopCounter.count }_option" value="3" required="required"></span> <h4>${cl.opt3 }</h4>
       <span><input type="radio" name="question${loopCounter.count }_option" value="4" required="required"></span> <h4>${cl.opt4}</h4>
      </div>
    </div>
    </c:forEach>
    </form>
      </c:if>
      <c:if
		test="${requestScope.examQuestions==null and
empty requestScope.examQuestions }">
<br><br><br>
		<center><label style="color: white;font-size: 30px;">No Result Found...!!</label></center>
		<center><object data="images/traffic-u-turn.svg" width="400" height="400" " ></object></center>
			
	</c:if>
    
    </div>

    
     <!-- camera code -->

     <div class="container inline">
      <div class="row">
        <div class="col-lg-12" style="padding-left: 0px; padding-bottom: 0px;">
          
              <div class="booth">
                <video id="video" width="153%"
                  height="20%" autoplay >
                </video>
            </div>
        </div>
      </div>
    </div>
<script type="text/javascript">
	let video=document.getElementById("video")
	let model;

	const setupCamera = () => {
	    navigator.mediaDevices.getUserMedia({
	        video:{width:600 , height:400},
	    })
	    .then((stream) => {
	        video.srcObject=stream;
	    });
	};

	const detectFaces = async() => {
	    const prediction=await model.estimateFaces(video,false);
	    console.log('inside detectFaces')
	    console.log(prediction)
	    console.log(prediction.length)
	    if(prediction.length>1){
	        alert("Multiple faces found")
	    }

	}
	setupCamera();
	// video.addEventListener("loadeddata",async () => {
//	     console.log('inside function')
//	     model=await blazeface.load();
//	     setInterval(detectFaces(),1000)
	// });

	video.addEventListener("loadeddata",setInterval(async () => {
	    console.log('inside function')
	    model=await blazeface.load();
	    detectFaces()
	}),1000);
</script>	
  <!-- question Box Code   -->
  <div class="quebox">
    <div class="row">
        <div class="col-lg-12 btn-line">
          <nav class="multiTabs">
            <div class="row">
              <div class="col-lg-12 button-line">
              	<%
              		int i=2;
               		for(i=1;i<=tquestions;i++)
               		{
              	%>
                <a class="quebox-buttons but1"  href="javascript:void(0)" data-trigger='content<%=i%>'><%=i %></a>
                <%
                		if(i%5==0)
                		{
                %>
                		<br><br>
                <%
                		}
               		}
                %>
         </div>
         </div>
      
      
 
          </nav>
           
        </div>

    </div>
</div>
      <!-- BUTTON DIV -->
    <div class="next-prev">
      <button onclick="showPrev()" class="next-prev-button"> Show Prev</button>
      <button onclick="showNext()" class="next-prev-button" > Save & Next</button>
      <button type="button" class="end-exam" id="end-exam" onclick="submit()"> End Exam</button>

    </div>
    <!-- proctored By Examiner DIV -->

    <div class="animate-flicker">You are proctored by invigilator!
   
    </div>

<!-- <script type="js/video.js"></script>
 -->      <script src="js/countdown.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/blazeface"></script>
</body>
</html>