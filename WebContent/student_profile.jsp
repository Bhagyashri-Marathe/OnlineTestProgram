<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="com.model.candidate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.studentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@page errorPage="error.jsp" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Profile</title>
<link rel="stylesheet" href="Student_profile.css">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
 <link rel="stylesheet" href="css/student_profile.css">
  <script>
    $(function () {
      $("#studnav").load("student_sidenav.jsp");
    });
  </script>


</head>
<body>
 	<%
      		int userId=(int)session.getAttribute("loginUserId");
 			System.out.println(userId);
      		List<candidate> cdlist=new LinkedList<candidate>();
      		studentDao sd=new studentDao();
      		ResultSet rs=sd.loginCandData(userId);
      		if(rs.next())
      		{
      			candidate can=new candidate(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
      			cdlist.add(can);
      		}
      		request.setAttribute("candProfilelst", cdlist);
     %>
 <div id="studnav"></div>
  <div class="container" style="margin-left: 280px;">
    <div class="main-body">

      <!-- Breadcrumb -->

      <!-- /Breadcrumb -->
     
	<c:if test="${requestScope.message !=null }">
	NOTE : ${message}	
	</c:if>
	
	<c:if test="${requestScope.candProfilelst!=null and not empty requestScope.candProfilelst }">
	 <c:forEach items="${requestScope.candProfilelst}" var="cl">
      <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
          <div class="card">
            <div class="card-body" style="height: 315px;">
              <div class="d-flex flex-column align-items-center text-center">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle"
                  width="150">
                
                <div class="mt-3">
                  <h4 style="font-size: 25px;"> ${cl.name }</h4>
                  <p class="text-secondary mb-1"> ${cl.course }</p>
                  <p class="text-muted font-size-sm" style="font-size: 22px;">TechnoGenix Institute</p>

                </div>
              </div>
            </div>
            
          </div>
		
        </div>
       
        <div class="col-md-8">
          <div class="card mb-3">
            <div class="card-body" style="margin-top: 40px;">
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0" style="font-size: 20px;">User ID </h6>
                </div>
                <div class="col-sm-9 text-secondary">
                 ${cl.regId }
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0" style="font-size: 20px;">Name</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  ${cl.name }
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0" style="font-size: 20px;">Email</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  ${cl.email }
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0" style="font-size: 20px;">Phone no</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  ${cl.mobno }
                </div>
                
              </div>
              
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0" style="font-size: 20px;">Date of Birth</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  ${cl.dob}
                </div>
                
              </div>
              
              <hr>
              <!-- <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="https://www.bootdey.com/snippets/view/profile-edit-data-and-skills">Edit</a>
                    </div>
                  </div> -->
            </div>
           
          </div>
          
        </div>
       
      </div>
      </c:forEach>
      </c:if>
     <c:if
		test="${requestScope.candProfilelst==null and
  empty requestScope.candProfilelst }">
  <br><br><br>
  		<center><label style="color: white;font-size: 30px;">No Result Found...!!</label></center>
  		<center><object data="images/traffic-u-turn.svg" width="400" height="400" ></object></center>
  			
	</c:if>
		 
        

    </div>
   
  </div>
</
 


</body>
</html>