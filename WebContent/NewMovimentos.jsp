<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Movimentos</title>
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
            <h3>Novo Movimento</h3>
        </div>
        <div class="jumbotron">
            <form method="POST" action="NewMovimentos.jsp">
                <div id="aviso"></div>
                <div class="form-group">
					<label>Data de inicio</label> <input type="date" required
						class="form-control" name="txt_data_inicio"
						placeholder="Digite a data de admissao">
				</div>
				<div class="form-group">
					<label>Data de fim</label> <input type="date" required
						class="form-control" name="txt_data_fim"
						placeholder="Digite a data de fim">
				</div>
				<div class="form-group">				
					<label>Aluno</label> <select name="txt_aluno" class="form-control">
						<option>-</option>
						<%
						String nome;
						int codigoAluno;
						Connection cn = LigacaoMysql.criarLigacaoMysql();
						Statement st = cn.createStatement();
						ResultSet rs = st.executeQuery("Select * from alunos");
						while (rs.next()) {
							codigoAluno =  rs.getInt("codigo_aluno");
							nome = rs.getString("nome");
							out.println("<option value=" + codigoAluno + ">" + nome + "</option>");
						}
						cn.close();
						%>
					</select>
				</div>
				<div class="form-group">				
					<label>Professor</label> <select name="txt_professor" class="form-control">
						<option>-</option>
						<%
						String nomeProfessor;
						int codigoProfessor;
						Connection cn1 = LigacaoMysql.criarLigacaoMysql();
						Statement st1 = cn1.createStatement();
						ResultSet rs1 = st1.executeQuery("Select * from professores");
						while (rs1.next()) {
							codigoProfessor =  rs1.getInt("codigo_professor");
							nomeProfessor = rs1.getString("nome");
							out.println("<option value=" + codigoProfessor + ">" + nomeProfessor + "</option>");
						}
						cn.close();
						%>
					</select>
				</div>
				<div class="form-group">				
					<label>Curso</label> <select name="txt_curso" class="form-control">
						<option>-</option>
						<%
						String curso;
						int codigoCurso;
						Connection cn2 = LigacaoMysql.criarLigacaoMysql();
						Statement st2 = cn2.createStatement();
						ResultSet rs2 = st2.executeQuery("Select * from cursos");
						while (rs2.next()) {
							codigoCurso =  rs2.getInt("codigo_curso");
							curso = rs2.getString("curso");
							out.println("<option value=" + codigoCurso + ">" + curso + "</option>");
						}
						cn.close();
						%>
					</select>
				</div>
                <div class="form-group">
                    <label>Nota final</label>                
                    <input type="number" step="0.01" required class="form-control" name="txt_nota"
					placeholder="Digite a nota final">                  
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
    </div>
    <%
        String wdataInicio=request.getParameter("txt_data_inicio");
    	String wdataFim=request.getParameter("txt_data_fim");
    	String waluno = request.getParameter("txt_aluno");
    	String wprofessor = request.getParameter("txt_professor");
    	String wcurso = request.getParameter("txt_curso");
        String wnota=request.getParameter("txt_nota");
        if (waluno!=null && wprofessor!=null && wcurso!=null ){        
            Connection cn3 = LigacaoMysql.criarLigacaoMysql();
           Statement st3=cn3.createStatement();
           ResultSet rs3=st3.executeQuery("select * from tab_movimentos where data_inicio = '" + wdataInicio+"' and data_fim = '" + wdataFim+"' and codigo_professor = '" + wprofessor+"' AND codigo_curso = '" + wcurso+"' and codigo_aluno = '" + waluno+"' and nota_final = '" + wnota+"';");           
            if(rs3.next()){
            %>
                <script>
                        document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Movimento já Existe</h3>";
                </script>
            <%  
            }
            else{
          
           // executar o comando de insert into
           	st3.executeUpdate("insert into tab_movimentos (data_inicio,data_fim, codigo_aluno,codigo_professor,codigo_curso, nota_final) values('" + wdataInicio + "','" + wdataFim + "','"
			+ waluno + "','" + wprofessor + "','" + wcurso + "','" + wnota + "')");
           %>
               <script>
                       document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Movimento registado.</h3>";
               </script>
           <%
           cn.close();
            }
        }  
    %>
</body>
</html>