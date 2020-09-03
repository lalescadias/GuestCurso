<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Professores</title>
</head>
<body>
<%
	if(session.getAttribute("sutil") == null){
		response.sendRedirect("index.jsp");
	}

%>
<%@include file ="menu.jsp" %>
	<div class="container">
		<div class="header clearfix">
			<h3>Novo Professor</h3>
		</div>
		<div class="jumbotron">
			<form method="POST" action="NewProfessor.jsp">
				<div id="aviso"></div>
				<div class="form-group">
					<label>Nome</label> <input type="text" required
						class="form-control" name="txt_nome"
						placeholder="Digite o nome completo do novo professor">
				</div>
				<div class="form-group">
					<label>Data de admissao</label> <input type="date" required
						class="form-control" name="txt_data"
						placeholder="Digite a data de admissao">
				</div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				<button type="reset" class="btn btn-danger">Reset</button>
			</form>
		</div>
	</div>
	<%
	String wnome = request.getParameter("txt_nome");
	String wdata = request.getParameter("txt_data");
	if (wnome != null) {
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery("select * from professores where nome='" + wnome + "'");
		if (rs.next()) {
	%>
	<script>
		document.getElementById('aviso').innerHTML = "<h3 style='color:red;'>Professor já Existe</h3>";
	</script>
	<%
		} else {

		// executar o comando de insert into
		st.executeUpdate("insert into professores(nome, data_admissao) values('" + wnome + "','" + wdata + "')");
	%>
	<script>
		document.getElementById('aviso').innerHTML = "<h3 style='color:green;'>Professor registado.</h3>";
	</script>
	<%
		cn.close();
	}
	}
	%>
</body>
</html>