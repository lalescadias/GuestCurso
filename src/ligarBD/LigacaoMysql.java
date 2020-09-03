package ligarBD;

import java.sql.*;


public class LigacaoMysql {

	public static String estado = "N�o ligado";
	
	public LigacaoMysql() {
		
	}
	public static Connection criarLigacaoMysql() {
		Connection cn = null;
		try {
			String driver="com.mysql.cj.jdbc.Driver";
			Class.forName(driver);
			String url="jdbc:mysql://localhost:3306/bdcursos?useTimezone=true&serverTimezone=UTC";
			String utilizador = "root";
			String password = "q1w2e3r4";
			cn = DriverManager.getConnection(url,utilizador,password);
			if(cn!=null) {
				 estado = "Liga��o efetuada com sucesso!";
			}else {
				estado = "N�o foi possivel criar a liga��o";
			}
			return cn;
			
		}catch(ClassNotFoundException ex) {
			System.out.println("Driver n�o encontrado");
			ex.printStackTrace();
			return null;
		}
		catch(SQLException e) {
			System.out.println("N�o foi possivel ligar a base de dados");
			return null;
		}
	}
	public static String estadoLigacao() {
		return estado;
	}
}
