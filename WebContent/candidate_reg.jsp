
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | candidate Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
        $(function(){
            $("#header").load("sidenav.html");
          
        });
    </script>

     <link rel="stylesheet" href="css/form.css">
     
</head>
<body>
 <div id="header"></div>
 <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h2 class="title">Registration Form</h2>
        <%
        	if(!session.isNew())
        	{
        		String reg_msg=(String)session.getAttribute("regmsg");
        		String success_msg=(String)session.getAttribute("success");
        		if(reg_msg!=null)
        		{
        %>
        			<div class="alert" style="padding: 20px;background-color: #f44336; color: white; font-size: 15px;">
  								<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<strong style="22px;"><%=reg_msg %></strong> 
							</div>
		<% 	
        		}
        		if(success_msg!=null)
        		{
        %>
        			<div class="alert" style="padding: 20px;background-color: #04AA6D; color: white; font-size: 15px;">
						<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong style="22px;"	><%=success_msg %></strong> 
					</div>
		<%
		
        		}
        	}
        	session.invalidate();
        %>
        	
        
        <form class="row g-3 needs-validation" action="candidate_regController" method="post" novalidate >
            <div class="col-md-6">
              <label for="validationCustom01" class="form-label">First name</label>
              <input type="text" class="form-control " id="validationCustom01" name="fname" placeholder="First Name" required style="font-size: 18px"  >
              <div class="valid-feedback" style="font-size: 18px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom02" class="form-label">Last name</label>
              <input type="text" class="form-control" id="validationCustom02" name="lname" placeholder="Last Name" required style="font-size: 18px" >
              <div class="valid-feedback" style="font-size: 18px">
                Looks good!
              </div>
            </div>
           
            <div class="col-md-6">
              <label for="validationCustom03" class="form-label">Date Of Birth</label>
              <input type="date" class="form-control" id="validationCustom03" name="dob" required style="font-size: 18px" >
              <div class="invalid-feedback" style="font-size: 18px">
                Please provide a Date Of Birth
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label">Course</label>
              <select class="form-select" id="validationCustom04" name="course" required style="font-size: 18px" >
                <option selected disabled value="">Choose...</option>
                <option>Web_Devlopment</option>
                <option>DataBase</option>
                <option>Java</option>
              </select>
              <div class="invalid-feedback" style="font-size: 18px">
                Please select a Course.
              </div>
            </div>
            <div class="col-md-6">
                <label for="validationCustom02" class="form-label">Email</label>
                <input type="email" class="form-control" id="validationCustom02" name="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required required style="font-size: 18px" >
                <div class="valid-feedback" style="font-size: 18px">
                  Looks good!
                </div>
              </div>
            <div class="col-md-6">
              <label for="validationCustom05" class="form-label">Phone No</label>
              <input type="text" class="form-control" id="validationCustom05" name="mobno" pattern="[789][0-9]{9}" required style="font-size: 18px" >
              <div class="invalid-feedback" style="font-size: 18px">
                Please provide a Phone Number.
              </div>
            </div>
            <div class="col-12">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required style="font-size: 18px"  >
                <label class="form-check-label " for="invalidCheck">
                  Agree to terms and conditions
                </label>
                <div class="invalid-feedback" style="font-size: 18px">
                  You must agree before submitting.
                </div>
              </div>
            </div>
            <div class="col-12">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" >Submit form</button>
            </div>
          </form>
       
     
        </div>
        </div>
        </div>
        </div>
        
<script src="js/candidate_reg.js"></script>        

</body>
</html>