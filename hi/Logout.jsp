<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
		session.removeAttribute("user");

		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request, response);
		

		out.print("You are successfully logged out!");
		out.close();
%>