<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.produit, Dao.GestionProduit" %>
<!DOCTYPE html>
<% String id1=request.getParameter("id");%>
<% GestionProduit g=new GestionProduit();
 produit p=g.getProduit(id1);%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
          background: linear-gradient(90deg, #C7C5F4, #776BCC);		
        }

        .container {
            max-width: 440px;
            width: 100%;
            margin: 5% auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1255a2;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="submit"] {
            background-color: #1255a2;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1872d9;
        }

        .btn-cancel {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            text-decoration: none;
        }

        .btn-cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Are you sure you want to delete this product: <%= p.getNom() %></h1>

    <form action="Delete" method="post" onsubmit="return confirm('Are you sure you want to delete this item?');">
        <div class="form-group">
            <label for="id">Product ID:</label>
            <input type="text" id="id" name="id" class="form-control" value="<%= p.getId() %>" readonly>
        </div>
        <input type="hidden" name="confirmation" value="yes">
        <input type="submit" value="Delete" class="btn btn-primary">
        <a href="MyServlet1" class="btn btn-cancel">Cancel</a>
    </form>
</div>
</body>
</html>
