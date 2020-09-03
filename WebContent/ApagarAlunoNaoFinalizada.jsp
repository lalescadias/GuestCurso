<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style>
	img{
		width: 100px;
		height:100px;
		border-radius: 50px;
	
	}
</style>
<title>Apagar Aluno</title>
</head>
<body>
	<%@include file="menu.jsp"%>
	<div class="container">
		<div class="header clearfix">
			<h3>Apagar Aluno</h3>
		</div>
		<div class="jumbotron">
			<form method="POST" action="ApagarAluno.jsp">
				<div id="aviso"></div>
				<div class="form-group">
					<label>Nº Aluno</label>
					 <input style="width: 50%; display: inline;" type="number" required class="form-control" min="1" name="txt_numero" placeholder="Digite o número do aluno">
					 <button type="submit" class="btn btn-primary">Pesquisar</button>
				</div>
			</form>
			<%
					String wnumero = request.getParameter("txt_numero");
					String wid,wnome,wdata, wcodigoPostal,wfoto;
					if (wnumero!=null){    
					 Connection cn = LigacaoMysql.criarLigacaoMysql();
					 Statement st = cn.createStatement();
					 ResultSet rs =  st.executeQuery("Select * from alunos where codigo_aluno = '"+wnumero+"'");
				         if(rs.next()){
				        	wid = rs.getString("codigo_aluno");
				 			wnome = rs.getString("nome");
				 			wdata = rs.getString("data_nascimento");
				 			wcodigoPostal = rs.getString("codigo_postal");
				 			wfoto = rs.getString("foto");
				 			out.println("<br><label>Nº Aluno: " + wid + "</label><br>");		
				 			out.println("<label>Nome: " + wnome + "</label><br>");
				 			out.println("<label>Data Nascimento: " + wdata + "</label><br>");
				 			out.println("<label>Código Postal: " + wcodigoPostal + "</label><br>");
				 			out.println("<label>Foto: <img src='Imagem/"+ wfoto + "'"+"></label><br><br>");					 			
				         }
				         else{
				        	 %>
				               <script>
				                       document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Aluno não encontrado.</h3>";
				               </script>
				           <%
				           cn.close();
				         }
			       }
			    %>
			    <button type="submit" class="btn btn-primary">Delete</button>
			    <button type="reset" class="btn btn-danger">Cancelar</button>
				
		</div>

	</div>
</body>
</html>