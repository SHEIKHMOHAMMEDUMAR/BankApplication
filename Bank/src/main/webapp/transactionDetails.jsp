<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
     <%@ page import="com.transactiondetails.TransactionDao,java.sql.ResultSet" %>
<!DOCTYPE html>
<html style="width: 100%; height: 100%;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"/>
<title>Transaction Details</title>
</head>
<body style="width: 100%; height: 100%;">
<% 
TransactionDao td = new TransactionDao(); 
String usr = (String) request.getSession().getAttribute("user");
ResultSet rs = td.transactionDao(usr);
%>	
<x:NavBar isLoggedIn = 'logged' menu = 'transactionDetails' usr = "<%=usr%>" account ='true'></x:NavBar>
<%if(rs.next()){%>
<section style="width: 100%; height: 100%;">
<div style="text-align: center; background-color: hsl(0, 0%, 96%); padding-top: 48px;">
<input type="button" onclick="generate()" value="Export To PDF" class="btn btn-primary" style="padding: 10px; display: inline; border: none; float: center;"/>
</div>
  <div class="px-4 py-5 px-md-5 text-lg-start" style="width: 100%; height: 100%; background-color: hsl(0, 0%, 96%);">
    <div class="container">
    <div class="bg-primary text-center" style="border-radius: 5px 5px 0 0; padding: 10px;">
      	<h1 class="text-white" >Transaction Details</h1>
    	</div>
          <table class="table table-bordered table-hover" id="transactions">
          <thead>
      		<tr>
				<th class="table-dark">Transaction ID</th>
				<th class="table-dark">Account No</th>
				<th class="table-dark">UserName</th>
				<th class="table-dark">Transaction Type</th>
				<th class="table-dark">Date</th>
				<th class="table-dark">Amount</th>
				<th class="table-dark">Balance</th>
			</tr>
			</thead>
			<tbody>
			<% do{
			if(rs.getString(4).equals("Wd") || rs.getString(4).equals("Tr")){
				out.println("<tr>"
		  				+"<td class='table-danger'>"+rs.getString(1)+"</td>"
		  				+"<td class='table-danger'>"+rs.getString(2)+"</td>"
  						+"<td class='table-danger'>"+rs.getString(3)+"</td>"
						+"<td class='table-danger'>"+rs.getString(4)+"</td>"
						+"<td class='table-danger'>"+rs.getString(5)+"</td>"
						+"<td class='table-danger'>"+rs.getString(6)+"</td>"
						+"<td class='table-danger'>"+rs.getString(7)+"</td>"
						+"</tr>");
			}
			else if(rs.getString(4).equals("Cr") || rs.getString(4).equals("De")){
				out.println("<tr>"
		  				+"<td class='table-success'>"+rs.getString(1)+"</td>"
		  				+"<td class='table-success'>"+rs.getString(2)+"</td>"
  						+"<td class='table-success'>"+rs.getString(3)+"</td>"
						+"<td class='table-success'>"+rs.getString(4)+"</td>"
						+"<td class='table-success'>"+rs.getString(5)+"</td>"
						+"<td class='table-success'>"+rs.getString(6)+"</td>"
						+"<td class='table-success'>"+rs.getString(7)+"</td>"
						+"</tr>");
			}
			}while(rs.next());
			%>
			</tbody>
     	</table>
        </div>
      </div>
      </div>
</section>
	<% }
	else{%>
		<div class="text-center">
		<h1 class="text-primary">No Transactions Yet</h1>
		</div>
	<%}
	%>
	<script src="script.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
  
</body>

</html>