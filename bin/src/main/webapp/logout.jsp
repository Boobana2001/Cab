<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="validate.js"></script>
   </style>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id="content"><br><br><br>
<%session.invalidate();%>
<center><h2>Logged Out Succesfully!</h2></center><br><br><br>
<center><button id="goback">Go back..</button></center>
</div>
</body>
</html>