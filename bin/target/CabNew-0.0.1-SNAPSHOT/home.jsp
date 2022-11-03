<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: right;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
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
	margin-top: 10px;
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
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="validate.js"></script>
    <script>
function getURLParameter(name) {
	return decodeURI((RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]);
}
function hideURLParams() {
	var hide = ['success','error'];
	for(var h in hide) {
		if(getURLParameter(h)) {
			history.replaceState(null, document.getElementsByTagName("title")[0].innerHTML, window.location.pathname);
		}
	}
}
window.onload = hideURLParams;</script> 
  </head>
  <body >
  <ul>
  <li><button id="logout" style="color:white;background-color:#333;margin-top:14px;margin-right:23px;box-shadow: none;border: 0;cursor:pointer;" >Logout</button></li>
  <li><button id="about" style="color:white;background-color:#333;margin-top:14px;box-shadow: none;margin-right:23px;border: 0;cursor:pointer;" >About us</button></li>
  <li><button id="contact" style="color:white;background-color:#333;margin-top:14px;box-shadow: none;margin-right:23px;border: 0;cursor:pointer;" >Contact</button></li>
 <li><button id="news" style="color:white;background-color:#333;margin-top:14px;box-shadow: none;border: 0;margin-right:23px;cursor:pointer;" >News</button></li>
  <li><button id="driver" style="color:white;background-color:#333;margin-top:14px;box-shadow: none;border: 0;margin-right:23px;cursor:pointer;" >Driver Login</button></li>
</ul>
<div id="content">
  	<div class="container">
      <form name="myform" id="myform" autocomplete="on"  onsubmit="fun1()">
    		<div class="box">
          <label for="fullName" class="fl fontLabel"> Full Name: </label>
    			<div class="new iconBox">
            <i style="margin-top:10px;" class="fa fa-user" aria-hidden="true"></i>
          </div>
    			<div class="fr">
    					<input type="text" name="name" id="name" placeholder="Full Name"
              class="textBox" autofocus="on" required>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<div class="box">
          <label for="phone" class="fl fontLabel"> Phone No.: </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-phone-square" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="text" required name="phone" id="phone" maxlength="10" placeholder="Phone No." class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<div class="box">
          <label for="email" class="fl fontLabel"> Email ID: </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-envelope" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="email" required name="email" id="email" placeholder="Email Id" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<div class="box">
          <label for="password" class="fl fontLabel">New Password </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-key" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="Password" required name="npwd" id="npwd" placeholder="New Password" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<div class="box">
          <label for="repassword" class="fl fontLabel">Repeat Password </label>
    			<div class="fl iconBox"><i style="margin-top:10px;" class="fa fa-key" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="Password" required name="rpwd" id="rpwd" placeholder="Repeat Password" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div><br><br>
    		<div class="box" style="background: #2d3e3f">
    				<input type="Submit" name="Submit" id="creg" class="submit" value="SUBMIT">
    		</div>
      </form>
  </div>
  <p id="area"></p>
  <center style="margin-top:700px;cursor:pointer;"><i>Already have an account?<span id="login">login</span></i></center>
</div>
  </body>
</html>
    