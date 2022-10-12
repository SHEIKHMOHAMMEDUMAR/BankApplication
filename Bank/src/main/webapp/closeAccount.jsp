<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>
<meta charset="UTF-8">
<title>Close Account</title>
</head>
<body style="width: 100%; height: 100%;">
	<% String usr = (String) request.getSession().getAttribute("user");%>
	<x:NavBar isLoggedIn = 'logged' menu = 'closeAccount' usr = "<%=usr%>" account ='true'></x:NavBar>
	<section style="width: 100%; height: 100%;">
  	<div class="px-4 py-5 px-md-5 text-lg-start" style="width: 100%; height: 100%; background-color: hsl(0, 0%, 96%); display: flex; justify-content: center; align-items: center;">
    <div class="container" style="display: flex; justify-content: center; align-items: center;">
        <div class="col-lg-6 mb-5 mb-lg-0">
        <div class="bg-primary text-center" style="border-radius: 5px 5px 0 0; padding: 10px;">
      	<h1 class="text-white" >Close Account</h1>
    	</div>
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form action ="CloseAccountServlet">
              <%
              Boolean auth = (Boolean) request.getSession().getAttribute("authc");
              if(auth == null || auth){
              %>
                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" placeholder="Enter password" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
                </div>
                  <%}
              else{
            	 %>
                <!-- Password input -->
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control is-invalid" placeholder="Enter password" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                
                <p style = color:red > Invalid Credentials</p>
              <%}
              %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Close Account
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
</body>
</html>