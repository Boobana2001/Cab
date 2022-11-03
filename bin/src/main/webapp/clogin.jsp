<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    *{
	padding: 0;
	margin: 0;
}
body{
  background: url(http://wrbbradio.org/wp-content/uploads/2016/10/grey-background-07.jpg) no-repeat center fixed;
  background-size: cover;
}

.container{
	background: #2d3e3f;
	width: 350px;
	height: 400px;
	padding-bottom: 20px;
	position: absolute;
	top:50%;
	left: 50%;
	transform: translate(-50%, -50%);
	margin: auto;
  padding: 70px 50px 20px 50px;
}


.fl{
	float: left;
  width: 110px;
  line-height: 35px;
}

.fontLabel{
  color: white;
}

.fr{
	float: right;
}

.clr{
	clear: both;
}

.box{
	width: 360px;
	height: 35px;
	margin-top: 70px;
	font-family: verdana;
	font-size: 12px;
}

.textBox{
	height: 35px;
	width: 190px;
	border: none;
  padding-left: 20px;
}

.new{
  float: left;
}

.iconBox{
	height: 35px;
	width: 40px;
	line-height: 38px;
	text-align: center;
  background: #ff6600;
}

.terms{
	line-height: 35px;
	text-align: center;
	background: #2d3e3f;
	color: white;
}

.submit{
	float: right;
	border: none;
	color: white;
	width: 110px;
	height: 35px;
	background: #ff6600;
	text-transform: uppercase;
  cursor: pointer;
}  
    </style>
  <script type="text/javascript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
        </script>
         <script src="validate.js"></script>
  </head>
  <body >
  <div id="content">
   	<div class="container">
     <form  name="myform" id="myform" autocomplete="on"  >
    		<center><h1 style="color:white;">Login</h1></center>
    		<div class="box">
          <label for="email" class="fl fontLabel"> Email ID: </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-envelope" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="email" id="email" required name="email" placeholder="Email Id" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<div class="box">
          <label for="password" class="fl fontLabel"> Password </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-key" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="Password" id="pwd" required name="pwd" placeholder="Password" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<br><br>
    		<div class="box" style="background: #2d3e3f">
    				<input type="Submit" name="Submit" id="clogin" class="submit" value="SUBMIT">
    		</div>
      </form>
  </div>
  </div>
   </body>
</html>
