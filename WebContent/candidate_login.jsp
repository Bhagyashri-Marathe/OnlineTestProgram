
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="css/candidate_login.css">
<title>Student | Login</title>
</head>
<body>



 <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <div id=div1>
                        <div class="msg ng-binding" style="font-size:28px;margin-bottom:10px"><b>Candidate Login</b>
                        </div>
                    </div>
                <%
               			String error=(String)session.getAttribute("error");
						String error_message=(String)session.getAttribute("loginError");
						System.out.println(error);
						String error_msg=(String)session.getAttribute("err_msg");
						System.out.println(error_msg);
				
                		if(!session.isNew())
                		{
						
						if(error=="true"&&error_msg!=null)
						{
				%>
							<div class="alert">
  								<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<strong><%=error_msg %></strong> 
							</div>
							
				<%
						}
						if(error=="true"&&error_message!=null)
						{
				%>
							<div class="alert">
  								<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<strong><%=error_message %></strong> 
							</div>
				<%
				
				
								
							
						}
                		}
                
                		session.invalidate();
				%>
                    <form action="candidate_loginController" method="post" class="row g-3 needs-validation" style="margin-top: 30px;" novalidate>
                        <div class="col-md-6">

                            <!-- <label for="validationCustom01" class="form-label">username :</label> -->

                            <input type="text" class="form-control" name="uname" id="val1" placeholder="Enter username"
                                value="" required>
                            <div class="valid-feedback">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- <label for="validationCustom02" class="form-label">password :</label> -->
                            <input type="password" class="form-control" name="pass" id="pass"
                                placeholder="Enter password" value="" required>
                                <i class="bi bi-eye-slash" id="togglePassword"></i>
                            <div class="valid-feedback">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-row">
                                <div id="div2">
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" readonly id="capt">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" placeholder="Enter Captcha"
                                            id="textinput" required>
                                    </div>

                                </div>
                                <div id="div6">
                                    <h6 style="margin-top: 20px;">Refresh Captcha<img src="images/refresh.jpg" width="25px"
                                            onclick="cap()"></h6>
                                </div>

                            </div>

                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms_and_conditions1" value="1"
                                        onclick="terms_changed(this)" id="invalidCheck" required>
                                    <label class="form-check-label" for="invalidCheck">
                                        <b>accept Terms of Use and Privacy Policy of the website.</b>
                                    </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="terms_and_conditions2"
                                            value="1" onclick="terms_changed(this)" id="invalidCheck" required>
                                        <label class="form-check-label" for="invalidCheck">
                                            <b>You can not start exam if you disallow camera</b>
                                        </label>
                                    </div>
                                    <div class="invalid-feedback">

                                        agree before submitting.
                                    </div>
                                </div>
                            

                                <button class="btn btn-primary" style="margin-left: 380px;margin-top: 20px;"
                                    id="submit_button" onclick=validcap() type="submit" disabled>Login</button>
                            <div class="col-sm-12 text-center" style="margin-top:10px">
                                &nbsp&nbsp <b>For Login Credential Help-</b> Please contact your institute<br>
                            </div>
                    </form>


                </div>
            </div>
        </div>
    </div>

  
    <script src="js/candidate_login.js"></script>
</body>
</html>