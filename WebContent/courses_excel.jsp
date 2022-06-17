<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | choose Course</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> 
<script src="https://kit.fontawesome.com/8bb89487d3.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/form.css">
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
					<%
						if(!session.isNew())
						{
							String excel_msg=(String)session.getAttribute("excel_success");
							if(excel_msg!=null)
							{
					%>
								<div class="alert" style="padding: 20px;background-color: #04AA6D; color: white; font-size: 15px;">
									<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
									<strong><%=excel_msg %></strong> 
								</div>
					<% 
							}
					
						
						}
						session.invalidate();
					%>
					
 <form action="excel_question.jsp" method="post">
					<div class="col-md-12">
							<label for="validationCustom04" class="form-label">Course</label>
							<select class="form-select" name="course" id="validationCustom04"
								required style="font-size: 18px" >

								 <option selected disabled value="">Choose...</option>
								<option>Web_Devlopment</option>
								<option>DataBase</option>
								<option>Java</option>
							</select>
							<div class="invalid-feedback" style="font-size: 18px" >Please select a Course.</div>
						</div> 
						<br><br><br><br><br><br>
						<div class="col-12">
							<button class="btn btn-primary btn-lg" type="submit" id="submit" style="font-size: 20px">Continue</button>
						</div>
					</form>
					</div>
					</div>
					</div>
					</div>
					<script src="js/excel_question.js"></script>
</body>
</html>