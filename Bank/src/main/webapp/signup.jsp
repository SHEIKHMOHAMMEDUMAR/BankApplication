<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html style="height: 100%; width: 100%;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"/>
<link rel="stylesheet" href="../../../css/mdb.min.css" />
<title>Sign Up</title>
</head>
<body style="height: 100%; width: 100%;">
<%
String auth = (String) request.getSession().getAttribute("auth1");
if(auth == null || auth.equals("unauthi") || auth.equals("alused")){
%>
<x:NavBar isLoggedIn = 'signup' menu = 'none' account = 'false'></x:NavBar>
<%
}
else{%>
	<x:NavBar isLoggedIn = 'signup' menu = 'none'></x:NavBar>
<%}
%>
<!-- Section: Design Block -->
<section style="height: 100%; width: 100%;">
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="height: 100%; width: 100%; background-color: hsl(0, 0%, 96%); display: flex; justify-content: center; align-items: center;">
    <div class="container">
      <div class="row gx-lg-5 align-items-center">
        <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            The best place <br />
            <span class="text-primary">for your banking</span>
          </h1>
        </div>

        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form action ="SignupServlet">
              <%
              if(auth == null || auth.equals("authi")){
              %>
              <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">User Name</label>
                  <input type="text" id="form3Example3" class="form-control" name = "user" placeholder="Enter your username" value="<%= (request.getParameter("user") == null) ? "" : request.getParameter("user")%>"/>
              </div>

                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "pwd" placeholder="Enter your password" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
                </div>
                
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Re-Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "rpwd"  placeholder="Re-enter password" value="<%= (request.getParameter("rpwd") == null) ? "" : request.getParameter("rpwd")%>"/>
                </div>
              
              <%}
              else{
            	  if(auth.equals("unauthi")){
            	 %>
            	  <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">User Name</label>
                  <input type="text" id="form3Example3" class="form-control is-invalid" name = "user" value="<%= (request.getParameter("user") == null) ? "" : request.getParameter("user")%>" aria-describedby="usernameHelp" placeholder="Enter your username" required/>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control is-invalid" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Re-Password</label>
                  <input type="password" id="form3Example4" class="form-control is-invalid" name = "rpwd" value="<%= (request.getParameter("rpwd") == null) ? "" : request.getParameter("rpwd")%>" aria-describedby="userPasswordHelp" placeholder="Re-enter password" required/>
                </div>
                <div class="text-center">
                  <p>Invalid input</p>
                </div>
                <div class="text-left">
                <ul style='color: red'>
        	      <li>User name should have only alpha-numeric characters</li>
        	      <li>Password should have a digit must occur at least once
				  <li>Password should have a lower case letter must occur at least once</li>
				  <li>Password should have an upper case letter must occur at least once</li>
				  <li>Password should have a special character must occur at least once</li>
				  <li>Password should have no whitespace allowed in the entire string</li>
				  <li>Password should have at least 8 characters</li>
        	   	</ul>
        	   	</div>
              <%}
            	  else{
            		  %>
            		  <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">User Name</label>
                  <input type="text" id="form3Example3" class="form-control is-invalid" name = "user" value="<%= (request.getParameter("user") == null) ? "" : request.getParameter("user")%>" aria-describedby="usernameHelp" placeholder="Enter your username" required/>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Re-Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "rpwd" value="<%= (request.getParameter("rpwd") == null) ? "" : request.getParameter("rpwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                <div class="text-center">
                  <p style='color:red'>Invalid input</p>
                </div>
                <div class="text-left">
                <ul style='color: red'>
        	      <li>User name is already used. Try again</li>
        	   	</ul>
        	   	</div>
            	  <%}
              }
              %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Sign up
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->
<% request.getSession().invalidate(); %>
</body>
</html>