<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="model.produit" %>
<%@ page import="Dao.GestionProduit" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <meta charset="ISO-8859-1">
    <title>Product Search</title>

    <style>
        /* CSS styles */

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(90deg, #C7C5F4, #776BCC);
            margin: 0;
            padding: 0;
        }
       

        .container {
            max-width: 400px;
            margin: 5% auto;
            background-color: #ffffff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1255a2;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #666666;
        }
         
         h2{
         color:;
          font-weight: bold;}
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 16px;
        }

        input[type="submit"] {
            background-color: #1255a2;
            color: #ffffff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #1872D9;
        }

        .product-info {
            margin-top: 30px;
            text-align: center;
        }

        .product-info h2 {
            color: red;
            margin-bottom: 20px;
            font-weight: bolder;
        }

        .product-info p {
            color: #666666;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Look for a product</h1>
        <form action="Search" method="post">
            <label>Id</label>
            <input type="number" name="id" placeholder="Id">
            <br>
            <input type="submit" value="Valider">

            <%-- Display product information if available --%>
            <% produit p = (produit) request.getAttribute("produit");
               boolean productNotFound = (p == null && request.getMethod().equals("POST"));
            %>

            <div class="product-info">
                <% if (productNotFound) { %>
                    <h2>Product Not Found !</h2>
                    <p>The product you are trying to find does not exist.</p>
                <% } else if (p != null) { %>
                    <h2>Product Information</h2>
                    <p><strong>Id:</strong> <%= p.getId() %></p>
                    <p><strong>Nom:</strong> <%= p.getNom() %></p>
                    <p><strong>Prix:</strong> <%= p.getPrix() %></p>
                    <p><strong>Fournisseur:</strong> <%= p.getFour() %></p>
                <% } %>
            </div>
             <a class="btn btn-" href="MyServlet1">Go back</a> 
        </form>
    </div>
</body>
</html>
