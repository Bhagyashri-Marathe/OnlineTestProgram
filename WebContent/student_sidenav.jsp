<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Sidenav</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
    <script src="https://kit.fontawesome.com/86862bf9f2.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<!--*************************************navbar Start***********************************-->
    <nav class="navbar navbar-light fixed-top" style="background-color: #11101d">
      <a class="navbar-brand" href="#" style="color: #fff; margin-right: 100%;font-size: 30px; color: #0cecdd;">TechnoGenix Institute</a>
    </nav>
    <!--*************************************navbar end***********************************-->
    <!--*************************************Sidebar Start***********************************-->
    <div class="sidebar">
      <div class="logo-details">
        <div class="logo_name">TechnoGenix</div>
        <i class="bx bx-menu" id="btn"></i>
      </div>
      <ul class="nav-list">
        <li>
          <a href="student_dashboard.jsp">
            <i class="fa fa-fw fa-home" aria-hidden="true"></i>
            <span class="links_name">Home</span>
          </a>
          <span class="tooltip">Home<span>
        </li>
        <li>
          <a href="student_profile.jsp">
            <i class="fas fa-user-tie" aria-hidden="true"></i>
            <span class="links_name">My Profile</span>
          </a>
          <span class="tooltip">My Profile</span>
        </li>
        <li>
          <a href="student_exambox.jsp">
            <i class="far fa-calendar-alt" aria-hidden="true"></i>
            <span class="links_name">Test Schedule</span>
          </a>
          <span class="tooltip">Test Schedule</span>
        </li>
        
        <li>
          <a href="student_result.jsp">
            <i class="fa fa-check-square-o" aria-hidden="true"></i>
            <span class="links_name">View Result</span>
          </a>
          <span class="tooltip">View Result</span>
        </li>
        <li>
          <a href="student_progressbar.jsp">
            <i class="fas fa-chart-bar" aria-hidden="true"></i>
            <span class="links_name">Progress Chart</span>
          </a>
          <span class="tooltip">Progress Chart</span>
        </li>
  
        <!-- <li>
         <a href="#">
           <i class='fa fa-check' ></i>
           <span class="links_name">NAVIN ADD KAR</span>
         </a>
         <span class="tooltip">NAVIN ADD KAR</span>
       </li>
   -->
   
   <%
   			String name=(String)session.getAttribute("loginUserName");
   			String course=(String)session.getAttribute("loginUserCourse");
   %>
        <li class="profile">
          <div class="profile-details">
           <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
            <div class="name_job">
              <div class="name"><%= name%></div>
              <div class="job"><%=course %></div>
            </div>
          </div>
          <button onclick="location.href='logout'"><i class="bx bx-log-out" id="log_out"></i></button>
        </li>
      </ul>
  
    </div>
    <script src="js/sidenav.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</body>
</html>