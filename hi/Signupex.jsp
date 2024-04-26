<%@ page import="java.sql.*" %>
<%
		
		String un=req.getParameter("username");
		
		String pass=req.getParameter("password");

		
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

			String qry = "insert into footsignup values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(qry);
		
			pstmt.setString(1,un);
			
			pstmt.setString(2,pass);
			

			pstmt.executeUpdate();

			out.print("Username and password saved successfull please Login");
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.include(req, res);
		}
		catch(Exception e)
		{
			out.print(e);
		}
		

%>