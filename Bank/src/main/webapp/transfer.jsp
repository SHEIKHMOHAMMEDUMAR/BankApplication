<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>
<meta charset="UTF-8">
<title>Transfer</title>
</head>
<body style="width: 100%; height: 100%;">
	<% String usr = (String) request.getSession().getAttribute("user");%>
	<x:NavBar isLoggedIn = 'logged' menu = 'transfer' usr = "<%=usr%>" account ='true'></x:NavBar>
	<section style="width:100%; height: 100%;">
  	<div class="px-4 py-5 px-md-5 text-center text-lg-start" style="width:100%; height: 100%; background-color: hsl(0, 0%, 96%); display: flex; justify-content: center; align-items: center;">
    <div class="container" style="display: flex; justify-content: center; align-items: center;">
        <div class="col-lg-6 mb-5 mb-lg-0">
        <div class="bg-primary text-center" style="border-radius: 5px 5px 0 0; padding: 10px;">
      	<h1 class="text-white" >Transfer</h1>
    	</div>
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form action ="TransferServlet">
              <%
              String auth = (String) request.getSession().getAttribute("tauth");
              if(auth == null || auth.equals("authi")){
              %>
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">Beneficary User Name</label>
                  <input type="text" id="form3Example3" class="form-control" name = "tuser" value="<%= (request.getParameter("tuser") == null) ? "" : request.getParameter("tuser")%>" aria-describedby="usernameHelp" placeholder="Enter beneficary username" required/>
                </div>
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Amount</label>
                  <input type="number" step = "0.01" min = 0 id="form3Example4" placeholder="Enter amount" class="form-control" name = "tAmt" value="<%= (request.getParameter("tAmt") == null) ? "" : request.getParameter("tAmt")%>"/>
                </div>
              
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" placeholder="Enter your password" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
                </div>
              <%}
              else {
            	  if(auth.equals("unauthi")){
            	 %>
            	 <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">Beneficary User Name</label>
                  <input type="text" id="form3Example3" class="form-control is-invalid" name = "tuser" value="<%= (request.getParameter("tuser") == null) ? "" : request.getParameter("tuser")%>" aria-describedby="usernameHelp" placeholder="Enter beneficary username" required/>
                </div>
            	  <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Amount</label>
                  <input type="number" step = "0.01" min = 0 id="form3Example4" class="form-control is-invalid" name = "tAmt" value="<%= (request.getParameter("tAmt") == null) ? "" : request.getParameter("tAmt")%>" placeholder="Enter amount" required/>
                </div>
                
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control is-invalid" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                <p style = color:red > Invalid credentials or amount</p>
              <%
            	  }
              else{
              %>
               <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example3">Beneficary User Name</label>
                  <input type="text" id="form3Example3" class="form-control is-invalid" name = "tuser" value="<%= (request.getParameter("tuser") == null) ? "" : request.getParameter("tuser")%>" aria-describedby="usernameHelp" placeholder="Enter beneficary username" required/>
                </div>
            	  <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Amount</label>
                  <input type="number" step = "0.01" min = "0" id="form3Example4" class="form-control" name = "tAmt" value="<%= (request.getParameter("tAmt") == null) ? "" : request.getParameter("tAmt")%>" placeholder="Enter amount" required/>
                </div>
                
                <div class="form-outline mb-4">
                  <label class="form-label" for="form3Example4">Password</label>
                  <input type="password" id="form3Example4" class="form-control" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>" aria-describedby="userPasswordHelp" placeholder="Enter your password" required/>
                </div>
                <p style = color:red > Beneficary Doesn't Exists</p>
              <%
              }
           }
              %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                 Transfer
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