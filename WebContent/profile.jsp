<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
</head>
<body>
      	
          <%
          String s=null;
         try
         { 
        	 s=session.getAttribute("userStatus").toString();
        	 System.out.print(s);
             if(s.equals("-1"))
             { %>
     	    <h1>Not Authorized</h1>
     	    <a href="http://localhost:8080/CustomerRegistration/login.jsp">Login First</a> 
   <% 
     	  
       }
       System.out.print(s);
	   
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
        	 s=session.getAttribute("userStatus").toString();
        	 System.out.print(s);
             if(s.equals("1"))
             { %>
     	    <h1>Hello User</h1>
     	    <a href="http://localhost:8080/CustomerRegistration/login.jsp " <%session.setAttribute("userStatus", "-1"); %>>Logout</a>
   <% 
     	  
       }
       System.out.print(s);
	   
         }
         catch(NullPointerException e){
        	  %>
        	  
        <% 
          }
         %> 
        	 
 
</body>
</html>