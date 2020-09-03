<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/estilo2.css">
    <title>Login</title>
</head>
<body>
<div class="container">
 <div class="login-page">
  <div class="form">
    <form class="login-form">
      <div id="aviso"></div>
      <h1>Login</h1>
      <input type="text" required name="txt_email" placeholder="username"/>
      <input type="password" required name="txt_password" placeholder="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="registo.jsp">Create an account</a></p>
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
			session.setAttribute("sutil",wemail);
			response.sendRedirect("menu.jsp");
		}
		else{
         %>
             <script>
                     document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Usuário não cadastrado.</h3>";
             </script>
         <%
         cn.close();
	}
	}
%>
 

</body>
</html>