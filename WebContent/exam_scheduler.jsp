<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.examDao"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.model.exam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page errorPage="error.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Exam Scheduler</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
        $(function(){
            $("#header").load("sidenav.html");
          
        });
    </script>
         <script type="text/javascript">     
      function isNumber(evt) {
              evt = (evt) ? evt : window.event;
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if ( (charCode > 31 && charCode < 48) || charCode > 57) {
                  return false;
              }
              return true;
          }
      </script>
<link rel="stylesheet" href="css/exam_table.css">

     <link rel="stylesheet" href="css/form.css">
     <script type="text/javascript">
     	function callServlet(examId,course) {
     		console.log(examId+" "+course);
			document.getElementById("form").action="./delete_examController?examId="+examId+"&course="+course;
			document.getElementById("form").method="post";
			document.getElementById("form").submit();
		}
     </script>
	
</head>
<body>

 <div id="header"></div>
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h2 class="title">Exam Scheduler</h2>
        <%
        		if(!session.isNew())
        		{
        			String date_error=(String)session.getAttribute("date_error");
        			String exam_success=(String)session.getAttribute("exam_success");
        			String delete_msg=(String)session.getAttribute("exam_delete");
        			if(date_error!=null)
        			{
        %>
        				<div class="alert" style="padding: 20px;background-color: #f44336; color: white; font-size: 15px;">
  								<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<strong><%=date_error %></strong> 
						</div>
		<% 	
        			}
        			if(exam_success!=null)
        			{
        %>
        				<div class="alert" style="padding: 20px;background-color: #04AA6D; color: white; font-size: 15px;">
							<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
							<strong><%=exam_success %></strong> 
						</div>
		<%
        			}
        			if(delete_msg!=null)
        			{
        %>
        				<div class="alert" style="padding: 20px;background-color: #04AA6D; color: white; font-size: 15px;">
							<span class="closebtn" style="margin-left: 15px;color: white;font-weight: bold;float: right;font-size: 22px;line-height: 20px;cursor: pointer;transition: 0.3s;" onclick="this.parentElement.style.display='none';">&times;</span> 
							<strong><%=delete_msg %></strong> 
						</div>
		<% 
        			}
        		}
        		session.invalidate();
        		
        %>
        				
        <form action="exam_schedulerController" method="post" class="row g-3 needs-validation" novalidate>
            
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

            <div class="col-md-6">
              <label for="validationCustom03" class="form-label">From date:</label>
              <input type="date" name="startdate" class="form-control" id="validationCustom03 txt_startdate" required  style="font-size: 18px">
              <div class="invalid-feedback"  style="font-size: 18px">
                Please provide a Start Date.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label">Start hour :</label>
              <select class="form-select" name="starthour" id="validationCustom04" required  style="font-size: 18px">
                <option selected disabled value="">Choose...</option>
                <option>1 AM</option>
                <option>2 AM</option>
                <option>3 AM</option>
                <option>4 AM</option>
                <option>5 AM</option>
                <option>6 AM</option>
                <option>7 AM</option>
                <option>8 AM</option>
                <option>9 AM</option>
                <option>10 AM</option>
                <option>11 AM</option>
                <option>12 PM</option>
                <option>1 PM</option>
                <option>2 PM</option>
                <option>3 PM</option>
                <option>4 PM</option>
                <option>5 PM</option>
                <option>6 PM</option>
                <option>7 PM</option>
                <option>8 PM</option>
                <option>9 PM</option>
                <option>10 PM</option>
                <option>11 PM</option>
                <option>12 AM</option>
               
              </select>
              <div class="invalid-feedback"  style="font-size: 18px">
                Please select a Start Hour.
              </div>
            </div>
            
            <div class="col-md-6">
              <label for="validationCustom03" class="form-label">To date:</label>
              <input type="date" name="enddate" class="form-control" id="validationCustom03 txt_enddate" required  style="font-size: 18px">
              <div class="invalid-feedback"  style="font-size: 18px">
                Please provide a End Date.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label">End hour :</label>
              <select class="form-select" name="endhour" id="validationCustom04" required  style="font-size: 18px">
                <option selected disabled value="">Choose...</option>
                <option>1 AM</option>
                <option>2 AM</option>
                <option>3 AM</option>
                <option>4 AM</option>
                <option>5 AM</option>
                <option>6 AM</option>
                <option>7 AM</option>
                <option>8 AM</option>
                <option>9 AM</option>
                <option>10 AM</option>
                <option>11 AM</option>
                <option>12 PM</option>
                <option>1 PM</option>
                <option>2 PM</option>
                <option>2 PM</option>
                <option>3 PM</option>
                <option>4 PM</option>
                <option>5 PM</option>
                <option>6 PM</option>
                <option>7 PM</option>
                <option>8 PM</option>
                <option>9 PM</option>
                <option>10 PM</option>
                <option>11 PM</option>
                <option>12 AM</option>
               
              </select>
              <div class="invalid-feedback"  style="font-size: 18px">
                Please select a End Hour.
              </div>
            </div>
  			
  			 <div class="col-md-6">
              <label for="validationCustom05" class="form-label">Total Questions</label>
              <input type="text" class="form-control" id="validationCustom05"  id="onlyNumbers" name="tquestion" onkeypress="return isNumber(event)" onpaste="return false;" required style="font-size: 18px" >
              <div class="invalid-feedback" style="font-size: 18px">
                Please provide total Number of questions.
              </div>
            </div>

           
            <div class="col-12">
              <button class=" btnn btn btn-primary btn-lg" type="submit" style="font-size: 20px" >Create</button>
            </div>
          </form>
       
        
        </div>
        </div>
        </div>
        <%
        	List<exam> exlist=new LinkedList<exam>();
        	examDao ed=new examDao();
        	ResultSet rs=ed.allExams();
        	while(rs.next())
        	{
        		exam ex=new exam(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getInt(7));
        		exlist.add(ex);
        	}
        	request.setAttribute("exlist", exlist);
        	
        %>
        
        <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	<c:if test="${requestScope.exlist!=null and not empty requestScope.exlist }">
	<form method="post" id="form">
		<div class="main">
  		<h2 style="font-size: 24px;font-weight: 400;">Scheduled Exams</h2><Table></Table>
  		<div class="container">
      	</div><br>
        <ul class="responsive-table">
          <li class="table-header" style="font-size: 18px">
            <div class="col col-1" data-label="Exam Id">Exam ID</div>
                <div class="col col-2" data-label="Course">Course</div>
                <div class="col col-1" data-label="Start Date">Start Date</div>
                <div class="col col-1" data-label="Start Time">Start time</div>
                <div class="col col-1" data-label="End Date">End Date</div>
                <div class="col col-1" data-label="End Time">End Time</div>
                <div class="col col-2" data-label="Delete Exam"> Delete </div>
          </li>
        <c:forEach items="${requestScope.exlist}" var="el">
		
  		 <li class="table-row" style="font-size: 18px">
            <div class="col col-1" data-label="Exam Id">${el.examId}</div>
                <div class="col col-2" data-label="Course">${el.course}</div>
                <div class="col col-1" data-label="Start Date">${el.startDate}</div>
                <div class="col col-1" data-label="Start Time">${el.startHour}</div>
                <div class="col col-1" data-label="End Date">${el.endDate}</div>
                <div class="col col-1" data-label="End Time">${el.endHour}</div>
                <div class="col col-2" data-label="Delete Exam"> <button type="button" class=" delete" onclick="callServlet(${el.examId},'${el.course}')">Delete</button> </div>

          </li>
	</c:forEach>
	</ul>
	</div>
	</form>
	</c:if>
	<c:if
		test="${requestScope.exlist==null and
  empty requestScope.exlist }">
  <br><br><br>
  		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" ></object></center>
  			
	</c:if>
		 
        
        
        </div>
        
<script src="js/exam_scheduler.js"></script>      
</body>
</html>