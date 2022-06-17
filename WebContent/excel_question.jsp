<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Excel Questions</title>
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
<%
		String course=request.getParameter("course");
		System.out.println("hello "+course);
		session.setAttribute("courseTable", course);
		System.out.println("afte session"+course);

%>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Excel Sheet</h2>
					
					<form class="row g-3 needs-validation" action="excel_questionController" method="post" enctype="multipart/form-data" novalidate>
						
						
						
						<div class="col-md-12">
							<i class="far fa-file-excel "></i> <label
								for="validationCustom04" class="form-label">Upload Your
								File</label> <input type="file" name="file" accept=".xlsx"
								required="required" style="font-size: 18px" >
							<div class="invalid-feedback"  style="font-size: 18px">Please select a File</div>
						</div>


						<div class="col-12">
							<button class="btn btn-primary btn-lg" type="submit" id="submit" style="font-size: 20px">Upload</button>
						</div>
					</form>
		

				</div>
			</div>
		</div>
	</div>
	
	


<!-- <script src="js/excel_question.js"></script> -->

</body>
</html>