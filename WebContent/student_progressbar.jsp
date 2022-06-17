<%@page import="com.dao.resultDao"%>
<%@page import="com.model.result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.model.exam"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.examDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- <link rel="stylesheet" href="progressbar.css"> -->
	<title>Student | Progress Report</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(function () {
			$("#studnav").load("student_sidenav.jsp");
		});
	</script>
	<!-- <script type="text/javascript" src=" https://www.gstatic.com/charts/loader.js"></script> -->
	<link rel="stylesheet" href="css/student_progressbar.css">
</head>
<body>
<%
		String course=(String)session.getAttribute("loginUserCourse");
		List<exam> exlist=new LinkedList<exam>();
		examDao ed=new examDao();
		ResultSet rs=ed.examScheduleInfo(course);
		if(rs.next())
		{
			exam ex=new exam(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getInt(7));
			exlist.add(ex);
		}
		request.setAttribute("examList", exlist);
		
		int userId=(int)session.getAttribute("loginUserId");
		List<result> resultlist=new LinkedList<result>();
		resultDao rdao=new resultDao();
		rs=rdao.getexamResult(userId);
		if(rs.next())
		{
			result res=new result(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getString(8));
			resultlist.add(res);
		}
		request.setAttribute("reslist",resultlist);
		
		
%>
	<div id="studnav"></div>
	
	  <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	

	
	<div class="col-lg-12">
		<c:if test="${requestScope.examList!=null and not empty requestScope.examList }">
	
	<c:forEach items="${requestScope.examList}" var="el">
		<div id="div2">
			<h3 style="color: red;"><strong>Exam Id
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:${el.examId }</strong></h3>
			<h3 style="color: green;"><strong>Exam Date &nbsp;&nbsp;&nbsp;:${el.startDate }</strong></h3>
			<h3 style="color: rgb(85, 72, 1);"><strong>Exam Start Time&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;:${el.startHour }</strong></h3>
			<h3 style="color: darkblue;"><strong>Exam End Time &nbsp;&nbsp;&nbsp;:${el.endHour }</strong></h3>
		</div>
		 </c:forEach>
     </c:if>
         <c:if
		test="${requestScope.examList==null and
  empty requestScope.examList }">
  <br><br><br>
  		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" " ></object></center>
  			
	</c:if>
	</div>
	
	



	<div class="container">
	
	 <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	<c:if test="${requestScope.reslist!=null and not empty requestScope.reslist }">
	
	<c:forEach items="${requestScope.reslist}" var="rel">
	
		<div class="row">
			<div class="col-lg-6">
				<main>
					<h1><strong>Progress Analysis</strong></h1>
					<!-- <p>Change the number values in the html</p> -->
					<section>
						<div class="pieID pie">

						</div>
						<ul class="pieID legend">
							<li>
								<em><strong>Correct Questions:</strong></em>
								<strong><span>${rel.correct}</span></strong>
							</li>
							<li>
								<em><strong>Wrong Questions:</strong></em>
								<strong><span>${rel.incorrect }</span></strong>
							</li>
							<li>
								<em><strong>Total Questions:</strong></em>
								<strong><span>${rel.tquestions }</span></strong>
							</li>
							
						</ul>

					</section>

				</main>

			</div>

			<div class="col-lg-6">
				<div class="vertical" style="margin-left: -180px;"></div>

				<div class="main-body" >



					<!-- <div class="row gutters-sm"> -->
					<!-- <div class="col-md-4"> -->
					<div class="card">

						<div class="card-body" style="height: 315px">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
									class="rounded-circle" width="150">
								<div class="mt-3">
									<h4 style="font-size: 25px;"><strong> ${rel.userName }</strong></h4>
									<p class="text-secondary mb-1"><h3><strong>${rel.course }</strong></h3></p>
									<h3><strong>TechnoGenix Institute</strong></h3>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		</c:forEach>
     </c:if>
     
        <c:if
		test="${requestScope.reslist==null and
  empty requestScope.reslist }">
  <br><br><br>
  		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" " ></object></center>
  			
	</c:if>

	</div>


	<!-- </div>


	</div> -->
	<script src="js/student_progressbar.js"></script>

</body>
</html>