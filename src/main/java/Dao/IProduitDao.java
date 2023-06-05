package Dao;

import model.produit;
import java.util.List;
public interface IProduitDao {
public produit save(produit p);
public List<produit> produitsParMC(String mc);
public produit getProduit(String Réf);
public produit updateProduit(produit p);
public void deleteProduit(String Réf);
public List<produit> getAllProduits();
public List<String> getAllIds();
}