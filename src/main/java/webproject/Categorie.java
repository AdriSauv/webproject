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
	
	public Categorie() {
		super();
		
	}


	public int getIdCategorie() {
		return idCategorie;
	}


	public String getDesignation() {
		return designation;
	}
}
