<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/navBar.tld" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Example</title>
</head>
<body>
<% String usr = "Umar"; %>
	<x:NavBar isLoggedIn = 'logged' menu = 'none' usr="<%=usr %>" account = 'false'></x:NavBar>
</body>
</html>