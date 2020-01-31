<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*,java.io.*"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>demojsp</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<%!String msg = "spread the joy of learning";%>
	<%!void show() {
	}%>
	<%
		String name = "scott";
		name = name.toUpperCase();
	%>
	<h2 style="color: red">
		<%=name%>
	</h2>
	<%
		String[] nm = { "scott", "smith" };
		String[] course = { "java", "advjava" };
	%>
	<table>
		<tr>
			<th>Name</th>
			<th>Course</th>
		</tr>
		<%
			for (int i = 0; i < nm.length; i++) {
		%>
		<tr>
			<th><%=nm[i]%></th>
			<th><%=course[i]%></th>
			<%
				}
			%>
		</tr>
	</table>
</body>
</html>