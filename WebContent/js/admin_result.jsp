<%@page import="com.model.result"%>
<%@page import="java.util.List"%>
<%@page import="question.upload.excelsheet.resultPdf"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
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
        <h2 class="title">Result</h2>
        <form action="admin_resultController" method="post" class="row g-3 needs-validation" novalidate>
            
          <div class="col-md-12">
            <label for="validationCustom04" class="form-label">Course</label>
            <select class="form-select" name="course" id="validationCustom04" required style="font-size: 18px">
              <option selected disabled value="">Choose...</option>
              <option>Web_Devlopment</option>
              <option>DataBase</option>
              <option>Java</option>
            </select>
            <div class="invalid-feedback" style="font-size: 18px">
              Please select a Course.
            </div>
          </div>

            
           
            <div class="col-12">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" >View Result</button>
            </div>
          </form>
        </div>
        </div>
        </div>
        
         <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	<c:if test="${requestScope.resultList!=null and not empty requestScope.resultList }">
	<%
			List<result> rlist=(List)request.getAttribute("resultList");
			session.setAttribute("resu", rlist);
	%>
		
  		<div class="main">
  		<h2 style="font-size: 40px;font-weight: bold;">Student Results </h2><Table></Table>
  	<div class="container">
      	 <br>
        <ul class="responsive-table">
          <li class="table-header"  style="font-size: 15px">
            <div class="col col-1">UserId</div>
            <div class="col col-2">UserName</div>
            <div class="col col-1">ExamId</div>
            <div class="col col-2">Course</div>
            <div class="col col-2">Obtained Marks</div>
            <div class="col col-2">Incorrect Questions</div>
            <div class="col col-1">Total<br>Marks</div>
            <div class="col col-1">Status</div>
          </li>
          
	<c:forEach items="${requestScope.resultList}" var="rl">
		
  		 <li class="table-row"  style="font-size: 18px">
            <div class="col col-1" data-label="User Id">${rl.userId}</div>
            <div class="col col-2" data-label="Name">${rl.userName}</div>
            <div class="col col-1" data-label="Exam Id">${rl.examId}</div>
            <div class="col col-2" data-label="course">${rl.course}</div>
            <div class="col col-2" data-label="obtained Marks">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${rl.correct}</div>
            <div class="col col-2" data-label="incorrect questions">${rl.incorrect}</div>
            <div class="col col-1" data-label="total Marks">${rl.tquestions}</div>
            <div class="col col-1" data-label="status">${rl.resultStatus}</div>
            
          </li>
	</c:forEach>
	</ul>
	<div class="col-12">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" onclick="location.href='result_pdfController'" >print result</button>
            </div>
	</div>
	</div>
	</c:if>
	
	
	<c:if
		test="${requestScope.resultList==null and
  empty requestScope.resultList }">
  <br><br><br>
  		<center><label style="color: white;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400"  ></object></center>
  			
	</c:if>
		 
        </div>
        
<script src="js/result.js"></script>        
</body>
</html>