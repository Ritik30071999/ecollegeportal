<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>jsp action tags</title>
</head>
<body>
	<%-- <%@include file=""%> --%> <!-- ->>at the time of translation of page --><!-- used to attaching a static page like html pages -->
	<%-- <jsp:include page=""></jsp:include> --%> <!-- ->>attaches at the runtime of page --><!-- used to attaching a dynamic page like jsp pages -->
	<%-- <jsp:forward page=""></jsp:forward> --%> <!-- used to forward one page to another -->
	
    <jsp:useBean id="st" class="ecollege.beans.Student" scope="request"></jsp:useBean>
    <jsp:setProperty property="course" name="st" value="java"/>
    <jsp:setProperty property="name" name="st" value="scott"/>
    <jsp:setProperty property="roll" name="st" value="101"/>
    
    <jsp:forward page="/jsp/studentinfo.jsp"></jsp:forward>
</body>
</html>