<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
		<script src="js/bootstrap.bundle.min.js"></script>
		<style>
			body {
				background-image: url('img/background1.jpg');
				/* background-size: cover; */
				background-repeat: no-repeat;
			}
			main {
				padding: 20px;
				height: 100vh;
			}
			.btn-group {
				display: flex;
			  	flex-direction: row;
			  	align-content: center;
			  	justify-content: space-evenly;
			  	width: 20%;
			  	height: auto;
			  	margin: auto;
			}
		</style>
		<title>Page Admin</title>
	</head>
	<body>
		<header>
		<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
		  <div class="container-fluid">
		    <a class="navbar-brand">${login}</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="menuAdmin.jsp">Home</a>
		        </li>
		        <li class="nav-item">
		          <a href="monCompte.jsp"><button class="nav-link">MON COMPTE</button></a>
		        </li>
		        <li>
		          <a class="nav-link" href="logout.jsp">Se déconnecter</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		</header>
		<main>
			<div>
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn btn-secondary">Catégorie</button>
				  <div class="btn-group" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
				      <a class="dropdown-item" href="addCategorie.jsp">Ajouter</a>
				      <a class="dropdown-item" href="modifyCategorie.jsp">Modifier</a>
				      <a class="dropdown-item" href="deleteCategorie.jsp">Supprimer</a>
				    </div>
				  </div>
				</div>	
			</div>
			<br>
			<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				<button type="button" class="btn btn-secondary">Article</button>
				  <div class="btn-group" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
				      <a class="dropdown-item" href="addArticle.jsp">Ajouter</a>
				      <a class="dropdown-item" href="modifyArticle.jsp">Modifier</a>
				      <a class="dropdown-item" href="deleteArticle.jsp">Supprimer</a>
				    </div>
				 </div>
			</div>
		</main>		
	</body>
</html>