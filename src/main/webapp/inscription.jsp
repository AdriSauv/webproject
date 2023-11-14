<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
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
	<div class="mt-5 row">
        <div class="mx-auto col-8 col-md-6 col-lg-4">
			<form class="form-example" action="MyServlet?flag=inscrit" method="POST">
  <fieldset>
    <!-- <legend>Inscription</legend> -->
    <div class="mb-3">
      <label for="firstName" class="form-label">Prénom</label>
      <input name="firstName" id="firstName" autofocus="autofocus" type="text" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <label for="lastName" class="form-label">Nom</label>
      <input name="lastName" id="lastName" type="text" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <label for="adresse" class="form-label">Adresse</label>
      <select name="adresse" id="adresse" class="form-select">
        <option value="none">Sélectionnez un pays</option>
        <option value="tn">Tunisie</option>
        <option value="es">Espagne</option>
        <option value="fr">France</option>
        <option value="it">Italie</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="tel" class="form-label">Téléphone</label>
      <input name="tel" id="tel" type="text" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <label for="age" class="form-label">Âge</label>
      <input name="age" id="age" type="number" class="form-control" size="20" />
    </div>

    <fieldset class="mb-3">
      <legend>Sexe</legend>
      <div class="form-check">
        <input name="sexe" id="sexeH" type="radio" value="H" class="form-check-input" checked />
        <label for="sexeH" class="form-check-label">Homme</label>
      </div>
      <div class="form-check">
        <input name="sexe" id="sexeF" type="radio" value="F" class="form-check-input" />
        <label for="sexeF" class="form-check-label">Femme</label>
      </div>
    </fieldset>

    <div class="mb-3">
      <label for="login" class="form-label">Pseudo</label>
      <input name="login" id="login" type="text" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <label for="pwd" class="form-label">Mot de passe</label>
      <input name="pwd" id="pwd" type="password" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <label for="pwd2" class="form-label">Mot de passe (confirmation)</label>
      <input name="pwd2" id="pwd2" type="password" class="form-control" size="20" />
    </div>

    <div class="mb-3">
      <input type="submit" class="btn btn-success" value="M'inscrire" />
      <input type="reset" class="btn btn-danger" value="Vider le formulaire" />
      <a href="menu.jsp"><input type="button" class="btn btn-secondary" value="Annuler"></a>
      <a href="connect.jsp"><input type="button" class="btn btn-primary" value="Se connecter"></a>
    </div>

    <div class="container aqua">
      <p class="${empty erreurs ? 'succes' : 'erreur'}">${resultat}</p>
    </div>

  </fieldset>
</form>
			
		   </div>
		  </div>
	</body>
</html>