<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="ecollege.dbtasks.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee details</title>
<script src="/ecollege/bs/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function()

	{
		$("#cmbdept").change(function() {
			var di = this.value;
			//alert(di);

			$.get("/ecollege/jsp/showemployees.jsp", {
				did : di

			}, function(data, status) {
				//alert(data)
				$("#empdiv").html(data);

				$("#empdiv").show();

			});

		});

	});
</script>
</head>
<body>
	<form>

		<h2>Employee Details</h2>
		<%
			Connection con = CrudOperation.createConnection();
			String strsql = "select * from department";
			ResultSet rsdata = CrudOperation.getData(strsql);
		%>
		<select id="cmbdept" name="cmbdept">
			<option value="default">Select department</option>
			<%
				while (rsdata.next()) {
					String deptid = rsdata.getString("deptid");
					String name = rsdata.getString("name");
			%>
			<option value=<%=deptid%>><%=name%></option>
			<%
				}
			%>
		</select> <br>
		<div id="empdiv"
			style="width: 100%; height: 400px; background-color: cyan; float: left; display: none;"></div>

	</form>
	<div>
		<%
			String strsql2 = "select * from employee where deptid=?";
			ResultSet rsdata2 = CrudOperation.getData(strsql);
		%>
	</div>

</body>
</html>