<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
    <%@ page import="com.creditcard.CreditCardShowDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>
<meta charset="UTF-8">
<title>Use Card</title>
</head>
<body style="width: 100%; height: 100%;">
<% 
CreditCardShowDao ccsd = new CreditCardShowDao(); 
String usr = (String) request.getSession().getAttribute("user");
Boolean uuauth = (Boolean) request.getSession().getAttribute("uuauth");
ResultSet rs = ccsd.creditCardShowDao(usr);
rs.next();
String cardName = rs.getString(1);
String cardNo = rs.getString(2).substring(0, 4)+" "+rs.getString(2).substring(4, 8)+" "+rs.getString(2).substring(8, 12);
String cardCVV = rs.getString(3);
double cardbalance = rs.getDouble(4);
System.out.println(cardNo);
%>
<x:NavBar isLoggedIn = 'logged' menu= 'creditCard' usr = "<%=usr%>" account ='true'></x:NavBar>
<section style="width: 100%; height: 100%; background-color: hsl(0, 0%, 96%)">
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="">
    <div class="container" style="width: fit-content;">
    <div class="row gx-lg-5 align-items-center" style="display: block">
<div class="card" style="background-color: $blue; justify-content: center; align-items: center;">
  <div class="card-body text-primary" style="display: inline-block;">
    <h2 class="card-title">JDBC Bank</h2>
    <h3 class="card-subtitle mb-2 text-muted">Credit Card</h3>
    <h2 class="card-text"><%=cardName%></h2>
    <h3 class="card-subtitle mb-2 text-muted">Credit Card No:</h3> 
    <h2 class="card-text"><%=cardNo%></h2>
    <h3 class="card-subtitle mb-2 text-muted">Available Credit Limit:</h3>
    <h2 class="card-text"><%=cardbalance%></h2>
     </div>
</div>
    <form action="UseCardServlet">
    <br/>
    <div class="form-outline mb-4">
    <label class="form-label" for="form3Example4">Enter amount: </label>
    <input type="number" id="form3Example4" class="form-control" placeholder="Enter amount" step="0.01" min=1 max=<%=cardbalance%> name="amount">
    </div>
    <br/>
    <%if(uuauth == null || uuauth){ %>
    <div class="form-outline mb-4">
      <label class="form-label" for="form3Example4">Password</label>
      <input type="password" id="form3Example4" class="form-control" placeholder="Enter your password" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
    </div>
    <%}else{%>
    	<div class="form-outline mb-4">
        <label class="form-label" for="form3Example4">Password</label>
        <input style="display: inline;width: 400px; margin: 10px;" placeholder="Enter your password" type="password" id="form3Example4" class="form-control is-invalid" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
      </div>
       <p style = color:red > Invalid credentials or amount</p>
    <%
    }
    %>
    <button type="submit" class="btn btn-primary btn-block mb-4">
         Get Credit to my account.
    </button>
    </form>
    </div>
    </div>
    </div>
    </section>
</body>
</html>