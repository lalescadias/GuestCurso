<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/estilo2.css">
</head>
<body>
<div class="container">
 <div class="login-page">
  <div class="form">
    <form class="login-form">
      <h1>Até breve</h1>
      <p class="message">Deseja se logar novamente? <a href="index.jsp">Sign In</a></p>
    </form>
  </div>
</div>
</div>
<%
	session.invalidate();
%>
</body>
</html>