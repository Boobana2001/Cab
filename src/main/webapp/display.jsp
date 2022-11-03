<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
      <%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Kayee Wong">

	<title>Booking</title>

	<!-- Material Design for Bootstrap -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    
    <style>
    *{
    margin:10px;}</style>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
<script type="text/javascript" src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
<script src="validate.js"></script>
 
</head>
<body class="hideOverflow">
<div id="content">
		            <h1 class="display-4 font-weight-bold">CabOnline</h1>
			            <hr>
			            <p><strong>Easy, Quick & Safe</strong></p>
			            <p class="mb-4 d-md-block">
			            	 Find a cab now with just one click away.
			           	</p><center><button id="mybooking" style="margin-top:80px;">My Booking</button></center>
			           	<%
		          Class.forName("org.postgresql.Driver");
		          Connection dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
		          HttpSession sess= request.getSession(false);
		          String cid=request.getParameter("cid");
		          Statement statement = dbcon.createStatement();
		          ResultSet rs=statement.executeQuery("select name,ph,model,colour,no,id from driver");
		         
		          //out.println("<tr><td><b>name</b></td> <td><b>phone</b></td> <td><b>color</b></td> <td><b>model</b></td> <td><b>no</b></td>  </tr>");
                  
		          while(rs.next())
		          { 
		        	  out.println("<html><head> <style>  .div{ border: 1px solid green;float:left;display : inline-block;padding:0px;margin-right:50px;} </style></head><table class='div'>");
		        	  out.println("<tr><td><h2>Driver Name:</td></h2><td><h2>"+rs.getString("name")+"</h2></td></tr><tr><td><h2>Phone No:</h2></td><td><h2>"+rs.getString("ph")+"</h2></td></tr><tr><td><h2>Car Color:</h2></td><td><h2>"+rs.getString("colour")+"</h2></td></tr><tr><td><h2>Car Model:</h2></td><td><h2>"+rs.getString("model")+"</h2></td></tr><tr><td><h2>Car No:</h2></td><td><h2>"+rs.getString("no")+"</h2></td></tr>");
		             
		        	  out.println("<tr><td><button  class='btn btn-raised btn-success btn1'  data-toggle='modal' data-target='#bookingModal' id='did' onclick='store(this)' value="+rs.getInt("id")+">Book</button></td></tr>");
		         %>
		         
		         <input type="hidden" id="cid" name="cid" value="<%=cid%>" >
			      
		          <%
		          out.println("</table></body></html>"); } %>
		          
		          
	
	
	<!-- Booking Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form name="myform" id="myform" autocomplete="on" >
					<h4 class="text-center" style="margin-top: 30px">Book a Cab</h4>
					
					<div class="tab modal-body">
						<h5>Booking Details:</h5>
						<div class="form-group">
							<label class="bmd-label-floating">Name</label>
							<input class="form-control" id="name" type="text" name="name" maxlength="20" required>
						</div>
						<div class="form-group">
							<label class="bmd-label-floating">Phone Contact</label>
							<input class="form-control" id="phone" type="text" name="phone" maxlength="15" onkeypress="validate(event);" required>
						</div>
					  	
					</div>

					<div class="tab modal-body">
						<h5>Pickup Address:</h5>
						<div class="form-row">
					        
					        <div class="col">
					        	<div class="form-group">
									<label class="bmd-label-floating">Pick up Point</label>
									<input class="form-control" id="pickuppoint" type="text" name="pickuppoint"  onkeypress="validate(event);" required>
								</div>
					        </div>
					    </div>
					    
					    <div class="form-group">
							<label class="bmd-label-floating">Destination Address</label>
							<input class="form-control" id="destination" type="text" name="destination" maxlength="30" required>
						</div>
					</div>
					<div class="tab modal-body">
						<h5>Pickup Time/Date:</h5>
					  	<div class="form-row">
					        <div class="col">
					        	<div class="form-group">
									<label class="bmd-label-floating">Pickup Time</label>
									<input id="pickupTime" type="time" class="form-control datetimepicker-input" data-target="#datetimepicker"/>
								</div>
					        </div>
					        <div class="col">
					        	<div class="form-group">
									<input class="form-control" type="date" id="pickupDate" name="pickupDate" required>
								</div>
					        </div>
					        <div id="datetimeErrorMessage"></div>
					    </div>
					</div>
					
					
    				<div class="d-flex justify-content-center align-items-center">
					<button  class="btn btn-raised btn-success" id="submit" >SUBMIT</button>
					</div>

				</form> 
			</div>
		</div>
	</div>

 <% statement.close();%>

</div>
</body>
</html>
