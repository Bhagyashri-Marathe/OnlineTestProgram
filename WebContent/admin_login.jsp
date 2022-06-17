<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
   
  <link rel="stylesheet" href="css/admin_login.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <style> 

@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@300&display=swap');
</style>

<meta charset="ISO-8859-1">
<title>Admin | Login</title>
</head>
<body>


	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
      <div class="card card-4">
        <div class="card-body">

          <div id=div1>
            <div class="msg ng-binding"><b>Admin Login</b></div>
          </div>
		<%
                		if(!session.isNew())
                		{
						String error=(String)session.getAttribute("error");
						System.out.println(error);
						String error_msg=(String)session.getAttribute("err_msg");
						System.out.println(error_msg);
						if(error=="true")
						{
				%>
							<div class="alert">
  								<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<strong><%=error_msg %></strong> 
							</div>
				<%
						}
                		}
                		session.invalidate();
                		
				%>
          <form action="admin_loginController" method="post" class="row g-3 needs-validation" style="margin-top: 30px;" novalidate>
            <div class="col-md-9">

              <div id="div2">
                <label for="validationCustom01" class="form-label">username :</label>
                <input type="text" id="name" name="uname" class="form-control" placeholder="Enter username" onkeyup="manage(this)" />
                <div class="valid-feedback">
                </div>
              </div>
            </div>

            <div class="col-md-9">
              <p>
              <div id="div3">
                <label for="validationCustom02" class="form-label">password :</label>
                <input type="password" id="desig" name="pass" class="form-control" placeholder="Enter password"
                  onkeyup="manage(this)" /> 
                  <i class="bi bi-eye-slash" id="togglePassword"></i>
                
              </div>
           
            </div>
        
            <div class="div4">
              <input type="submit" id="submit" class="btn btn-primary" style="margin-left: 200px;margin-top: 30px;"
                value="login" disabled />
            </div>
          </form>

        </div>
      </div>
    </div>
  </div>
  <script src="js/admin_login.js"></script>
</body>
</html>