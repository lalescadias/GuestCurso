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
<%@include file ="menu.jsp" %>
    <div class="container">
        <div class="header clearfix">
            <h3>Novo Código Postal</h3>
        </div>
        <div class="jumbotron">
            <form method="POST" action="NewCodigo.jsp">
                <div id="aviso"></div>
                <div class="form-group">
                    <label>Codigo Postal</label>
                    <input type="text" required class="form-control" name="txt_codigo"
                    placeholder="Digite o novo codigo postal">
                    <br>   
                    <input type="text" required class="form-control" name="txt_local"
					placeholder="Digite a localidade">                  
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
    </div>
    <%
        String wcodigo=request.getParameter("txt_codigo");
        String wlocal=request.getParameter("txt_local");
        if (wcodigo!=null){        
            Connection cn = LigacaoMysql.criarLigacaoMysql();
           Statement st=cn.createStatement();
           ResultSet rs=st.executeQuery("select * from codigos_postais where codigo_postal='"+wcodigo+"'");
            if(rs.next()){
            %>
                <script>
                        document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Esse código já Existe</h3>";
                </script>
            <%  
            }
            else{
          
           // executar o comando de insert into
           st.executeUpdate("insert into codigos_postais (codigo_postal,local) values('"+wcodigo+"','"+wlocal+"')");
           %>
               <script>
                       document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Código postal registado.</h3>";
               </script>
           <%
           cn.close();
            }
        }  
    %>
</body>
</html>