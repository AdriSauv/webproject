<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="src/main/webapp/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Menu</title>
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
			<a href="connexion.jsp">
				<button class="btn btn-outline-secondary">Se connecter</button>
			</a>
			<a href="inscription.jsp">
				<button class="btn btn-outline-secondary">S'inscrire</button>
			</a>
		</main>
	</body>
</html>