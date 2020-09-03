<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registo</title>
	<link rel="stylesheet" type="text/css" href="css/estilo2.css">
</head>
<body>
<div class="container">
<div class="login-page">
  <div class="form">
    <form class="login-form">
    <div id="aviso"></div>
      <h1>Registo</h1>
      <input type="text" required name="txt_email"  placeholder="email address"/>
      <input type="password" name="txt_password" required placeholder="password"/>
      <button>create</button>
      <p class="message">Already registered? <a href="index.jsp">Sign In</a></p>
    </form>
  </div>
</div>
</div>
<%
	String wemail = request.getParameter("txt_email");
	String wpass = request.getParameter("txt_password");
	if (wemail!=null&& wpass!=null){  
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs =  st.executeQuery("Select * from utilizadores where email = '"+wemail+"' and senha = '"+wpass+"'");
		if(rs.next()){
			 %>
             <script>
                     document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Usuário já cadastrado.</h3>";
             </script>
         <%
		
		}
		else{
			st.executeUpdate("insert into utilizadores (email,senha) values('" + wemail + "','" + wpass + "')");
         %>
             <script>
                     document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Usuário cadastrado.</h3>";
             </script>
         <%
         cn.close();
		}
	}
%>
 

</body>
</html>