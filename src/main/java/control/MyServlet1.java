package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.produit;

import Dao.GestionProduit;


@WebServlet("/MyServlet1")
public class MyServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet1() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionProduit gesProd = new GestionProduit();
        List<produit> produits = gesProd.getAllProduits();
        for (produit p : produits) {
            System.out.println(p.toString());
        }

        request.setAttribute("produits", produits);
        request.getRequestDispatcher("produit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  GestionProduit gesProd = new GestionProduit();
          List<produit> produits = gesProd.getAllProduits();
          for (produit p : produits) {
              System.out.println(p.toString());
          }

          request.setAttribute("produits", produits);
          request.getRequestDispatcher("produit.jsp").forward(request, response);
    }
}