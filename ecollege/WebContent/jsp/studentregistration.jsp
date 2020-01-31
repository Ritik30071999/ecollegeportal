<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>studentregistration</title>
<script src="/ecollege/bs/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function()

	{

		//alert("in fun")

		$("#txtuserid").blur(function() {
			var sid = this.value;
			//alert(sid);

			$.get("/ecollege/StudentRegistration", {
				studentid : sid

			}, function(data, status) {
				/* var arr=data.split(",");
					var name=arr[0];
					var email=arr[1];
				document.getElementById("txtname").value=name;     		
				//alert(data) */
				//$("#div1").html(data);
				$("#check").html(data);

				//$("#div1").show();

			});

		});

	});
</script>
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
	function main() {

		flag = true

		var userid = document.getElementById("txtuserid").value
		var userpass = document.getElementById("txtuserpass").value
		var username = document.getElementById("txtusername").value
		var useremail = document.getElementById("txtuseremail").value
		var userphone = document.getElementById("txtuserphone").value
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

		if (checkEmpty(username) == false) {
			//alert("Username Required")
			document.getElementById("msgusername").innerHTML = "Username Required"
			flag = false
		}

		if (checkEmpty(useremail) == false) {
			//alert("Email Required")
			document.getElementById("msguseremail").innerHTML = "Email Required"
			flag = false
		}

		if (checkEmpty(userphone) == false) {
			//alert("PhoneNo Required")
			document.getElementById("msguserphone").innerHTML = "PhoneNo. Required"
			flag = false
		}
		return flag

	}
</script>
</head>
<body bgcolor="cyan">
    <h2 id="check" style="color: red"></h2>
	<p style="font-size: xx-large; text-align: center; color: blue;">
		<strong>Student Registration</strong>
	</p>
	<div>
		<form method="post" action="/ecollege/StudentRegistration"
			onsubmit="return main()">
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
						id="txtusername" name="txtusername"></th>
					<th><span id="msgusername" style="color: red"></span></th>
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
					<th style="font-size: x-large;"><label>Course</label></th>
					<th><select id="cmbcourse" name="cmbcourse">
							<option value="btech">B.Tech</option>
							<option value="bca">BCA</option>
							<option value="mca">MCA</option>
					</select></th>
				<tr>
					<th style="font-size: x-large;"><label>Gender:-</label></th>
					<th><input type="radio" name="gender" value="male">Male</th>
					<th><input type="radio" name="gender" value="female">Female</th>
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