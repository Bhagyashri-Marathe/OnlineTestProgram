<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Instructions</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(function(){
        $("#studnav").load("student_sidenav.jsp");
    });
</script>

<!-- THIS RESTRICTS QUESTION WINDOW PAGE TO COME BACK AT TERMS WINDOW PAGE -->
   <script src="https://code.jquery.com/jquery-1.7.1.min.js" integrity="sha256-iBcUE/x23aI6syuqF7EeT/+JFBxjPs5zeFJEXxumwb0=" crossorigin="anonymous"></script>
<script type="text/javascript">
  function preventBack(){

    window.history.forward();

  }
  setTimeout("preventBack()",0);
    window.onunload=function(){null};

</script>

    <link rel="stylesheet" href="css/student_instructions.css">
   
</head>
<body>
<div id="studnav"></div>
    <div class="head d-md-flex terms">
        <div class="overflow-auto p-3 mb-3 mb-md-0 mr-md-3 bg-light" style="max-width: 1000px; max-height: 500px;">
         
          <h2><strong>System Requirements for online exam:</strong></h2>
          <p>1. Personal laptop or desktop computer in working condition (You can use Windows 7 and above)
          <p>2. Internet connection of at least 1 Mbps</p>    
          <p>3. The latest version of Google Chrome internet browser (preinstalled)</p>  
          <p>4. Test your computer or laptop before the exam to ensure that it is working well, processing speed is good</p>   
          <p>Please note that your exam may get terminated if you try to open any other window on your computer during the exam process Do not press any keyboard key onda the examination is started. This will LOCK your examination</p>   
  
          <h2><strong>General Instructions:</strong></h2>
          <p>1. Candidate needs to complete the examination in the mentioned time only Extension in time is not allowed</p> 
          <p>2. To go to a question, click on the question number in the question palette on the right-hand side of the screen</p>
          <p>3. Click one of the answer option button to select your answer</p>
          <p>4. To change an answer, simply click the desired option button</p>
          <p>5. Click on 'SAVE & NEXT to save the answer before moving to the next question</p>
          <p>6. When the time left becomes 0, then your assessment will be submitted by default, and you will not be able to make any changes</p>
          <p>7. If there is a power failure or network problem while the candidate is attempting the exam, Candidate can log in again after the problem is resolved and continue the examination Candidate will be allocated the remaining time and the remaining un-attempted questions</p>
          </div>
      </div>
    
    <div class="tacbox">
        <input class="form-check-input" type="checkbox" id="terms_and_conditions"
        value="1" onclick="terms_changed(this)" id="invalidCheck" required>
        <label for="checkbox">I have read and understood  the instructions.</label>
      </div>
      <button class="btn btn-primary" 
      id="submit_button" onclick="location.href='student_examWindow.jsp'" type="submit" style="font-size: 20px" disabled >Start Exam</button>

      <script src="js/student_instructions.js"></script>
</body>
<link rel="stylesheet" href="terms&condition.css">
</html>