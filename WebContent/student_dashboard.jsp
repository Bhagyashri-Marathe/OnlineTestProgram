<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(function () {
            $("#studnav").load("student_sidenav.jsp");
        });
    </script>
    <link rel="stylesheet" href="css/student_dashboard.css">
    
    
</head>
<body>
<%
int userId=(int)session.getAttribute("loginUserId");
%>
	 <div id="studnav"></div>
    <div class="banner">

    </div>
    <div class="content">
        <p style="font-size: 50px;"><strong>TechnoGenix Institute</strong></p>
        <p style="font-size: 15px;">
            Experience high level IQ question.<br>“Start Your Journey Now!!”
        </p>
        <div>
        	<button type="button"><a href="student_profile.jsp">My Profile</a></button>
            <button type="button"><a href="student_exambox.jsp">Test Schedule</a> </button>
            
        </div>
    </div>
    <script src="js/student_dashboard.js"></script>
</body>
</html>