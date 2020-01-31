<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<style>
table.decor {
	width: 50%;
	height: 300px;
	background-color: pink;
	margin-left: 400px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
}
</style>
<script src="/ecollege/js/validation.js"></script>
<script type="text/javascript">
	function main() {

		flag = true

		var userid = document.getElementById("txtuserid").value
		var userpass = document.getElementById("txtuserpass").value
		//alert(userid+userpass)//only for testing

		if (checkEmpty(userid) == false) {
			//alert("UserId Needed")
			document.getElementById("msguserid").innerHTML = "UserId Required"
			flag = false
		}

		if (checkEmpty(userpass) == false) {
			//alert("Password Required")
			document.getElementById("msguserpass").innerHTML = "Password Required"
			flag = false
		}
		return flag

	}
</script>
</head>
<body bgcolor="cyan">
	<%
		String userid = "";
		String userpass = "";
/* 		Cookie[] ck = request.getCookies();
		if (ck.length > 0) {
			String contents = null;
			Cookie cookie;
			for (int i = 0; i < ck.length; i++) {
				cookie = ck[i];
				String name = cookie.getName();
				if (name.equals("userinfo")) {
					contents = cookie.getValue();
					break;
				}

			}
			String[] data = contents.split("@");
			userid = data[0];
			userpass = data[1];
			System.out.println(id);
			System.out.println(pass); */
		String info = (String) request.getAttribute("msg"); //narrowcasting or downcasting
	%>
	<div>
		<p style="text-align: center; font-size: xx-large;">
			<strong>Login Page</strong>
		</p>
		<form method="post" action="/ecollege/Login" onsubmit="return main()">
			<table class="decor">
				<tr>
					<th style="font-size: x-large;"><label>UserName:-</label></th>
					<th><input type="text" placeholder="Enter UserName"
						id="txtuserid" name="txtuserid" value="<%=userid%>"></th>
					<th><span id="msguserid" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>Password:-</label></th>
					<th><input type="password" placeholder="Enter Password"
						id="txtuserpass" name="txtuserpass" value="<%=userpass%>"></th>
					<th><span id="msguserpass" style="color: red"></span></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
		<%
			if (info != null) {
		%>
		<h3 style="color: red; text-align: center;"><%=info%></h3>
		<%
			}
		%>
	</div>
</body>
</html>