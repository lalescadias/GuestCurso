<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listagem de movimentos</title>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<h1>Listagem de Movimentos</h1>
	<hr>
	<form method="POST" action="listagemMovimentosTipo.jsp">
		<select name="cb_tipo">
			<option value="*">Todos</option>
			<option value=">=10">Aprovados</option>
			<option value="<10" >Reprovados</option>			
		</select>		
		<input type = "submit" value="Filtrar">
	</form>
	<table id="listagem">
		<tr>
			<th>Nº Movimento</th>
			<th>Data inicio</th>
			<th>Data fim</th>
			<th>Aluno</th>
			<th>Professor</th>
			<th>Curso</th>
			<th>Nota final</th>
	</tr>		
		<%
		String escolha = request.getParameter("cb_tipo");
		String sql = "";		
		if(escolha == null || escolha .equals("*")){
			sql = "select tab_movimentos.codigo_mov, tab_movimentos.data_inicio,tab_movimentos.data_fim,tab_movimentos.nota_final,alunos.nome as ref,professores.nome as ref2, cursos.curso as ref3"
				     +" from tab_movimentos,cursos,alunos,professores"
				     +" where tab_movimentos.codigo_aluno = alunos.codigo_aluno and tab_movimentos.codigo_professor = professores.codigo_professor and tab_movimentos.codigo_curso = cursos.codigo_curso;";
		}else{
			sql = "select tab_movimentos.codigo_mov, tab_movimentos.data_inicio,tab_movimentos.data_fim,tab_movimentos.nota_final,alunos.nome as ref,professores.nome as ref2, cursos.curso as ref3"
				     +" from tab_movimentos,cursos,alunos,professores"
				     +" where tab_movimentos.codigo_aluno = alunos.codigo_aluno and tab_movimentos.codigo_professor = professores.codigo_professor and tab_movimentos.codigo_curso = cursos.codigo_curso and nota_final "+escolha +"";
		}	
		String wid,wdataInicio,wdataFim, waluno,wprofessor, wcurso,wnota;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("codigo_mov");
			wdataInicio = rs.getString("data_inicio");
			wdataFim = rs.getString("data_fim");
			waluno = rs.getString("ref");
			wprofessor = rs.getString("ref2");
			wcurso = rs.getString("ref3");
			wnota = rs.getString("nota_final");
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>" + wdataInicio + "</td>");
			out.println("<td>" + wdataFim + "</td>");
			out.println("<td>" + waluno + "</td>");
			out.println("<td>" + wprofessor + "</td>");
			out.println("<td>" + wcurso + "</td>");
			out.println("<td>" + wnota + "</td></tr>");	
		}
		%>
	</table>
	<br>
</body>
</html>