<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Menu</title>
		<style>
			body {
				background-image: url('img/background1.jpg');
				/* background-size: cover; */
				background-repeat: no-repeat;
			}
			main {
				padding: 20px;
			}
			.btnAcc {
				display: flex;
			  	flex-direction: row;
			  	align-content: center;
			  	justify-content: space-evenly;
			  	width: 20%;
			  	height: auto;
			  	margin: auto;
			}
		</style>
	</head>
	<body>
		<header>
		<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="menu.jsp">Accueil</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="menu.jsp">Home
		          </a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		</header>
		<main>
			<div class="btnAcc">
				<a href="connexion.jsp">
					<button class="btn btn-outline-secondary">Se connecter</button>
				</a>
				<a href="inscription.jsp">
					<button class="btn btn-outline-secondary">S'inscrire</button>
				</a>
			</div>
		</main>
	</body>
</html>