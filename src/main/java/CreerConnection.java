import java.sql.*;

public class CreerConnection {
	
	private Connection cn;
	private String sql = "";
	private PreparedStatement ps;
	private Statement st;
	private ResultSet rs;
	
	public Connection etablirCnx() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/prjcommerce","xyz","xyz");
			st = cn.createStatement();
			System.out.println("Connexion réussie");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
	
	public void cloturerCnx() {
		try {
			cn.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Cette methode va chercher avec le login si il y a un mot de passe
	public String verifierCoordonnees(String email) throws SQLException {
		String pwd = null;
		etablirCnx();
		sql = "select pwd from compte where login like '" + email + "'";
		rs = st.executeQuery(sql);
		
		if(rs.next()) {
			pwd = rs.getString(1);
		}
		
		return pwd;
	}
	
	
	
	
	public static void main(String[] a) throws SQLException {
		CreerConnection db = new CreerConnection();
		Connection cn = null;
		
		cn = db.etablirCnx();
	}
}
