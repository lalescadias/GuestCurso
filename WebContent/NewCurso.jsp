<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Cursos</title>
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
            <h3>Novo Curso</h3>
        </div>
        <div class="jumbotron">
            <form method="POST" action="NewCurso.jsp">
                <div id="aviso"></div>
                <div class="form-group">
                    <label>Nome</label>
                    <input type="text" required class="form-control" name="txt_nome"
                    placeholder="Digite o nome para o novo curso">
                    <br>   
                    <input type="text" required class="form-control" name="txt_preco"
					placeholder="Digite o preço do curso">                  
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
    </div>
    <%
        String wnome=request.getParameter("txt_nome");
        String wpreco=request.getParameter("txt_preco");
        if (wnome!=null){        
            Connection cn = LigacaoMysql.criarLigacaoMysql();
           Statement st=cn.createStatement();
           ResultSet rs=st.executeQuery("select * from cursos where curso='"+wnome+"'");
            if(rs.next()){
            %>
                <script>
                        document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Curso já Existe</h3>";
                </script>
            <%  
            }
            else{
          
           // executar o comando de insert into
           st.executeUpdate("insert into cursos (curso,preco_curso) values('"+wnome+"','"+wpreco+"')");
           %>
               <script>
                       document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Curso registado.</h3>";
               </script>
           <%
           cn.close();
            }
        }  
    %>
</body>
</html>