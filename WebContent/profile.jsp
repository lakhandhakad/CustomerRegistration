<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
</head>
<body>
      	
          <%
          String userStatus=null;
         try
         { 
        	 userStatus=session.getAttribute("userStatus").toString();
        	 System.out.print(userStatus);
             if(userStatus.equals("-1"))
             { %>
     	    <h1>Not Authorized</h1>
     	    <a href="http://localhost:8080/CustomerRegistration/login.jsp">Login First</a> 
   <% 
     	  
       }
       
	   
         }
         catch(NullPointerException e){
        	  %>
        	  <a href="http://localhost:8080/CustomerRegistration/login.jsp">Login First</a>
        <% 
          }
         %>
         
    <%
          
         try
         { 
        	 userStatus=session.getAttribute("userStatus").toString();
        	
             if(userStatus.equals("1"))
             { %>
            
     	    <h1>Hello User</h1>
     	    <div class="panel" style="max-width: 420px; float: left">
		<div class="title">All Users</div>
		<table id="one-column-emphasis"
			style="min-width: 400px; margin: 5px; margin-top: 35px">
			<colgroup>
				<col class="oce-first" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">PartyId</th>
					<th scope="col">FirstName</th>

					<th scope="col">Last Name</th>
					<th scope="col">Action</th>

				</tr>
			</thead>


			<%
				ArrayList userList = pDAO.getAllUsers();
				for (int i = 0; i < userList.size(); i = i + 3) {
			%>
			<tr>
				<td><%=userList.get(i)%></td>
				<td><%=userList.get(i + 1)%></td>
				<td><%=userList.get(i + 2)%></td>
				<td><a
					href="controller.jsp?page=profile&operation=del&partyId=<%=userList.get(i)%>"
					onclick="return confirm('Are you sure you want to delete this ?');"
					class="del">
						<div class="delete-btn"
							style="max-width: 40px; font-size: 17px; padding: 3px">X</div>
				</a></td>
			</tr>
			<%
				}
			%>
		</table>
     	    <a href="http://localhost:8080/CustomerRegistration/search.jsp">Search User</a>
     	    <a href="http://localhost:8080/CustomerRegistration/login.jsp " <%session.setAttribute("userStatus", "-1"); %>>Logout</a>
   <% 
     	  
         }
       
	   
         }
         catch(NullPointerException e){
        	  %>
        	  
        <% 
          }
         %> 
        	 
 
</body>
</html>