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
<title>Listagem de Curso</title>
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<h1>Listagem cursos</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº Curso</th>
			<th>Curso</th>
			<th>Preço</th>
		</tr>		 
		<%
		String sql = "select * from cursos";
		String wid,wcurso,wpreco;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("codigo_curso");
			wcurso = rs.getString("curso");
			wpreco = rs.getString("preco_curso");
			
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>" + wcurso + "</td>");
			out.println("<td>"+ wpreco + ""+"</td></tr>");		
		}
		%>
	</table>
</body>
</html>