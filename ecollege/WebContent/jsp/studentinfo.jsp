<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="st" class="ecollege.beans.Student" scope="request"></jsp:useBean>
	<h2>Name is <jsp:getProperty property="name" name="st"/></h2>
	<h2>Course is <jsp:getProperty property="course" name="st"/></h2>
	<h2>RollNumber is <jsp:getProperty property="roll" name="st"/></h2>

</body>
</html>