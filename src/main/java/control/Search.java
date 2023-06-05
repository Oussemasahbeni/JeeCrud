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

@WebServlet("/Search")
public class Search extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Search() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("chercher.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        GestionProduit gestionProduit = new GestionProduit();
        produit produit = gestionProduit.getProduit(id);

        request.setAttribute("produit", produit);

        // Retrieve all IDs from the database
        List<String> allIds = gestionProduit.getAllIds();
        request.setAttribute("allIds", allIds);
        System.out.println(allIds);

        request.getRequestDispatcher("chercher.jsp").forward(request, response);
    }
}
