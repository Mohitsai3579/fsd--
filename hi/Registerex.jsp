<%@ page import="java.sql.*" %>
<%
		
		String fname=request.getParameter("name");
		String femail=request.getParameter("email");
		Long fphno=Long.parseLong(request.getParameter("phonenumber"));
		String faddr=request.getParameter("addr");
		int fage=Integer.parseInt(request.getParameter("age"));
		String fgender=request.getParameter("gender");
		
		
		try
		{
 			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
			String qry="insert into football values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setString(1,fname);
			pstmt.setString(2,femail);
			pstmt.setLong(3,fphno);
			pstmt.setString(4,faddr);
			pstmt.setInt(5,fage);
			pstmt.setString(6,fgender);
			
			pstmt.executeUpdate();
	
			con.close();
			
		}
		catch (Exception e)
		{
			out.print(e);
		}
		
	
%>
<h1>Data submitted success click the below link to check data</h1>
<br>
<a href="Profile.jsp">PROFILE</a>
<br>
<h2>To Logout click below link</h2>

<a href="Logout.jsp">Logout</a>
<br>

<h3>To goto Main page click the below link</h3>
<a href="index2.html">CLUB</a>