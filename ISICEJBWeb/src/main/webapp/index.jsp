<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion Hotels</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	
	<div class="container mt-5">
        <h1 class="display-4 text-center mb-4">Gestion Hotels</h1>
        <form action="VilleController" class="mb-3">
            <button class="btn btn-primary btn-block">Gestion des villes</button>
        </form>
        
        <form action="HotelController" class="mb-3">
            <button class="btn btn-primary btn-block">Gestion des Hotels</button>
        </form>
        <form action="FiltrageController" class="mb-3">
            <button class="btn btn-primary btn-block">Filtrag</button>
        </form>
        
        
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>