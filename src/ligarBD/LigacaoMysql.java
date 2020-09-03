package ligarBD;

import java.sql.*;


public class LigacaoMysql {

	public static String estado = "Não ligado";
	
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
				 estado = "Ligação efetuada com sucesso!";
			}else {
				estado = "Não foi possivel criar a ligação";
			}
			return cn;
			
		}catch(ClassNotFoundException ex) {
			System.out.println("Driver não encontrado");
			ex.printStackTrace();
			return null;
		}
		catch(SQLException e) {
			System.out.println("Não foi possivel ligar a base de dados");
			return null;
		}
	}
	public static String estadoLigacao() {
		return estado;
	}
}
