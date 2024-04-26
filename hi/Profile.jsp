<%@ page import="java.sql.*" %>

    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        center {
            margin-top: 50px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            color: #007bff;
            text-decoration: none;
            margin: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        h1 {
            color: #333333;
        }
    </style>

    <center>
        <h1>Welcome to Profile</h1>
		<style>
		.profile-container {
		  flex: 2;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		.profile-picture {
		  width: 72px;
		  height: 72px;
		  border-radius: 50%;
		  object-fit: cover;
		}
	</style>
	
				<div class="profile-container">
					<img class="profile-picture" src="img/profile.jpeg" alt="">
				</div>
				<br>
        <a href="index2.html">Click here to go to Main Page</a>
        <a href="Logout.jsp">Logout</a>
		<br>

		<hr>

<%
			String uname = (String)session.getAttribute("user");
			if(uname != null)
			{

				out.println("Welcome  "  + uname+"  This is your Profile");


				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
					String qry="select * from football";
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery(qry);

					out.print("<h2>The Details</h2>");
					out.print("<table>");
					out.print("<tr> <th>NAME</th> <th>Email</th> <th>PHNO</th> <th>Address</th> <th>Age</th> <th>Gender</th> </tr>");
					while(rs.next())
					{
						out.print("<tr>");
						out.print("<td>"+rs.getString(1)+"</td>");
						out.print("<td>"+rs.getString(2)+"</td>");
						out.print("<td>"+rs.getLong(3)+"</td>");
						out.print("<td>"+rs.getString(4)+"</td>");
						out.print("<td>"+rs.getInt(5)+"</td>");
						out.print("<td>"+rs.getString(6)+"</td>");
						out.print("</tr>");
					}
					out.print("</table>");
					con.close();
				}
				catch (Exception e)
				{
					out.print(e);
				}
			}
			else
			{
				out.println("please login first");
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				rd.include(request, response);
			}
%>
</center>

