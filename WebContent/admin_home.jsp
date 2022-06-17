<%@page import="com.dao.examDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.studentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Home</title>


    <link rel="shortcut icon" href="icon.jpg" type="image/x-icon" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="css/admin_home.css"/>
    <script src="https://kit.fontawesome.com/86862bf9f2.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

	<%
			int count_std=0;
			int count_exam=0;
			studentDao sd=new studentDao();
			examDao ed=new examDao();
			ResultSet rs=sd.reg_studentCount();
			if(rs.next())
			{
				count_std=rs.getInt(1);
			}
			rs=ed.examCount();
			if(rs.next())
			{
				count_exam=rs.getInt(1);
			}
	%>
	<div class="marg">
    <div class="container">
      <div class="row pad">
        <div class="col-lg-3">
          <div class="boxall box">
            <!-- <img src="images/service-3.svg" alt="UI/UX design" /> -->
            <center><i class="fass fas fa-user-graduate"></i></center><br>
            <center><h2>Registered Candidates</h2></center>
            <br>
            <h2><center><%=count_std %></center></h2>
            

           
          </div>
        </div>
        <div class="col-lg-3">
          <div class="boxall box1">
            <center><i class="fass fas fa-pen"></i></center><br>
            <center><h2>Scheduled Exams</h2></center>
             <br>
            <h2><center><%=count_exam%></center></h2>
          
          </div>
        </div>
        <div class="col-lg-3">
          <div class="boxall box2">
          <center><i class="fass fas fa-book-reader"></i></center><br>
            <center><h2>Offered Courses</h2></center>
            <br>
            <h2><center>3</center></h2>
            
          </div>
        </div>
		
      </div>
    </div>
</div>
    <!-- <script>
		function display() {
			alert('Do You want to login our page?')
		}
	</script> -->
</body>
</html>