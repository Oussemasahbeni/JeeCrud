<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.produit, Dao.GestionProduit" %>
<!DOCTYPE html>
<% String id1=request.getParameter("id"); %>
<% GestionProduit g=new GestionProduit();
 produit p=g.getProduit(id1); %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8e61631315.js" crossorigin="anonymous"></script>
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
            color: #1255a2;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        input[type="text"]:focus {
            outline: none;
            box-shadow: 0 0 5px #1255a2;
        }

        .btn-primary {
            background-color: #1255a2;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #1872d9;
        }

        .error-message {
            color: #FF0000;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            var nameInput = document.getElementById("nom");
            var supplierInput = document.getElementById("four");
            var name = nameInput.value.trim();
            var supplier = supplierInput.value.trim();
            var regex = /^[a-zA-Z]+$/;

            var errorMessages = [];
            if (!regex.test(name)) {
                errorMessages.push("Nom should contain only letters.");
            }
            if (!regex.test(supplier)) {
                errorMessages.push("Fournisseur should contain only letters.");
            }

            if (errorMessages.length > 0) {
                var errorContainer = document.getElementById("error-container");
                errorContainer.innerHTML = "";
                for (var i = 0; i < errorMessages.length; i++) {
                    var errorMessage = document.createElement("p");
                    errorMessage.innerText = errorMessages[i];
                    errorContainer.appendChild(errorMessage);
                }
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Edit Product: <%= p.getNom() %></h1>
        <form action="Modifier" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <input type="text" id="id" name="id" class="form-control" hidden value="<%= p.getId() %>" required>
            </div>
            <div class="form-group">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" class="form-control" value="<%= p.getNom() %>" required>
            </div>
            <div class="form-group">
                <label for="prix">Prix:</label>
                <input type="text" id="prix" name="prix" class="form-control" value="<%= p.getPrix() %>" required>
            </div>
            <div class="form-group">
                <label for="four">Fournisseur:</label>
                <input type="text" id="four" name="four" class="form-control" value="<%= p.getFour() %>" required>
            </div>
            <div id="error-container"></div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</body>
</html>
