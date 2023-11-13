<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="webproject.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>
		<main>
			<form action="MyServlet?flag=addArticle" method="post">
				<fieldset>
					<legend>Ajout Article</legend>
					<div class="form-group">
					    <label for="designation" class="form-label mt-4">Nom Article</label>
					    <input type="text" class="form-control" id="designation" name="designation">
				    </div>
				    <div class="form-group">
					    <label for="pu" class="form-label mt-4">Prix Unitaire</label>
					    <input type="number" class="form-control" id="pu" name="pu">
				    </div>
				    <div class="form-group">
					    <label for="qtx" class="form-label mt-4">Quantité</label>
					    <input type="number" class="form-control" id="qtx" name="qtx">
				    </div>
				    <div class="form-group row">
			      		<label for="categorie" class="form-label mt-4">Categorie</label>
				      	<select id="categorie" name="categorie">
				      	
				      	<%
				      		CreerConnexion cc = new CreerConnexion();
			      			cc.etablirConnexion();
				      		Categorie cat = new Categorie();
				      		List<Categorie> liste = cc.listCategorie();
				      		cc.cloturerConnexion();
				      		String item;
				      		int id;
				      		for( int i =0; i<liste.size(); i++) {
				      			item= (String) liste.get(i).getDesignation() ;
				      			id = liste.get(i).getIdCategorie();
				      	%>
				      	<option value="<%=id%>"><%=id%></option>
				      	<%
				      		}
				      	%>
				      	</select>
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