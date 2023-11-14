<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Connexion</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<style>
			body {
				background-image: url('img/background1.jpg');
				background-size: cover;
				background-repeat: no-repeat;
			}
			form {
				color: white;
			}
		</style>
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="accueil.jsp">${login}</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarColor01">
			      <ul class="navbar-nav me-auto">
			        <li class="nav-item">
			          <a class="nav-link active" href="menuAdmin.jsp">Home</a>
			        </li>
			        <li>
			          <a class="nav-link" href="accueil.jsp">Se déconnecter</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</header>
	</body>
</html>