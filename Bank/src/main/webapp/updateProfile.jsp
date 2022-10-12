<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
    <%@ page import="com.updateprofile.UpdateProfileDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"/>
<link rel="stylesheet" href="../../../css/mdb.min.css" />
<title>Update Profile</title>
</head>
<body>
<%
String usr = (String) request.getSession().getAttribute("user");
Boolean auth = (Boolean) request.getSession().getAttribute("oauth");
Boolean incorrect = (Boolean) request.getSession().getAttribute("incorrect");
%>
<x:NavBar isLoggedIn = 'logged' menu = 'none' usr = "<%=usr%>" account ='true'></x:NavBar>
<section class="">
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    <div class="container">
      <div class="row gx-lg-5 align-items-center">
        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form action ="UpdateProfileServlet">
              <%
              UpdateProfileDao upd = new UpdateProfileDao();
        	  ResultSet rs = upd.updateProfileDaoRead(usr);
        	  rs.next();
              if(auth == null || auth){
              %>  
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Account Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(1)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">User Name</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(2)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Account Type</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(3)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Gender</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(4)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Aadhaar Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(5)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Pan Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(6)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Balance</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(7)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Phone Number</label>
                <input type="number" maxlength = "10" id="form3Example4" class="form-control" name = "phone" value="<%=rs.getString(8)%>"/>
               </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Address</label>
                <input type="text" maxlength = "50" id="form3Example4" class="form-control" name = "address" value="<%=rs.getString(9)%>"/>
              </div>
              <%}
              else{
            	  String phoneV = "";
            	  if(incorrect){
            		  phoneV= "is-invalid";
            	  }
            	  else{
            		  phoneV = "";
            	  }
            	 %>
            	 <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Account Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(1)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">User Name</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(2)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Account Type</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(3)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Gender</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(4)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Aadhaar Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(5)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Pan Number</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(6)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Balance</label>
                <span id="form3Example3" class="form-control" style="background-color: #eeeeee"><%=rs.getString(7)%></span>
              </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Phone Number</label>
                <input type="number" maxlength = "10" id="form3Example4" class="form-control <%=phoneV %>" name = "phone" value="<%= (request.getParameter("phone") == null) ? "" : request.getParameter("phone")%>"/>
               </div>
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3">Address</label>
                <input type="text" maxlength = "50" id="form3Example4" class="form-control" name = "address" value="<%= (request.getParameter("address") == null) ? "" : request.getParameter("address")%>"/>
              </div>
            	  <p style = color:red > Please enter valid details</p>
              <%}
              %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Update
                </button>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>