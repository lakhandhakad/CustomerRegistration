<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Result</title>
</head>
<body>
<h>Users Searched</h>
<% 
   
  ArrayList nameList=(ArrayList)session.getAttribute("findlist");
  if(nameList!=null)
  {
  
   for(int i=0;i<nameList.size();i++)
   {
 %>
   <br>
   <%= nameList.get(i)  %>
 <%}
   }%>
   
 <br>
 <a href="http://localhost:8080/CustomerRegistration/search.jsp">For More User Search</a>
 <a href="http://localhost:8080/CustomerRegistration/profile.jsp">Profile</a>
 
</body>
</html>