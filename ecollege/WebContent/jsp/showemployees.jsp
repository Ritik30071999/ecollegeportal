<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,ecollege.dbtasks.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show employees</title>
</head>
<body>
	<%
		String id = request.getParameter("did");
		String strsql = "select * from employee where deptid=?";
		ResultSet rs = CrudOperation.getData(strsql, id);
	%>
	<table>
		<tr>
			<th>Name</th>
			<th>Salary</th>
			<th>EmpID</th>
		</tr>
		<%
			while (rs.next()) {
				String name = rs.getString("name");
				String empid = rs.getString("empid");
				String salary = rs.getString("salary");
		%>
		<tr>
			<th><%=name%></th>
			<th><%=salary%></th>
			<th><%=empid%></th>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>