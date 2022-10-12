<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
    <%@ page import="com.creditcard.CreditCardShowDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="credit.css"/>
<title>Credit Card</title>
</head>
<body>
<% 
CreditCardShowDao ccsd = new CreditCardShowDao(); 
String usr = (String) request.getSession().getAttribute("user");
ResultSet rs = ccsd.creditCardShowDao(usr);
rs.next();
String cardName = rs.getString(1);
String cardNo = rs.getString(2).substring(0, 4)+"_"+rs.getString(2).substring(4, 8)+"_"+rs.getString(2).substring(8, 12);
String cardCVV = rs.getString(3);
System.out.println(cardNo);
%>
<x:NavBar isLoggedIn = 'logged' menu= 'creditCard' usr = "<%=usr%>" account ='true'></x:NavBar>
<section class="">
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%); margin: -9%">
    <div class="position-box" style="dispaly: flex">
    <div class="flip-card" style="margin: 100px; text-align: center; border: 1px sloid black; display: block;">
    
    <div class="flip-card-inner">
    
      <div class ="flip-card-front" style="width: 90%; height: 200%; background-color: #ffffff">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            JDBC Bank <br />
            <span class="text-primary">Credit Card</span>
          </h1>
         <p >
           <h4 class="my-5 display-3 fw-bold ls-tight"><%=cardName%></h4>
           Card Number: 
           <h6 id="myspana" class = "form-control" style="background-color: #eeeeee" hidden="hidden"><%=cardNo %></h6>
           <h6 id="myspanb" class = "form-control" style="background-color: #eeeeee" >xxxx_xxxx_xxxx</h6>
         </p>
       <br />
      </div>
       
       <div class = "flip-card-back" style="width: 90%; height: 200%; background-color: #111111">
       	<h1 class="my-5 display-3 fw-bold ls-tight">
            JDBC Bank <br />
            <span class="text-primary">Credit Card</span>
          </h1>
        </div>
         <p >
           <h4 class="my-5 display-3 fw-bold ls-tight"><%=cardName%></h4>
           CVV: 
           <h6 id="myspanc" class = "form-control" style="color: #ffffff" hidden="hidden"><%=cardCVV %></h6>
           <h6 id="myspand" class = "form-control" style="color: #ffffff" >xxx</h6>
         </p>
       </div>
       </div>
       </div>
       </div>
       </div>
       </div>
       <div style="margin-top: 20%">
        <button onclick="toggle(this)" class="btn btn-primary btn-block mb-4"> Show Card Number </button>
       <a href="useCard.jsp"><button type="button">Use Card</button></a>
       </div>
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