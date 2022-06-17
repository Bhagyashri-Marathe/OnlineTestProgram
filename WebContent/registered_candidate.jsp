<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Registered Candidate</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/table.css">

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
        <h2 class="title">Registered Candidates</h2>
        <form action="registered_candidateController" method="post" class="row g-3 needs-validation" novalidate>
            
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

            
           
            <div class="col-12">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" >View Candidates</button>
            </div>
          </form>
       
        
        </div>
        </div>
        </div>
              <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	<c:if test="${requestScope.candlist!=null and not empty requestScope.candlist }">
		
  		<div class="main">
  		<h2 style="font-size: 40px;font-weight: bold;">Registered Candidate </h2><Table></Table>
  	<div class="container">
      	 <br>
        <ul class="responsive-table">
          <li class="table-header"  style="font-size: 18px">
            <div class="col col-1">Reg Id</div>
            <div class="col col-1">Name</div>
            <div class="col col-3">Email</div>
            <div class="col col-1">Phone Number</div>
            <div class="col col-1">Date Of Birth</div>
            <div class="col col-1">Course</div>
          </li>
          
	<c:forEach items="${requestScope.candlist}" var="cl">
		
  		 <li class="table-row"  style="font-size: 18px">
            <div class="col col-1" data-label="Reg Id">${cl.regId}</div>
            <div class="col col-1" data-label="Name">${cl.name}</div>
            <div class="col col-3" data-label="Email">${cl.email}</div>
            <div class="col col-1" data-label="Phone Number">${cl.mobno}</div>
            <div class="col col-1" data-label="Date Of Birth">${cl.dob}</div>
            <div class="col col-1" data-label="Course">${cl.course}</div>
          </li>
	</c:forEach>
	</ul>
	</div>
	</div>
	</c:if>
	
	
	<c:if
		test="${requestScope.candlist==null and
  empty requestScope.candlist }">
  <br><br><br>
  		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" " ></object></center>
  			
	</c:if>
		 
        
        </div>
        
<script src="js/registered_candidate.js"></script>   
</body>
</html>