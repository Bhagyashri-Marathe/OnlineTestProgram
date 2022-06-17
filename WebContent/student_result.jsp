<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.result"%>
<%@page import="com.dao.resultDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Result</title>
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

<link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Merriweather&amp;family=Montserrat&amp;family=Sacramento&amp;display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="css/student_result.css">



</head>
<body>
<div id="studnav"></div>
    
    
    <%
    
    	int userId=(int)session.getAttribute("loginUserId");
    	List<result>relist =new LinkedList<result>();
    	resultDao rdao=new resultDao();
    	ResultSet rs= rdao.getexamResult(userId); 
    	if(rs.next())
    	{
    		result res=new result(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getString(8));
    		relist.add(res);
    	}
    	request.setAttribute("resultlist", relist);
    
    %>
     <c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	
	
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <c:if test="${requestScope.resultlist!=null and not empty requestScope.resultlist }">
        
        <%
			List<result> rlist=(List)request.getAttribute("resultlist");
			session.setAttribute("resultPrint", rlist);
		%>
	
	<c:forEach items="${requestScope.resultlist}" var="rl">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
    
            <div class="avtar"><img src="images/avatar-svgrepo-com.svg" alt=""> </div>
            <div class="row all-info">
                <div class="col-md-6">
                    <label>User Id:</label>
                </div>
                <div class="col-md-6">
                    <p>${rl.userId }</p>
                </div>
            </div>
            <div class="row all-info">
                <div class="col-md-6">
                    <label>UserName:</label>
                </div>
                <div class="col-md-6">
                    <p>${rl.userName }</p>
                </div>
            </div>
            <div class="container">
              
                <ul class="responsive-table">
                  <li class="table-header headings">
                    <div class="col col-2">Exam Id</div>
                    <div class="col col-3">Course</div>
                    <div class="col col-2">Obtained Marks</div>
                    <div class="col col-2">Total Marks</div>
                    <div class="col col-2">Incorrect<br>Answer</div>
                    <div class="col col-2">Status</div>
                    
            
                  </li>
                  <li class="table-row">
                    <div class="col col-2" data-label="Exam Id">${rl.examId }</div>
                    <div class="col col-3" data-label="Course">${rl.course }</div>
                    <div class="col col-2" data-label="Obatined Marks">${rl.correct }</div>
                    <div class="col col-2" data-label="Total Marks">${rl.tquestions }</div>
                    <div class="col col-2" data-label="Incorrect Answer">${rl.incorrect }</div>
                    <div class="col col-2" data-label="Status">${rl.resultStatus }</div>
                    
                  </li>
                </ul>
                
            </div>
            
            <div class="col-12">
              <button class="btn btn-primary btn-lg" type="submit" style="font-size: 20px" onclick="location.href='studentResult_pdfController'" >print result</button>
            </div>
       
        
        </div>
        </div>
        </div>
        
             </c:forEach>
     </c:if>
     
   
      
        </div>
         <c:if
		test="${requestScope.resultlist==null and
  empty requestScope.resultlist }">
  <br><br><br>
  		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400"  ></object></center>
  			
	</c:if>
     
    
		 
</body>
    <link rel="stylesheet" href="css/student_result.css">
</html>