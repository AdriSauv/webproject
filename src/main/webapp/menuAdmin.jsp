<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<script src="js/bootstrap.bundle.min.js"></script>
		<title>Page Admin</title>
	</head>
	<body>
		<header>
			<h2>Bonjour Admin </h2>
		</header>
		<main>
			<div class="d-grid gap-3">
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn btn-primary">Produit</button>
				  <div class="btn-group" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
				      <a class="dropdown-item" href="ajoutFormProduit.jsp">Ajouter</a>
				      <a class="dropdown-item" href="#">Modifier</a>
				      <a class="dropdown-item" href="#">Supprimer</a>
				    </div>
				  </div>
				</div>
			</div>
		</main>		
	</body>
</html>