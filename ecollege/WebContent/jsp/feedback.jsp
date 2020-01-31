<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>feedback</title>
<style>
table.decor {
	width: 50%;
	height: 500px;
	background-color: pink;
	margin-left: 400px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
}
</style>
</head>
<body bgcolor="cyan">
	<div>
		<p style="text-align: center; font-size: xx-large;">
			<strong>Feedback</strong>
		</p>
		<form method="post" action="/ecollege/Feedback" onsubmit="">
			<table class="decor" ;border=2>
				<tr>
					<th style="font-size: x-large;">Name:-</th>
					<th><input type="text" placeholder="Enter Name"
						required="required" id="txtname" name="txtname"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Text:-</th>
					<th><textarea rows="6" cols="20" placeholder="Enter Feedback"
							required="required" id="txtarea" name="txtarea"></textarea></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Email:-</th>
					<th><input type="email" placeholder="Enter Email"
						required="required" id="txtemail" name="txtemail"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>