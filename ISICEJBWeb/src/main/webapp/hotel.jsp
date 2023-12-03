<%@page import="entities.Ville"%>
<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hotel Management</title>

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
    function setModalValues(hotelId, hotelNom,hotelAdresse,hotelTelephone,hotelVille) {
    	document.getElementById('modalHotelVille').value=hotelVille;
        document.getElementById('modalHotelId').value = hotelId;
        document.getElementById('modalHotelNom').value = hotelNom;
        document.getElementById('modalHotelAdresse').value = hotelAdresse;
        document.getElementById('modalHotelTelephone').value = hotelTelephone;
        
        console.log(hotelId);
        console.log(hotelNom);
        console.log("YARBI");
    }
</script>

<body>

<div class="container">
    <h2 class="mt-4 mb-4">Hotel Management</h2>

    <form action="HotelController" method="post" class="mb-4">
        <div class="form-group">
            <label for="nomInput">Nom:</label>
            <input type="text" class="form-control" id="nomlInput" name="nom" required>
            <label for="adressInput">Adress:</label>
            <input type="text" class="form-control" id="adressInput" name="adress" required>
            <label for="telephoneInput">Telephone:</label>
            <input type="text" class="form-control" id="telephoneInput" name="telephone" required>
            <label class="custom-modal-label" for="filiere">Ville:</label>
            <select name="ville" class="form-control"  required>
            	<option value="tt">Choisir une ville</option>
	            <c:forEach items="${villes}" var="ville">
	            	<option value="${ville.id}" >${ville.nom} : ${ville.id} </option>
	            </c:forEach>
	        </select>
	        
            
        </div>
       <button type="submit" name="action" value="create" class="btn btn-primary">Enregistrer</button>
    </form>
    
     
        <div class="modal fade" id="ModifyHotelModal" tabindex="-1" role="dialog" aria-labelledby="ModifyHotelModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyHotelModalCenterTitle">Modifier un Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Name">Nom du Hotel</label>
                            <input type="text" name="Name" id="modalHotelNom" class="form-control" required>
                            <label class="custom-modal-label" for="Adresse">Adresse du hotel</label>
                            <input type="text" name="Adresse" id="modalHotelAdresse" class="form-control" required>
                            <label class="custom-modal-label" for="Telephone">Telephone du hotel</label>
                            <input type="text" name="Telephone" id="modalHotelTelephone" class="form-control" required>
                            <label class="custom-modal-label" for="Ville">Ville du hotel</label>
                            <select name="Ville" class="form-control" id="modalHotelVille" required>
				            	<option value="0">Choisir une ville</option>
					            <c:forEach items="${villes}" var="ville">
					            	<option value="${ville.id}" >${ville.nom} : ${ville.id} </option>
					            </c:forEach>
					        </select>
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalHotelId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer les modifications">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    

    <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Adresse</th>
                    <th>Telephone</th>
                    <th>Ville</th>
                    <th>Suprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hotels}" var="hotel">
                    <tr>
                    <td>${hotel.id}</td>
                    <td>${hotel.nom}</td>
                    <td>${hotel.adresse}</td>
                    <td>${hotel.telephone}</td>
                    <td>${hotel.ville.nom}</td>
                    <td>
                    <form action="HotelController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${hotel.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                    </form>
                    
                    </td>
                    <td>
                   <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#ModifyHotelModal"
                                     onclick="setModalValues(${hotel.id}, '${hotel.nom}','${hotel.adresse}','${hotel.telephone}',${hotel.ville.id})">
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
        crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous">
</script>        
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
