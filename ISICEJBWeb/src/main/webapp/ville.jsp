<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>City Management</title>

    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
        }

        form {
            margin-bottom: 20px;
        }
    </style>
</head>
<script>
    function setModalValues(villeId, villelNom) {
        document.getElementById('modalVilleId').value = villeId;
        document.getElementById('modalVilleNom').value = villeNom;
    }
</script>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">City Management</h2>

    <form action="VilleController" class="mb-4">
        <div class="form-group">
            <label for="villeInput">Nom:</label>
            <input type="text" class="form-control" id="villeInput" name="ville" required>
        </div>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
    
        <div class="modal fade" id="ModifyVilleModal" tabindex="-1" role="dialog" aria-labelledby="ModifyVilleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyVilleModalCenterTitle">Modifier une Ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Name">Nom du Ville</label>
                            <input type="text" name="Name" id="modalVilleNom" class="form-control" required>
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalVilleId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer les modifications">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    <h3>Liste des villes :</h3>
    <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Supprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="ville">
                    <tr>
                    <td>${ville.id}</td>
                    <td>${ville.nom}</td>
                    
                    <td>
                    <form action="VilleController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${ville.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                    </form>
                    
                    </td>
                    <td>
                   <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#ModifyVilleModal"
                                     onclick="setModalValues(${ville.id}, '${ville.nom}')">
                               Modifier
                   </button>
                    </td>
                    </tr>
                </c:forEach>
             </tbody>
     </table>
</div>

<!-- Add Bootstrap JS and Popper.js scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>
