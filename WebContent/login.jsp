<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Customer Registration - Login</title>
<link rel="stylesheet" href="css/login-style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	charset="utf-8"></script>

</head>
<body>

	<form method='post' action="controller.jsp" class="login-form">
		<input type="hidden" name="page" value="login">

		<h1>Login</h1>

		<div class="txtb">
			<input type="text" required="required" name="username"> <span
				data-placeholder="Username"></span>
		</div>

		<div class="txtb">
			<input type="password" name="password"> <span
				data-placeholder="Password"></span>
		</div>

		<input type="submit" class="logbtn" value="Login">
		<br>
		<a href="http://localhost:8080/CustomerRegistration/register.html">Register</a>


		<%
			if (request.getSession().getAttribute("userStatus") != null) {
				System.out.println("its called");
				if (request.getSession().getAttribute("userStatus").equals("-2")) {
					System.out.println("now inside");
		%>
		<script>
			alert("Username or Password is incorrect");
		</script>

		<br>
		<%
			}
			}
		%>

	</form>

	<script type="text/javascript">
		$(".txtb input").on("focus", function() {
			$(this).addClass("focus");
		});

		$(".txtb input").on("blur", function() {
			if ($(this).val() == "")
				$(this).removeClass("focus");
		});
	</script>
</body>
</html>