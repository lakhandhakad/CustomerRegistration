
<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.DatabaseClass"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page" />
<%
	if (request.getParameter("page").toString().equals("login")) {
		if (pDAO.loginValidate(request.getParameter("username").toString(),
				request.getParameter("password").toString())) {
			session.setAttribute("userStatus", "1");
			session.setAttribute("userId",(request.getParameter("username")));
			response.sendRedirect("profile.jsp");

		} else {
			request.getSession().setAttribute("userStatus", "-2");
			response.sendRedirect("login.jsp");
		}
		

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
		response.sendRedirect("login.jsp");
	} 
    

	 else if (request.getParameter("page").toString().equals("logout")) {
		
	}
	 
	 else if (request.getParameter("page").toString().equals("search")) {
	    String fName=request.getParameter("firstname");
	    ArrayList nameList=pDAO.search(fName);
	    System.out.print("Controller "+nameList.get(0));
	    session.setAttribute("findlist", nameList);
	    request.setAttribute("nameList", nameList);
	    response.sendRedirect("searchResult.jsp");
	 }

	 else if(request.getParameter("page").toString().equals("profile")) {
		 if (request.getParameter("operation").toString().equals("del")) {
				pDAO.delUser(Integer.parseInt(request.getParameter("partyId").toString()));
				response.sendRedirect("profile.jsp");
			}

	 }

	 
%>