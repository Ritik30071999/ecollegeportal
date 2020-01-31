<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ecollege.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewstudents</title>
<link rel="stylesheet" type="text/css"
	href="/ecollege/bs/bootstrap.min.css">
<script src="/ecollege/bs/bootstrap.min.js"></script>
<script src="/ecollege/bs/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%
		HttpSession hs = request.getSession(false);
		String studentid = (String) hs.getAttribute("sessionkey");
		if (studentid == null || hs.isNew()) {

		} else {
	%>
	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
		<!-- Brand -->
		<a class="navbar-brand" href="#"> <img
			src="/ecollege/images/college.jpg" alt="logo" style="width: 40px;">
		</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="/ecollege/jsp/adminhome.jsp">Admin Home</a></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Message </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/ecollege/jsp/compose.jsp">Compose</a>
					<a class="dropdown-item" href="/ecollege/jsp/inbox.jsp">Inbox</a> <a
						class="dropdown-item" href="/ecollege/jsp/sentitem.jsp">Sent
						Item</a>
				</div></li>

			<li class="nav-item"><a class="nav-link"
				href="/ecollege/jsp/studentregistration.jsp">Create Account </a></li>
			<li class="nav-item"><a class="nav-link"
				href="/ecollege/jsp/deleteaccount.jsp">Delete Account</a>
			<li class="nav-item"><a href="/ecollege/LogOff"><span
					class="nav navbar-nav navbar-right"></span>Log Out</a></li>


		</ul>
	</nav>
	<div
		style="width: 100%; height: 900px; background-color: orange; float: left">
		<table border=2 style="margin-left: 100px; margin-top: 100px">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone No.</th>
				<th>Course</th>
				<th>Gender</th>
			</tr>
			<%
				String strsql = "select * from studentregistration";
					ResultSet rsdata = CrudOperation.getData(strsql);
					while (rsdata.next()) {
						String name = rsdata.getString("name");
						String email = rsdata.getString("email");
						String phone = rsdata.getString("phone");
						String gender = rsdata.getString("gender");
						String course = rsdata.getString("course");
			%>
			<tr>
				<th><%=name%></th>
				<th><%=email%></th>
				<th><%=phone%></th>
				<th><%=course%></th>
				<th><%=gender%></th>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		}
	%>
	<script src="/ecollege/bs/bootstrap.min.js"></script>
	<script src="/ecollege/bs/jquery-3.4.1.min.js"></script>
</body>
</html>