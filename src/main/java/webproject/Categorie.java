package webproject;

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
