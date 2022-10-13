<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html style="width:100%; height:100%;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"/>
<link rel="stylesheet" href="../../../css/mdb.min.css" />
<title>Logged into JDBC Bank</title>
</head>
<body style="width:100%; height:100%;">
<% 
String usr = (String) request.getSession().getAttribute("user");
Boolean account = (Boolean) request.getSession().getAttribute("account");
if(account == null || account == false ){
%>	
	<x:NavBar isLoggedIn = 'logged' menu = 'none' usr = "<%=usr%>" account ='false'></x:NavBar>
	<p>You don't have an account please create a new account.</p>
<%	}
else{
	 %>
	<x:NavBar isLoggedIn = 'logged' menu = 'none' usr = "<%=usr%>" account ='true'></x:NavBar>
<% 
}
%>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width:100%; height:100%; background-color: hsl(0,0%,90%);">
  <div class="carousel-inner bg-muted" style="width:100%; height:100%; display:flex; align-items: center; justify-content: center;">
    <div class="carousel-item active">
      <div class="text-center" style="width:100%; height:100%; display:flex; align-items: center; justify-content: center;">
      <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            Pablo Escobar Bank<br />
            <span class="text-primary">makes your finances smooth</span>
            <h6>and secures your black money</h6>
          </h1>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="text-center" style="width:100%; height:100%; display:flex; align-items: center; justify-content: center;">
      <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            Credit Card<br />
            <span class="text-primary"> With No Credit Score</span>
          </h1>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="text-center" style="width:100%; height:100%; display:flex; align-items: center; justify-content: center;">
      <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            Manage your transactions<br />
            <span class="text-primary">with our intelligent transaction analytics</span>
          </h1>
        </div>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>