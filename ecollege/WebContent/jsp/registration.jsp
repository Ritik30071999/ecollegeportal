<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>
<style>
table.decor {
	width: 50%;
	height: 700px;
	background-color: pink;
	margin-left: 400px;
	border-style: solid;
	border-color: red;
	border-radius: 20px;
}
</style>
<script src="/ecollege/js/validation.js"></script>
<script type="text/javascript">
	function main1() {
		flag = true
		var p = document.getElementById("txtuserid").value
		//alert(p)
		if (checkEmpty(p) == false) {
			//alert("UserID needed")
			document.getElementById("msguserid").innerHTML = "UserId Required"
			flag = false
		}
		p = document.getElementById("txtuserpass").value
		if (checkEmpty(p) == false) {
			document.getElementById("msguserpass").innerHTML = "Password Required"
			flag = false
		}
		p = document.getElementById("txtusercname").value
		if (checkEmpty(p) == false) {
			document.getElementById("msgusercname").innerHTML = "Company Name Required"
			flag = false
		}
		p = document.getElementById("txtuseremail").value
		if (checkEmpty(p) == false) {
			document.getElementById("msguseremail").innerHTML = "Email Required"
			flag = false
		}
		p = document.getElementById("txtuserphone").value
		if (checkEmpty(p) == false) {
			document.getElementById("msguserphone").innerHTML = "Phone No. Required"
			flag = false
		}

		return flag
	}
	function main2() {

		var arr = document.getElementsByName("industry").value
		var chkarr = document.getElementsByName("chk").value
		if (checkControls(arr) == false) {
			document.getElementById("").innerHTML = "Atleast one checkbox required"
		}
	}
	function main3() {

		var city = document.getElementById("cmbcity").value
		if (checkCombo(city) == false) {
			document.getElementById("").innerHTML = "Select atleast one city"
		}

	}
/* 	function showText(x) {
		var info = document.getElementById("cmbcity").value
		if (info == "others") {
			document.getElementById("").style.display = 'block'
		} else {
			document.getElementById("").style.display = 'none'
		}
	} */
		function selectOther() {
			var info = document.getElementById("cmbcity").value
			if (info == "others") {
				document.getElementById("othercity").style.display = 'block'
			}
			else {
				document.getElementById("othercity").style.display = 'none'
			}

		}
</script>
</head>
<body bgcolor="Red">
	<p style="font-size: xx-large; text-align: center; color: blue;">
		<strong>Registration Form</strong>
	</p>
	<div>
		<form method="post" action="/ecollege/Registration"
			onsubmit="return main1()">
			<table class="decor">
				<tr>
					<th style="font-size: x-large;"><label>Id:-</label></th>
					<th><input type="text" placeholder="Enter College Student ID"
						id="txtuserid" name="txtuserid"></th>
					<th><span id="msguserid" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>Password:-</label></th>
					<th><input type="password" placeholder="Enter Password"
						id="txtuserpass" name="txtuserpass"></th>
					<th><span id="msguserpass" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>Company Name:-</label></th>
					<th><input type="text" placeholder="Enter Company Name"
						id="txtusercname" name="txtusercname"></th>
					<th><span id="msgusercname" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>Email:-</label></th>
					<th><input type="email" placeholder="Enter Email"
						id="txtuseremail" name="txtuseremail"></th>
					<th><span id="msguseremail" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>PhoneNo.:-</label></th>
					<th><input type="text" placeholder="Enter Phone No."
						id="txtuserphone" name="txtuserphone"></th>
					<th><span id="msguserphone" style="color: red"></span></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>City:-</label></th>
					<th><select id="cmbcity" name="cmbcity"
						onchange=" selectOther()">
							<option value="default">Select City</option>
							<option value="lucknow">Lucknow</option>
							<option value="agra">Agra</option>
							<option value="kanpur">Kanpur</option>
							<option value="gorakhpur">Gorakhpur</option>
							<option value="varanasi">Varanasi</option>
							<option value="others">Others</option>
					</select></th>
					<th><textarea placeholder="Please Specify" id="othercity" style="display:none"></textarea></th>
				</tr>
				<tr>
					<th style="font-size: x-large;"><label>Industry:-</label></th>
					<th><input type="radio" name="industry" value="startup">StartUp</th>
					<th><input type="radio" name="industry" value="preestablished">Pre-Established</th>
				</tr>
				<tr>
					<th><input type="reset"> Reset the form</th>
					<th colspan="2"><button type="submit">Submit</button></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>