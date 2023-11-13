package webproject;

public class Article {
	private int idArticle;
	private String designation;
	private int pu;
	private int qtx;
	private int idCategorie;
	
	public Article(int idArticle, String designation, int pu, int qtx, int idCategorie) {
		super();
		this.idArticle = idArticle;
		this.designation = designation;
		this.pu = pu;
		this.qtx = qtx;
		this.idCategorie = idCategorie;
	}

	public Article() {
		
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public int getPu() {
		return pu;
	}

	public void setPu(int pu) {
		this.pu = pu;
	}

	public int getQtx() {
		return qtx;
	}

	public void setQtx(int qtx) {
		this.qtx = qtx;
	}

	public int getIdArticle() {
		return idArticle;
	}
	
	

}
