<%@ page import="java.sql.*" %>
  
<%

		String uname = request.getParameter("uname");
		String password = request.getParameter("psw");
		try
		{
			// Loading the Driver class
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "System", "manager");

			String query = "SELECT * FROM footsignup WHERE username = ? AND password = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, uname);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();

			if (rs.next())
			{
				session.setAttribute("user",uname);
				RequestDispatcher rd = request.getRequestDispatcher("index2.html");
				rd.forward(request, response);
			}
			else
			{
	
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				rd.include(request, response);
			}

			
		}
		catch (SQLException | ClassNotFoundException e)
		{
			 e.printStackTrace();
		}

     		
		
  
%>