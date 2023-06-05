package control;

import Dao.GestionUsers;
import model.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup")
public class SignUp extends HttpServlet {
   
    public SignUp() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

  

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        user user = new user();
        user.setName(username);
        user.setPassword(password);

        try {
         
        	GestionUsers gu = new GestionUsers();
            gu.addUser(user);
            
            response.sendRedirect("login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }
}
