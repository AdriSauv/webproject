package webproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Categorie {
	private int idCategorie;
	private String designation;
	
	
	public Categorie(int idCategorie, String designation) {
		super();
		this.idCategorie = idCategorie;
		this.designation = designation;
	}


	public int getIdCategorie() {
		return idCategorie;
	}


	public String getDesignation() {
		return designation;
	}
	
	public List<Categorie> fetchCategories() throws SQLException {
		Connection cn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		CreerConnexion cc = new CreerConnexion();
		List<Categorie> categories = new ArrayList<>();
		
		cc.etablirConnexion();
		
		sql= "SELECT idCategorie, designation FROM categorie";
		rs = st.executeQuery(sql);
		
		while(rs.next()) {
			int idCategorie = rs.getInt("idCategorie");
			String designation = rs.getString("designation");
			Categorie categorie = new Categorie(idCategorie, designation);
			categories.add(categorie);
		}
		return categories;
		
	}


}
