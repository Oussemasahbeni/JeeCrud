<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.produit" %>
<%@ page import="Dao.GestionProduit" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #C7C5F4, #776BCC);
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px;
            border-radius: 5px;
            background-color: #FFFFFF;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #1255A2;
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #1255A2;
        }

        .form-control {
            padding: 12px;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            width: 100%;
            background-color: #F8F8F8;
        }

        .btn-primary {
            background-color: #1255A2;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 12px 20px;
            cursor: pointer;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0D408F;
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
                errorMessages.push("Name should contain only letters.");
            }
            if (!regex.test(supplier)) {
                errorMessages.push("Supplier should contain only letters.");
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
    <div class="container mt-5">
        <h2 class="mb-3">Add Product</h2>
        <form method="post" action="Ajout" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="id">Id:</label>
                <input type="number" class="form-control" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="nom">Name:</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prix">Price:</label>
                <input type="number" class="form-control" id="prix" name="prix" required>
            </div>
            <div class="form-group">
                <label for="four">Supplier:</label>
                <input type="text" class="form-control" id="four" name="four" required>
            </div>
            <div id="error-container"></div>
            <button type="submit" class="btn btn-primary" value="ajouterProduit">Add</button>
        </form>
    </div>
</body>
</html>
