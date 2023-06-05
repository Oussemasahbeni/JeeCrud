package model;

public class produit {
	
	private String id;
	private String nom;
	private String prix;
	private String four;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrix() {
		return prix;
	}
	public void setPrix(String prix) {
		this.prix =  prix;
	}
	public String getFour() {
		return four;
	}
	public void setFour(String four) {
		this.four = four;
	}
	public produit(String id, String nom, String p, String four) {
		super();
		this.id = id;
		this.nom = nom;
		this.prix = p;
		this.four = four;
	}
	@Override
	public String toString() {
		return "produit [id=" + id + ", nom=" + nom + ", prix=" + prix + ", four=" + four + "]";
	}
	
	
	

}
