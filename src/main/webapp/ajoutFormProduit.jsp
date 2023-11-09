<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="webproject.Categorie"%>
<%@ page import="webproject.MyServlet" %>
<%@ page import="webproject.CreerConnexion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
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
			      	<div class="collapse navbar-collapse" id="navbarColor01">
				      	<ul class="navbar-nav me-auto">
						</ul>
			    	</div>
			    </div>
			  </div>
			</nav>
		</header>
		<main>
			<form method="POST" action="MyServlet?flag=ajoutP">
				<fieldset>
					<legend>Ajout Article</legend>
					<div class="form-group row">
			      		<label for="designation" class="form-label mt-4">Designation</label>
				      	<div class="col-sm-10">
				        	<input type="text"  class="form-control" id="designation" name="designation">
				      	</div>
			      	</div>
			      	<div class="form-group row">
			      		<label for="prix" class="form-label mt-4">Prix</label>
				      	<div class="col-sm-10">
				        	<input type="number"  class="form-control" id="prix" name="prix">
				      	</div>
			      	</div>
			      	<div class="form-group row">
			      		<label for="qtx" class="form-label mt-4">Quantite</label>
				      	<div class="col-sm-10">
				        	<input type="number"  class="form-control" id="qtx" name="qtx">
				      	</div>
			      	</div>
			      	<div class="form-group row">
			      		<label for="categorie" class="form-label mt-4">Categorie</label>
				      	<select id="categorie" name="categorie">
				      	
				      	<%
				      		List<Categorie> categories = categories.fetchCategories();
				      		for ( Categorie categorie : categories){	
				      	%>
				      	<option value="<%= categorie.getIdCategorie()%>"><%= categorie.getDesignation() %></option>
				      	<%
				      		}
				      	%>
				      	</select>
			      	</div>
			      	<br>
			      	<input type="submit" class="btn btn-outline-success" value="Valider">
			      	<input type="reset" class="btn btn-outline-danger" value="Reset">
				</fieldset>
			</form>
		</main>
	</body>
</html>