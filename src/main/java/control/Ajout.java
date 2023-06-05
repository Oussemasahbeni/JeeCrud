package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.GestionProduit;
import model.produit;

/**
 * Servlet implementation class Ajout
 */
@WebServlet("/Ajout")
public class Ajout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("produit.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idp = request.getParameter("id");
        String nomP = request.getParameter("nom");
        String price =request.getParameter("prix");
        String fournisseur = request.getParameter("four");
        
        produit p = new produit(idp,nomP,price,fournisseur);
        GestionProduit g = new GestionProduit();
        g.save(p);
        System.out.println("error");
        GestionProduit gesProd = new GestionProduit();
        List<produit> produits = gesProd.getAllProduits();
        

        request.setAttribute("produits", produits);
        request.getRequestDispatcher("produit.jsp").forward(request, response);
	}

}
