<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Balance</title>
</head>
<body>
<% String usr = (String) request.getSession().getAttribute("user");%>
	<x:NavBar isLoggedIn = 'logged' menu = 'checkBalance' usr = "<%=usr%>" account ='true'></x:NavBar>
	<section class="">
  	<div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    <div class="container">
    <div class="center" style="margin-left: 25%">
      <!--  <div class="row gx-lg-5 align-items-center">-->
        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form action ="CheckBalanceServlet">
              <%
              Boolean auth = (Boolean) request.getSession().getAttribute("auth");
              if(auth == null || auth){
              %>
                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
                </div>
                  <%}
              else{
            	 %>
                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control is-invalid" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                
                <p style = color:red > Invalid Credentials</p>
              <%}
              %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Check Balance
                </button>
              </form>
            </div>
          </div>
        </div>
      <!-- </div> -->
      </div>
    </div>
    </div>
  <!-- Jumbotron -->
</section>
</body>
</html>