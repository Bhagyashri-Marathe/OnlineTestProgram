<%@page import="com.dao.resultDao"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.model.exam"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.examDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@page errorPage="error.jsp" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Exambox</title>
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
    <link rel="stylesheet" href="css/student_exambox.css">
</head>
<body>
 <div id="studnav"></div>
 <%
 		String course=(String)session.getAttribute("loginUserCourse");
        //String course="Java";
 		examDao ed=new examDao();
 		ResultSet rs=ed.examScheduleInfo(course);
 		List<exam> exlist=new LinkedList<exam>();
 		if(rs.next())
 		{
 			
 			
 				session.setAttribute("loginUserExamId", rs.getInt(1));
 				exam ex=new exam(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getDate(5),rs.getString(6),rs.getInt(7));
 	 			exlist.add(ex);
 			
 			
 			
 		}
 		else
		{
				System.out.println("else");
				session.setAttribute("loginUserExamId", 0);
		}
 		int examId=0;
 		int userId=(int)session.getAttribute("loginUserId");
 		examId=(int)session.getAttribute("loginUserExamId");
 		resultDao rsd=new resultDao();
 		rs=rsd.checkResultRecord(userId, examId);
 		if(rs.next())
 		{
 			exlist=null;
 		}
 		
 		request.setAttribute("examBoxData", exlist);
 %>
   
	          <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
 <c:if test="${requestScope.examBoxData!=null and not empty requestScope.examBoxData}">
	
      
    <div class="container "> 
    
        <div class="row">
            <div class="col-lg-12 ">
                <div class="col-sm-12 m-t-40 row">    
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	 <c:forEach items="${requestScope.examBoxData}" var="eb">
                       <div class="card">
                            <div class="card-header bg-teal">
                                <h2>
                                   ${eb.course}
                                </h2>
                            </div>
                            <div class="body">
                                <b >Start &nbsp: &nbsp&nbsp</b> <label> ${eb.startDate} &nbsp&nbsp&nbsp&nbsp ${eb.startHour} </label><br>
                                <b >Expired &nbsp: &nbsp&nbsp</b> <label> ${eb.endDate} &nbsp&nbsp&nbsp&nbsp ${eb.endHour} </label><br>
                                <b >Time Zone &nbsp: &nbsp&nbsp</b> <label>Indian Standard Time</label><br>
                                <b >Total Marks: </b> <label>${eb.tquestion }</label><br>
                            </div>
                            <div class="modal-footer">
                                <!-- <center class="col-sm-12 col-xs-12" style="margin: 0px; padding: 0px;">
                                    <a style="padding:10px !important;" class="bg-info btn"><i class="fa fa-info-circle btn-property" aria-hidden="true"></i>&nbsp;<label>View Details</label></a>
                                </center> -->
                                <button type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href='student_instructions.jsp'">Start Exam</button>
                            </div>
                        </div>
                        </c:forEach>
                    
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    </c:if>
    
 <c:if
		test="${requestScope.examBoxData==null and
  empty requestScope.examBoxData}">
  <br><br><br><br><br><br>
  		<center><label style="color: black;font-size: 30px;">No Exams Found..!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" " ></object></center>
  			
	</c:if>
		 
   
		 
</body>

   <link rel="stylesheet" href="css/student_exambox.css">
</html>