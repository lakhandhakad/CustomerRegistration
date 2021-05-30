
<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.DatabaseClass"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page" />
<%
	if (request.getParameter("page").toString().equals("login")) {
		
		

	} else if (request.getParameter("page").toString().equals("register")) {

		String fName = request.getParameter("fname");
		String lName = request.getParameter("lname");
		String uName = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String contactNo = request.getParameter("contactno");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String state= request.getParameter("state");
		String zip= request.getParameter("zip");

		pDAO.addNewUser(fName, lName, uName, pass, contactNo, city, address,state,zip);
	} 

	 else if (request.getParameter("page").toString().equals("logout")) {
		
	}
%>