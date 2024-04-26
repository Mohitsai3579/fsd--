<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Player Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            height: 150px;
            width: 150px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Player Details</h1>
        <hr>
        <table>
            <tr>
                <th>NAME</th>
                <th>DESCRIPTION</th>
                <th>IMAGE</th>
            </tr>
            <%  String uname = (String)session.getAttribute("user");
				if(uname != null)
				{
					String pname=request.getParameter("name");
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
						String qry="select * from biodata where name= ? ";
						PreparedStatement pst = con.prepareStatement(qry);
						pst.setString(1, pname);
						ResultSet rs=pst.executeQuery();
						while(rs.next()) {
				%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><img src='<%= rs.getString(3) %>'></td>
							</tr>
				<% 
						}
						con.close();
					} catch (Exception e) {
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
        </table>
    </div>
</body>
</html>
