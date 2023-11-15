<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajouter Catégorie</title>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<header>
		<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="accueil.jsp">Accueil</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="accueil.jsp">Home
		          </a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		</header>
	<main>
		<form action="MyServlet?flag=addCat" method="post">
			<fieldset>
				<legend>Ajout Categorie</legend>
				<div class="form-group">
				    <label for="designation" class="form-label mt-4">Nom Catégorie</label>
				    <input type="text" class="form-control" id="designation" name="designation">
			    </div>
			    <br>
			    <input type="submit" class="btn btn-outline-success" value="Valider">
		      	<input type="reset" class="btn btn-outline-danger" value="Reset">
		      	<a href="menuAdmin.jsp"><input type="button" class="btn btn-primary" value="Annuler"></a>
			</fieldset>
		</form>
	</main>
</body>
</html>