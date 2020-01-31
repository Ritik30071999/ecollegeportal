<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ecollege.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>studentprofile</title>
</head>
<body>
	<%
		HttpSession hs = request.getSession(false);
		String studentid = (String) hs.getAttribute("sessionkey");
		if (studentid == null || hs.isNew()) {

		} else {
	%>
	<div
		style="width: 100%; height: 80px; background-color: cyan; float: left">
		<span style="color: red; font-size: 30px; float: left">Hello <%=studentid%></span>
		<div style="margin-left: 1400px; margin-bottom: 0px;">
			<a href="/ecollege/LogOff">Log Out</a>
		</div>
	</div>
	<div
		style="width: 20%; height: 900px; background-color: green; float: left">
		<%@include file="/menus/studentmenu.html"%>
	</div>
	<div
		style="width: 80%; height: 900px; background-color: orange; float: left">
		<%
			String strsql = "select * from studentregistration where id=?";
				ResultSet rsdata = CrudOperation.getData(strsql, studentid);
				if (rsdata.next()) {
					String name = rsdata.getString("name");
					String email = rsdata.getString("email");
					String phone = rsdata.getString("phone");
					String gender = rsdata.getString("gender");
					String course = rsdata.getString("course");
		%>
		<table border=2 style="margin-left: 100px; margin-top: 100px">
			<tr>
				<th>Name</th>
				<th><%=name%></th>
			</tr>
			<tr>
				<th>Email</th>
				<th><%=email%></th>
			</tr>
			<tr>
				<th>Phone No.</th>
				<th><%=phone%></th>
			</tr>
			<tr>
				<th>Course</th>
				<th><%=course%></th>
			</tr>
			<tr>
				<th>Gender</th>
				<th><%=gender%></th>
			</tr>
		</table>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</body>
</html>