<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ecollege.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>editprofile</title>
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
					String email = rsdata.getString("email");
					String phone = rsdata.getString("phone");
					String pass = rsdata.getString("password");
		%>
		<form method="post" action="/ecollege/St_EditProfile">
			<table border=2 style="margin-left: 100px; margin-top: 100px">
				<tr>
					<th>Email</th>
					<th><input type="email" value="<%=email%>" name="txtemail"></th>
				</tr>
				<tr>
					<th>Password</th>
					<th><input type="text" value="<%=pass%>" name="txtpass"></th>
				</tr>
				<tr>
					<th>Phone No.</th>
					<th><input type="number" value="<%=phone%>" name="txtphone"></th>
				</tr>
				<tr>
					<th colspan="2" align="center"><button type="submit">Update</button></th>
				</tr>
			</table>
		</form>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</body>
</html>