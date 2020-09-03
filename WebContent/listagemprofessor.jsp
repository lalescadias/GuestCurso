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
<title>Listagem de Professor</title>
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<h1>Listagem Professores</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº Professor</th>
			<th>Nome</th>
			<th>Data Admissão</th>
		</tr>		 
		<%
		String sql = "select * from professores";
		String wid,wnome,wdata;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("codigo_professor");
			wnome = rs.getString("nome");
			wdata = rs.getString("data_admissao");
			
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>" + wnome + "</td>");
			out.println("<td>"+ wdata + ""+"</td></tr>");		
		}
		%>
	</table>
</body>
</html>