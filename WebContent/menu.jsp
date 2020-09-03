<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<style>
	body{
		margim: 0px;
	}
	.dropbtn{
		background-color: #4CAF50;
		color:white;
		padding: 15px;
		font-size:15px;
		border:none;
		cursor:pointer;		
	}
	.dropdown{
			
		position: relative;
		display: inline-block;
	}
	.dropdown-conteudo{
		display:none;
		position:absolute;
		background-color: #f9f9f9;
		min-width: 150px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		zindex: -1;
	}
	.dropdown-conteudo a{
		color: black;
		padding: 12px;
		text-decoration:none;
		display: block;
	}
	.dropdown-conteudo a:hover{
		background-color: #f1f1f1;	
	}
	.dropdown:hover .dropdown-conteudo{
		display:block;
	}
	.dropdown:hover .dropbtn{
		background-color: #3e8e41;
	}
	
</style>
</head>
<body>
	<div style="width:100%; background-color:#3e8e41" >
		<div class="dropdown">
			<button class ="dropbtn">Cursos</button>
			<div class="dropdown-conteudo">
				<a href="NewCurso.jsp">Novo Curso</a>
				<a href="listagemcurso.jsp">Lista Cursos</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Alunos</button>
			<div class="dropdown-conteudo">
				<a href="NewAluno.jsp">Novo aluno</a>
				<a href="listagemalunos.jsp">Lista Alunos</a>
				<a href="listagemalunosidade.jsp">Lista Alunos Idade</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Professores</button>
			<div class="dropdown-conteudo">
				<a href="NewProfessor.jsp">Novo Professor</a>
				<a href="listagemprofessor.jsp">Lista Professores</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Movimentos</button>
			<div class="dropdown-conteudo">
				<a href="NewMovimentos.jsp">Novo movimento</a>
				<a href="listagemMovimentosTipo.jsp">Lista movimentos</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Códigos Postais</button>
			<div class="dropdown-conteudo">
				<a href="NewCodigo.jsp">Novo código postal</a>
				<a href="listagemcodigosPostais.jsp">Lista Códigos</a>
			</div>
		</div>
		<div class="dropdown">
			<label><%=session.getAttribute("sutil") %></label>
		</div>
		<div class="dropdown">
			<button class ="dropbtn" onclick="window.location.href = 'logout.jsp'">Logout</button>
		</div>
	</div>

</body>
</html>