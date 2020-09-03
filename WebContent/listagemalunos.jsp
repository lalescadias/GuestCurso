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
		border-radius: 50px;
	
	}
	img:hover{
		transform: scale(2);
	}
</style>
<title>Listagem de Alunos</title>
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<h1>Listagem Alunos</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº Aluno</th>
			<th>Nome</th>
			<th>Data de Nascimento</th>
			<th>Código Postal</th>
			<th>Foto</th>
		</tr>		 
		<%
		String sql = "select * from alunos";
		String wid,wnome,wdata, wcodigoPostal,wfoto;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("codigo_aluno");
			wnome = rs.getString("nome");
			wdata = rs.getString("data_nascimento");
			wcodigoPostal = rs.getString("codigo_postal");
			wfoto = rs.getString("foto");
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>" + wnome + "</td>");
			out.println("<td>" + wdata + "</td>");
			out.println("<td>" + wcodigoPostal + "</td>");
			out.println("<td><img src='Imagem/"+ wfoto + "'"+"></td></tr>");	
		}
		%>
	</table>
</body>
</html>