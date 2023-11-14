<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				/* background-size: cover; */
				background-repeat: no-repeat;
			}
			main {
				padding: 20px;
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
		<div class="mt-4 row">
	        <div class="mx-auto col-8 col-md-6 col-lg-4">
			<form class="form-group" action="MyServlet?flag=connect" method="POST">
				<fieldset>
					<!-- <legend>Se connecter</legend> -->
					<table>
						<tr>
							<td><label for="pseudo">Nom d'utilisateur</label></td>
							<td><input class="form-control username" type="text" id="pseudo" name="pseudo"></td>
						</tr>
						<tr>
							<td><label>Mot de passe</label></td>
							<td><input class="form-control password" type="password" id="mdp" name="mdp"></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="submit" class="btn btn-success" value="Valider">
								<input type="reset" class="btn btn-primary" value="Annuler">
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
			<a href="menu.jsp"><button class="btn btn-danger">Retour</button></a>
			</div>
		</div>
	</body>
</html>