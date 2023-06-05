<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.produit" %>
<%@ page import="Dao.GestionProduit" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product CRUD</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8e61631315.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #C7C5F4, #776BCC);
        }

        .navbar {
            background-color: #1255A2;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-family: sans-serif;
            font-size: 25px;
            color: white;
            text-decoration: none;
            border-radius: 2px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .navbar-nav .nav-link {
            color: white;
        }

        .navbar-nav .nav-link:hover {
            color: #F3F6F7;
        }

        .table {
            background-color: #F3F6F7;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #1255A2;
            color: white;
            border: none;
        }

        .table td,
        .table th {
            vertical-align: middle;
            border: none;
        }

        .table tr {
            transition: background-color 0.3s;
        }

        .table tr:hover {
            background-color: #E8EDF1;
        }

        .btn-success,
        .btn-danger {
            transition: opacity 0.3s;
        }

        .btn-success:hover,
        .btn-danger:hover {
            opacity: 0.85;
        }
        
        .container{
        
        margin-top:20px;
        }
        
        .disconnect{
        position:relative;
          
        }
        .btnn{
        width:60px!important;
        height:40px !important;}
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container nav-header">
            <a class="navbar-brand" href="#">Product CRUD</a>
            
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                   <!-- <li class="nav-item">
                        <a class="nav-link" href="chercher.jsp"> <i class="fa-solid fa-magnifying-glass"></i> Find by ID</a>
                    </li>-->
                    <form action="produit.jsp" method="get" class="search-form">
                <input type="text" name="search" class="form-control" placeholder="Search">
               
                 
            </form>
                    <li class="nav-item">
                        <a class="nav-link" href="ajouter.jsp"> <i class="fa-sharp fa-solid fa-plus"></i> Add Product</a>
                    </li>
                    <li class="nav-item disconnect">
                     <li class="nav-item">
                    <span class="nav-link text-white"><i class="fa-solid fa-user"></i> Logged in as: ${username}</span>
                </li>
                 
                 <button class="btn btn-danger btn-sm">  <a class="nav-link" href="login.html"> <i class="fa-solid fa-right-from-bracket"></i> Disconnect</a> </button> 
               
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <table class="table table-bordered border-secondary table-striped">
            <thead class="bg-info">
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Prix</th>
                    <th>Fournisseur</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <% List<produit> produits = (List<produit>) request.getAttribute("produits");
                String search = request.getParameter("search");
                GestionProduit g=new GestionProduit();
                if (search != null && !search.isEmpty()) {
                   produits =g.produitsParMC(search);
                } else {
                    produits = g.getAllProduits();
                } 	
                for (produit p : produits) { %>
                <tr class="table-info">
                    <td><%= p.getId() %></td>
                    <td><%= p.getNom() %></td>
                    <td><%= p.getPrix() %></td>
                    <td><%= p.getFour() %></td>
                    <td><a class="btn btn-success btn-sm btnn" href="edit.jsp?id=<%= p.getId() %>"> <i class="fa-solid fa-pen-to-square"></i> </a></td>
                    <td><a class="btn btn-danger btn-sm btnn" href="delete.jsp?id=<%= p.getId() %>"> <i class="fa-sharp fa-solid fa-trash"></i> </a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
