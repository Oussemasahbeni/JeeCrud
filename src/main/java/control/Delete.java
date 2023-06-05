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
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String l=request.getParameter("id");
		 String confirmation = request.getParameter("confirmation");
		    if (confirmation != null && confirmation.equalsIgnoreCase("yes")) {
		        String productId = request.getParameter("id");
		        GestionProduit g = new GestionProduit();
		        g.deleteProduit(productId);
		    } else {
		        // The user chose not to delete, so redirect them back to the desired page
		    	GestionProduit gesProd = new GestionProduit();
		        List<produit> produits = gesProd.getAllProduits();
		        

		        request.setAttribute("produits", produits);
		        request.getRequestDispatcher("produit.jsp").forward(request, response);
		        return;
		    }
		GestionProduit gesProd = new GestionProduit();
        List<produit> produits = gesProd.getAllProduits();
        

        request.setAttribute("produits", produits);
        request.getRequestDispatcher("produit.jsp").forward(request, response);
	}

}
