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
 * Servlet implementation class Modifier
 */
@WebServlet("/Modifier")
public class Modifier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.getRequestDispatcher("produit.jsp").forward(request, response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prix = request.getParameter("prix");
        String four = request.getParameter("four");

        produit p = new produit(id, nom, prix, four);
        GestionProduit g = new GestionProduit();
        g.updateProduit(p);
        System.out.print(p);
        
        GestionProduit gesProd = new GestionProduit();
        List<produit> produits = gesProd.getAllProduits();
        

        request.setAttribute("produits", produits);
        request.getRequestDispatcher("produit.jsp").forward(request, response);
    }

}
