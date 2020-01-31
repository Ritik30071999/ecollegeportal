<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,ecollege.dbtasks.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dept</title>
<script src="/ecollege/bs/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function()

	{

		//alert("in fun")

		$("#deptinfo").change(function() {
			var di = this.value;
			//alert(di);

			$.get("/ecollege/jsp/showstudents.jsp", {
				did : di

			}, function(data, status) {
				/* var arr=data.split(",");
					var name=arr[0];
					var email=arr[1];
				document.getElementById("txtname").value=name;     		
				//alert(data) */
				$("#div1").html(data);

				$("#div1").show();

			});

		});

	});
</script>
</head>
<body>
	<select name="dept" id="deptinfo">
		<option value="def">select dept</option>
		<%
			Connection con = CrudOperation.createConnection();
			String strsql = "select * from department";
			ResultSet rs = CrudOperation.getData(strsql);
			while (rs.next()) {
		%>
		<option value="<%=rs.getInt("deptid")%>">
			<%=rs.getString("name")%></option>

		<%
			}
		%>


	</select>
	<div id="div1"
		style="background-color: grey; display: none; width: 300px; height: 200px; overflow: scroll;"></div>
</body>
</html>