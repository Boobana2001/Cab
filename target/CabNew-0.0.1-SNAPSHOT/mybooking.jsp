<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
      <%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Booking</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
<script type="text/javascript" src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
<script src="validate.js"></script>
</head>
<body>
<% 
Class.forName("org.postgresql.Driver");
Connection dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
Statement statement = dbcon.createStatement();
String cid = request.getParameter("cid");
ResultSet rs = statement.executeQuery("select * from booking where cid= '" + cid + "'");
out.println(
		"<html><head><style>  table{margin-left:200px;}</style></head><table height='300' width='1000'  border='5px'>");
out.println(
		"<tr><td><b>ID</b></td> <td><b>Time</b></td> <td><b>Date</b></td> <td><b>Pickup Point</b></td> <td><b>Destination</b></td>  </tr>");

while (rs.next()) {

	out.println("<tr><td>" + rs.getInt("cid") + "</td><td>" + rs.getString("time") + "</td><td>"
			+ rs.getString("date") + "</td><td>" + rs.getString("dept") + "</td><td>"
			+ rs.getString("arrival") + "</td></tr>");
}

out.println("</table><br><br><br><br>");
out.println("</body></html>");
%>
<input type="hidden" id="cid" name="cid" value="<%=cid%>" >
<center><button id="back" style="margin-top:100px;">Back</button></center>
</body>
</html>