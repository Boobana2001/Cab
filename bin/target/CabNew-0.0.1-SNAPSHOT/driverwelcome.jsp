<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
<script type="text/javascript" src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
<script src="validate.js"></script>
</head>
<body>
<% HttpSession sess= request.getSession(false);%>
<center><h1 style="margin-top:100px;">Welcome To CabOnline</h1></center>
<div id="content"></div>
</body>
</html>