<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>news</title>
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
			<strong>News</strong>
		</p>
		<form method="post" action="/ecollege/News" onsubmit="">
			<table class="decor" ;border=2>
				<tr>
					<th style="font-size: x-large;">Title-</th>
					<th><input type="text" placeholder="Enter Subject"
						required="required" id="txttitle" name="txttitle"></th>
				</tr>
				<tr>
					<th style="font-size: x-large;">Text:-</th>
					<th><textarea rows="6" cols="20" placeholder="Enter News"
							required="required" id="txtarea" name="txtarea"></textarea></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>