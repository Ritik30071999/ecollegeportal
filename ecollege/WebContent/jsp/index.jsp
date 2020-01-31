<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="ecollege.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index</title>
<link rel="stylesheet" type="text/css" href="/ecollege/css/style.css">
<script>
	function changePic() {
		var data = document.getElementById("img1")
		data.src = "/ecollege/images/sj.jpeg"
	}
	function rollPic() {
		var data = document.getElementById("img1")
		data.src = "/ecollege/images/sh.jpeg"
	}
	function say() {
		alert("hello user")
	}
	var col = new Array(2)
	col[0] = "blue"
	col[1] = "green"
	index = 0
	function changeColor() {
		document.getElementById("heading").style.color = col[index]
		index++

		if (index > 1)
			index = 0

		setTimeout("changeColor()", 1000)

	}
</script>
</head>
<body bgcolor="pink" onload="say();changeColor()">
	<%
		String em = getInitParameter("email");
		String ph = getInitParameter("phone");
	%>
	<h3><%=em%>
		<%=ph%></h3>
	<div
		style="width: 100%; height: 100px; background-color: white; float: left;">
		<span id="heading"
			style="margin-left: 400px; color: red; text-transform: capitalize; text-decoration: underline; font-size: 20px;">Ecollege
			welcomes you!</span>
		<table style="margin-top: 30px;" cellspacing="20";">
			<tr>
				<th><a href="/ecollege/jsp/login.jsp">Login</a></th>
				<th><a href="/ecollege/html/facilties.html">Facilities</a></th>
				<th><a href="/ecollege/html/aboutstaff.html">Staff</a></th>
				<th><a href="/ecollege/jsp/registration.jsp">Registration</a></th>
				<th><a href="/ecollege/jsp/feedback.jsp">Feedback</a></th>
				<th><a href="/ecollege/html/aboutus.html">About Us</a></th>
			</tr>
		</table>
	</div>
	<div
		style="width: 30%; height: 900px; background-color: green; float: left;">
		<h2
			style="text-align: center; color: red; text-transform: capitalize; text-decoration: underline;">Left</h2>
		<div style="width: 100%; height: 450px;">
			<img id="img1" src="/ecollege/images/sh.jpeg"
				style="width: 100%; height: 100%" onmouseover="changePic()"
				onmouseout="rollPic()">
		</div>
		<%
			String strsql = "select * from news order by date desc limit 5";
			ResultSet rs = CrudOperation.getData(strsql);
		%>
		<marquee direction="up" onmouseover="this.stop()"
			onmouseout="this.start()">
			<ul style="list-style-type: none;">
				<%
					while (rs.next()) {
						int id = rs.getInt("newsid");
				%>
				<li><a href="/ecollege/jsp/viewnews.jsp?nid=<%=id%>"><%=rs.getString("title")%></a></li>
				<%-- <li><a href="#"><%=rs.getInt("newsid")%></a></li> --%>
				<%
					}
				%>
			</ul>
		</marquee>
	</div>
	<div
		style="width: 70%; height: 900px; background-color: purple; float: left">
		<h2
			style="text-align: center; color: red; text-transform: capitalize; text-decoration: underline;">Right</h2>
	</div>
	<div
		style="width: 100%; height: 60px; background-color: yellow; float: left">
	</div>
</body>
</html>