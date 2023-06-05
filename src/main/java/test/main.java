package test;

import Dao.GestionProduit;
import model.produit;

public class main {
	public static void main(String[] args) {
		GestionProduit gesProd = new GestionProduit();
		
		//produit p= new produit("2","oussema",12,"four");
		//produit p1= new produit("4","oussema","50","four");
		
		//gesProd.save(p1);
		
		//System.out.println(   ( gesProd.getProduit("2")).toString());
	//	System.out.println(   ( gesProd.produitsParMC("oussema")).toString());
		   //  gesProd.updateProduit(p1);
		   //  gesProd.deleteProduit("1");
		    // gesProd.getAllProduits();
		
		System.out.println(  gesProd.getAllIds());
		
		
	}
}
