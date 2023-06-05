package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import model.produit;

public class GestionProduit implements IProduitDao{




	 @Override
	    public List<produit> getAllProduits() {
	        Connection conn = SingletonConnection.getConnection();
	        List<produit> produits = new ArrayList<>();
	        try {
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM PRODUIT");
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                produit prod = new produit(rs.getString("ID"), rs.getString("NOM"), rs.getString("PRIX"), rs.getString("FOUR"));
	                produits.add(prod);
	            }
	            rs.close();
	            ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return produits;
	    }
@Override
public produit save(produit p) {
	Connection conn=SingletonConnection.getConnection();
	try {

	PreparedStatement ps= conn.prepareStatement("INSERT INTO PRODUIT VALUES(?,?,?,?);");

	ps.setString(1, p.getId());
	ps.setString(2, p.getNom());
	ps.setString(3, p.getPrix());
	ps.setString(4, p.getFour());
	ps.executeUpdate();

	ps.close();
	} catch (SQLException e)
	{
	e.printStackTrace() ;
	}
	return p;
}



@Override
public List<produit> produitsParMC(String mc) {
    Connection conn = SingletonConnection.getConnection();
    List<produit> produits = new ArrayList<>();
    try {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM PRODUIT WHERE nom like ?");
        ps.setString(1, "%" + mc + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            produit prod = new produit(rs.getString("ID"),rs.getString("NOM"),rs.getString("PRIX"),rs.getString("FOUR"));
            produits.add(prod);
        }
        rs.close();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return produits;
}


@Override
public produit getProduit(String Réf) {
    Connection conn = SingletonConnection.getConnection();
    produit prod = null;
    try {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM PRODUIT WHERE id=?");
        ps.setString(1, Réf);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            prod = new produit(rs.getString("ID"),rs.getString("NOM"),rs.getString("PRIX"),rs.getString("FOUR"));
            
        }
        rs.close();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return prod;
}


public List<String> getAllIds() {
    List<String> ids = new ArrayList<>();
    Connection conn = SingletonConnection.getConnection();

    try {
        java.sql.Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT ID FROM PRODUIT");

        while (rs.next()) {
            ids.add(rs.getString("ID"));
        }

        rs.close();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return ids;
}

@Override
public produit updateProduit(produit p) {
	Connection conn=SingletonConnection.getConnection();
	try {

	PreparedStatement ps= conn.prepareStatement("UPDATE PRODUIT SET Nom = ?, Four = ?, Prix = ? WHERE ID = ? ;");

	ps.setString(1, p.getNom());
	ps.setString(2, p.getFour());
	ps.setString(3, p.getPrix());
	ps.setString(4, p.getId());
	ps.executeUpdate();
	
	
	ps.close();
	} catch (SQLException e)
	{
	e.printStackTrace();
}
	return p;
}


@Override
public void deleteProduit(String Réf) {
	Connection conn=SingletonConnection.getConnection();
	try {

	PreparedStatement ps= conn.prepareStatement("delete from produit WHERE ID = ? ;");
	ps.setString(1, Réf);
	ps.executeUpdate();
	
	
	ps.close();
	} catch (SQLException e)
	{
	e.printStackTrace();
}System.out.println("deleted");}
}
