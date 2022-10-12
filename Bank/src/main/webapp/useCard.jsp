<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
    <%@ page import="com.creditcard.CreditCardShowDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Use Card</title>
</head>
<body>
<% 
CreditCardShowDao ccsd = new CreditCardShowDao(); 
String usr = (String) request.getSession().getAttribute("user");
Boolean uuauth = (Boolean) request.getSession().getAttribute("uuauth");
ResultSet rs = ccsd.creditCardShowDao(usr);
rs.next();
String cardName = rs.getString(1);
String cardNo = rs.getString(2).substring(0, 4)+"_"+rs.getString(2).substring(4, 8)+"_"+rs.getString(2).substring(8, 12);
String cardCVV = rs.getString(3);
double cardbalance = rs.getDouble(4);
System.out.println(cardNo);
%>
<x:NavBar isLoggedIn = 'logged' menu= 'creditCard' usr = "<%=usr%>" account ='true'></x:NavBar>
<section class="">
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    <div class="container">
    <div class="row gx-lg-5 align-items-center" style="display: block">
    <h1><%= cardName%></h1>
    <br/>
    <h1 style="display: inline"><%= cardNo%></h1>
    <br/>
    <h1 style="display: inline"><%= cardbalance%></h1>
    <form action="UseCardServlet">
    <br/>
    <p style="display: inline;width: 50px"><input type="number" step="0.01" min=1 max=<%=cardbalance%> name="amount"></p>
    <br/>
    <%if(uuauth == null || uuauth){ %>
    <div class="form-outline mb-4">
      <label class="form-label" for="form3Example4">Password</label>
      <input style="display: inline;width: 400px; margin: 10px;" type="password" id="form3Example4" class="form-control" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
    </div>
    <%}else{%>
    	<div class="form-outline mb-4">
        <label class="form-label" for="form3Example4">Password</label>
        <input style="display: inline;width: 400px; margin: 10px;" type="password" id="form3Example4" class="form-control is-invalid" name = "pwd" value="<%= (request.getParameter("pwd") == null) ? "" : request.getParameter("pwd")%>"/>
      </div>
       <p style = color:red > Invalid credentials or amount</p>
    <%
    }
    %>
    <button style="display: inline;width: 400px; margin-left: 70px;" type="submit" class="btn btn-primary btn-block mb-4">
         Get Credit to my account.
    </button>
    </form>
    </div>
    </div>
    </div>
    </section>
</body>
</html>