<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajouter Catégorie</title>
</head>
<body>
	<main>
		<form action="MyServlet?flag=addCat" method="post">
			<fieldset>
				<legend>Ajout Categorie</legend>
				<div class="form-group">
				    <label for="designation" class="form-label mt-4">Nom Catégorie</label>
				    <input type="text" class="form-control" id="designation" name="designation">
			    </div>
			    <input type="submit" class="btn btn-outline-success" value="Valider">
		      	<input type="reset" class="btn btn-outline-danger" value="Reset">
		      	<a href="menuAdmin.jsp"><input type="button" class="btn btn-primary" value="Annuler"></a>
			</fieldset>
		</form>
	</main>
</body>
</html>