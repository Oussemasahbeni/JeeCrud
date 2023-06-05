package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.GestionProduit;
import Dao.GestionUsers;
import model.produit;
import model.user;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.html").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String L = request.getParameter("login");
        String P = request.getParameter("password");

        GestionUsers gu = new GestionUsers();

        try {
           
            user user = gu.getUser(L);

            if (user != null && user.getPassword().equals(P)) {
               
                request.setAttribute("user", user);

                // Retrieve the list of products
                GestionProduit gesProd = new GestionProduit();
                List<produit> produits = gesProd.getAllProduits();
                request.setAttribute("produits", produits);
                request.setAttribute("username", L); 

                request.getRequestDispatcher("produit.jsp").forward(request, response);
            } else {
             
                request.getRequestDispatcher("login.html").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
   }
}


