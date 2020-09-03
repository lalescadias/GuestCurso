<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<style>
	img{
		width: 100px;
		height:100px;
	
	}
	img:hover{
		transform: scale(2);
	}
</style>
<title>Listagem de Codigos Postais</title>
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<h1>Listagem codigos</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Código Postal</th>
			<th>Local</th>
		</tr>		 
		<%
		String sql = "select * from codigos_postais";
		String wid,wlocal;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("codigo_postal");
			wlocal = rs.getString("local");
			
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>"+ wlocal + ""+"</td></tr>");		
		}
		%>
	</table>
</body>
</html>