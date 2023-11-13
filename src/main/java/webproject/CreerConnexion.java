package webproject;


import java.sql.*;
import java.util.*;

public class CreerConnexion {
	Connection cn = null;
	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "";
	
	public Connection etablirConnexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1/prjcommerce","xyz","xyz");
			//System.out.println("Bravo!!! connexion réussie");
			st = cn.createStatement();
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return cn;
	}
	public void cloturerConnexion() {
		try {
			cn.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	public String verifierCoordonnees(String login) {
		String mdp = null;
		etablirConnexion();
		sql = "SELECT pwd FROM compte WHERE login LIKE '" + 
		login + "'";
		try {
			rs = st.executeQuery(sql);
			if(rs.next()) {
				mdp = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mdp;
	}
	public void ajouterCompte(Compte cp) throws SQLException {
		etablirConnexion();
		/*
		 * sql = "SELECT * FROM compte WHERE login LIKE '" + cp.getLogin() + "'"; rs =
		 * st.executeQuery(sql); if(!rs.next()) {
		 */	
			sql = "INSERT INTO compte(login,pwd,type,idUsers) VALUES('"
					+ cp.getLogin() + "','" + cp.getPwd() + "','" 
					+ cp.getType() + "'," + cp.getIdUsers() + ");";
			ps = cn.prepareStatement(sql);
			ps.execute();
			cloturerConnexion();
		//}
	}
	public void ajouterUsers(Users u) throws SQLException {
		etablirConnexion();
		sql = "INSERT INTO users(fname,lname,adresse,tel,age,sexe) "
				+ "VALUES('" + u.getfName() + "','" + u.getlName() +
				"','" + u.getAdresse() + "','" + u.getTel() + "'," +
				u.getAge() + ",'" + u.getSexe() + "')";
		ps = cn.prepareStatement(sql);
		ps.execute();
		cloturerConnexion();
	}
	public int idLastUsers() throws SQLException {
		etablirConnexion();
		int id = 0;
		sql = "SELECT MAX(idUsers) FROM users;";
		rs = st.executeQuery(sql);
		if(rs.next()) {
			id = rs.getInt(1);
		}
		cloturerConnexion();
		return id;
	}
	
	public String ajouterCategorie(String cat) {
		String str = "";
		if(!categorieExist(cat)) {
			sql = "INSERT INTO categorie(designation) VALUES('" + cat + "')";
			try {
				etablirConnexion();
				st.executeUpdate(sql);
				str = "Ajout du catégorie " + cat + " réussie.";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			str = "La catégorie " + cat + " existe déjà.";
		}
		cloturerConnexion();
		return str;
	}
	public void modifierCategorie(String ancienCat, String newCat) {
		sql = "UPDATE categorie SET designation = '" + newCat + "' WHERE designation LIKE '" + ancienCat + "'";
			try {
				etablirConnexion();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		cloturerConnexion();
	}
	public void supprimerCategorie(String cat) {
		sql = "DELETE FROM categorie where designation LIKE '" + cat + "'";
			try {
				etablirConnexion();
				st.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		cloturerConnexion();
	}
	public List<Categorie> listCategorie() {
		List<Categorie> l = new ArrayList<Categorie>();
		Categorie c;
		sql = "SELECT * FROM categorie ORDER BY designation";
		try {
			rs = st.executeQuery(sql);
			while(rs.next()) {
				c = new Categorie(rs.getInt(1),rs.getString(2));
				l.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}
	
	
	public boolean categorieExist(String designation) {
		etablirConnexion();
		sql = "SELECT idCategorie FROM categorie WHERE designation LIKE '" + designation + "'";
		try {
			rs = st.executeQuery(sql);
			if(rs.next()) {
				cloturerConnexion();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cloturerConnexion();
		return false;
	}
	
	public int getIdFromCategorie(String designation) {
		int identifiant = 0;
		sql = "SELECT idCategorie FROM categorie WHERE designation LIKE '" + designation + "'";
		try {
			etablirConnexion();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				identifiant = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cloturerConnexion();
		return identifiant;
	}
	public List<Integer> categorieExistDansArticle() {
		List<Integer> lCategorie = new ArrayList<Integer>();
		sql = "SELECT DISTINCT(idCategorie) FROM article";
		try {
			etablirConnexion();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				lCategorie.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cloturerConnexion();
		return lCategorie;
	}
	
	public boolean verifierArticleAvantSuppressionCategorie(String designation) {
		int idCat = 0;
		List<Integer> lst = categorieExistDansArticle();
		sql = "SELECT idCategorie FROM categorie WHERE designation LIKE '" + designation + "'";
		try {
			etablirConnexion();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				idCat = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i : lst) {
			if(i == idCat) {
				cloturerConnexion();
				return true;
			}
		}
		cloturerConnexion();
		return false;
	}
	 
}