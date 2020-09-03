<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testar Ligacao</title>
</head>
<body>
	<h1>
		<%
			LigacaoMysql.criarLigacaoMysql();
		out.println(LigacaoMysql.estadoLigacao());
		%>
	</h1>

</body>
</html>