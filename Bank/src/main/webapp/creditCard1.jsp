<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
    <%@ page import="com.creditcard.CreditCardShowDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="credit.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<title>Credit Card</title>
</head>
<body style="width: 100%; height: 100%;">
<% 
CreditCardShowDao ccsd = new CreditCardShowDao(); 
String usr = (String) request.getSession().getAttribute("user");
ResultSet rs = ccsd.creditCardShowDao(usr);
rs.next();
String cardName = rs.getString(1);
String cardNo = rs.getString(2).substring(0, 4)+" "+rs.getString(2).substring(4, 8)+" "+rs.getString(2).substring(8, 12);
String cardCVV = rs.getString(3);
%>
<x:NavBar isLoggedIn = 'logged' menu= 'creditCard' usr = "<%=usr%>" account ='true'></x:NavBar>
<section style="height: 100%; width: 100%; background-color: hsl(0, 0%, 96%);">
<div class="px-4 py-5 px-md-5 text-lg-start" style="height: 40%; width: 100%; display: flex; justify-content: center;">
<div class="col-lg-6 mb-5 mb-lg-0" style="display: flex; justify-content: center;">
<div class="flip-card">
<div class="flip-card-inner">
<div class="flip-card-front">
<div class="card" style="background-image: linear-gradient(to bottom right,blue,black,purple); justify-content: center; align-items: center;">
  <div class="card-body" style="display: inline-block;">
    <h2 class="card-title text-white">JDBC Bank</h2>
    <h3 class="card-subtitle mb-2 text-muted">Credit Card</h3>
    <h2 class="card-text text-white"><%=cardName%></h2>
    <h3 class="card-subtitle mb-2 text-muted">Credit Card No:</h3> 
    <h2 id="myspana" class = "form-control text-primary" style="background-color: #eeeeee" hidden="hidden"><%=cardNo%></h2>
    <h2 id="myspanb" class = "form-control text-primary" style="background-color: #eeeeee" >xxxx xxxx xxxx</h2>
  </div>
</div>
</div>
<div class="flip-card-back">
 <div class="card" style="background-image: linear-gradient(to bottom right,blue,black,purple); justify-content: center; align-items: center;">
  <div class="card-body" style="display: inline-block;">
    <h2 class="card-title text-white">JDBC Bank</h2>
    <h3 class="card-subtitle mb-2 text-muted">Credit Card</h3>
    <h2 class="card-text text-white"><%=cardName%></h2>
    <h3 class="card-subtitle mb-2 text-muted">CVV:</h3>
    <h2 id="myspanc" class = "form-control text-primary" style="background-color: #eeeeee" hidden="hidden"><%=cardCVV%></h2>
    <h2 id="myspand" class = "form-control text-primary" style="background-color: #eeeeee" >xxx</h2>
  </div>
</div>
</div>
</div>
</div>
</div>
</div>
<div style="display: grid; justify-content: center; align-items: center; text-align: center;">
    <div><button onclick="toggle(this)" class="btn btn-primary"> Show Card Number </button></div>
    </br>
    <div><a href="useCard.jsp"><button class="btn btn-primary" type="button">Use Card</button></a></div>
</div>
</section>
<script>
  let toggle = button => {
     let element1 = document.getElementById("myspana");
     let element2 = document.getElementById("myspanb");
     let element3 = document.getElementById("myspanc");
     let element4 = document.getElementById("myspand");
     let hidden = element1.getAttribute("hidden");
    
     if (hidden) {
        element1.removeAttribute("hidden");
        element3.removeAttribute("hidden");
        element2.setAttribute("hidden", "hidden");
        element4.setAttribute("hidden", "hidden");
        button.innerText = "Hide Card Number";
     } else {
        element1.setAttribute("hidden", "hidden");
        element3.setAttribute("hidden", "hidden");
        element2.removeAttribute("hidden");
        element4.removeAttribute("hidden");
        button.innerText = "Show Card Number";
     }
  }
</script>
</body>
</html>