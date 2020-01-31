<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>demo2</title>
</head>
<body>
	<div class="container">
		<h2>Hello JSP</h2>
		<%
			String[] nm = { "Smith", "Scott" };
			String[] course = { "Java", "AdvJava" };
		%>

		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Course</th>
				</tr>
			</thead>
			<%
				for (int i = 0; i < nm.length; i++) {
			%>
			<tbody>
				<tr>
					<th><%=nm[i]%></th>
					<th><%=course[i]%></th>
					<%
						}
					%>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>