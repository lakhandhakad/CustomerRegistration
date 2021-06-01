<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search User</title>
</head>

<body>

      <form method='get' action="controller.jsp" class="search" >
         <input type="hidden" name="page" value="search">
        First Name <input type="text" required="required" name="firstname"> <span
				data-placeholder="firstname"></span>
		<br>
      
         <input type="submit" class="logbtn" value="Search">
      </form>
</body>
</html>