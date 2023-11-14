<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webproject.Compte" %>
<%@ page import="java.util.*" %>
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
				background-size: cover;
				background-repeat: no-repeat;
				color: white;
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
			#disconnect {
				display: flex;
				position: relative;
			}
			a {
				text-decoration: underline;
				color: white;
			}
		</style>
		<title>Mon Compte</title>
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
			          <a class="nav-link" href="menuAdmin.jsp">Home</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="monCompte.jsp">Mon Compte</a>
			        </li>
			        <li>
			          <a class="nav-link" href="accueil.jsp" id="disconnect">Se déconnecter</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</header>
		<main>
	        <div class="container-fluid">
	            <div class="container-id">
	            <%
	            	Compte loggedInUser = (Compte) session.getAttribute("loggedInUser");
	            	String username = (loggedInUser != null) ? loggedInUser.getLogin() : "";
	            %>
	                <label for="pseudo">Nom d'utilisateur : ${login}</label>
	                <a href="changerPseudo.jsp">changer le nom d'utilisateur</a>
	            </div>
	            <div class="container-pwd">
	                <label for="pwd">Mot de passe : ******</label>
	                <a href="changerPwd.jsp">changer le mot de passe</a>
	            </div>
	        </div>
    	</main>
	</body>
</html>