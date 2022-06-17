<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Question Bank</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


     <link rel="stylesheet" href="css/form.css">

      <script type="text/javascript">     
      function isNumber(evt) {
              evt = (evt) ? evt : window.event;
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if ( (charCode < 49 || charCode > 52) ) {
                  return false;
              }
              return true;
          }
      </script>
     
      <script>
        $(function(){
            $("#header").load("sidenav.html");
          
        });
    </script>
      
</head>
<body>

 <div id="header"></div>
	 <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h2 class="title">Create Question Form</h2>
        <%
        	if(!session.isNew())
        	{
        		String question_msg=(String)session.getAttribute("question_success");
        		if(question_msg!=null)
        		{
        %>
        			<div class="alert" style="padding: 20px;background-color: #04AA6D; color: white; font-size: 15px;">
						<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong><%=question_msg %></strong> 
					</div>
		<% 
        		}

        	}
        	session.invalidate();
        %>
        		
		
        <form class="row g-3 needs-validation" action="question_bankController" method="post" novalidate>
          <div class="col-md-12">
            <label for="validationCustom04" class="form-label">Course</label>
            <select class="form-select" name="course" id="validationCustom04" required  style="font-size: 18px">
              <option selected disabled value="">Choose...</option>
              <option>Web_Devlopment</option>
              <option>DataBase</option>
              <option>Java</option>
            </select>
            <div class="invalid-feedback"  style="font-size: 18px">
              Please select a Course.
            </div>
          </div>
          <!--    <div class="col-md-12">
              <label for="validationCustom01" class="form-label">Question Number:</label>
              <input type="text" class="form-control textfield" id="validationCustom01" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback">
                Looks good!
              </div>
            </div>-->
            <div class="col-md-12">
              <label for="validationCustom02" class="form-label">Question:</label>
              <input type="text" class="form-control" id="validationCustom02" value="" name="question" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px" >
                Looks good!
              </div>
            </div>
           
            <div class="col-md-12">
              <label for="validationCustom02" class="form-label">Option 1:</label>
              <input type="text" class="form-control" id="validationCustom02" value="" name="opt1" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px">
                Looks good!
              </div>
            </div>
          
            <div class="col-md-12">
              <label for="validationCustom02" class="form-label">Option 2:</label>
              <input type="text" class="form-control" id="validationCustom02" value="" name="opt2" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px">
                Looks good!
              </div>
            </div>
            <div class="col-md-12">
              <label for="validationCustom02" class="form-label">Option 3:</label>
              <input type="text" class="form-control" id="validationCustom02" value="" name="opt3" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px">
                Looks good!
              </div>
            </div>
            <div class="col-md-12">
              <label for="validationCustom02" class="form-label">Option 4</label>
              <input type="text" class="form-control" id="validationCustom02" value="" name="opt4" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px">
                Looks good!
              </div>
            </div>
             <div class="col-md-12">
              <label for="validationCustom01" class="form-label">Correct Option Number:</label>
              <input type="text" name="correct" class="form-control textfield" id="validationCustom01" maxlength="1" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required  style="font-size: 18px">
              <div class="valid-feedback"  style="font-size: 18px">
                Looks good!
              </div>
            </div>
            <div class="col-6">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" >Submit form</button>
            </div>
            <div class="col-6">
              <button class="btn btn-primary btn-lg" type="reset" style="font-size: 20px" >Reset</button>
            </div>
          </form>
       
       
        </div>
        </div>
        </div>
        </div>
        
<script src="js/question_bank.js"></script> 
</body>
</html>