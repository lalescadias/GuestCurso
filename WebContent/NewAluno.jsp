<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Aluno</title>
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
			<h3>Novo Aluno</h3>
		</div>
		<div class="jumbotron">
			<form method="POST" action="NewAluno.jsp">
				<div id="aviso"></div>
				<div class="form-group">
					<label>Nome</label> <input type="text" required
						class="form-control" name="txt_nome"
						placeholder="Digite o nome completo do aluno">
				</div>
				<div class="form-group">
					<label>Data de nascimento</label> <input type="date" required
						class="form-control" name="txt_data"
						placeholder="Digite a data de nascimento">
				</div>				
				<div class="form-group">				
					<label>Código Postal</label> <select name="txt_codigoPostal" class="form-control">
						<option>-</option>
						<%
						String codigo;
						Connection cn = LigacaoMysql.criarLigacaoMysql();
						Statement st = cn.createStatement();
						ResultSet rs = st.executeQuery("Select * from codigos_postais");
						while (rs.next()) {
							codigo =  rs.getString("codigo_postal");
							out.println("<option value=" + codigo + ">" + codigo + "</option>");
						}
						cn.close();
						%>
					</select>
				</div>
				<div class="form-group">
                    <label>Foto</label>  
                    <input type="text" required class="form-control" name="txt_foto"
                    placeholder="Digite o nome da foto">                   
                </div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				<button type="reset" class="btn btn-danger">Cancelar</button>
			</form>
		</div>

	</div>
	<%
	String wnome = request.getParameter("txt_nome");
	String wdata = request.getParameter("txt_data");
	String wcodigoPostal = request.getParameter("txt_codigoPostal");
	String wfoto = request.getParameter("txt_foto");
	 if (wnome!=null){    
		 wnome = wnome.trim();    
		 Connection cn2 = LigacaoMysql.criarLigacaoMysql();
		 Statement st2 = cn2.createStatement();
		 ResultSet rs2 =  st2.executeQuery("Select * from alunos where nome = '"+wnome+"'");
         if(rs2.next()){
         %>
             <script>
                     document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Aluno já existe</h3>";
             </script>
         <%  
         }
         else{
       
        	 st2.executeUpdate("insert into alunos (nome, data_nascimento, codigo_postal, foto) values('" + wnome + "','"
     				+ wdata + "','" + wcodigoPostal + "','" + wfoto +"')");
        %>
            <script>
                    document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Aluno registado.</h3>";
            </script>
        <%
        cn.close();
         }
     }
			
	%>
</body>
</html>