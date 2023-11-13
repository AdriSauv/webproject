<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"%>
<%@ page import="webproject.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier Article</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
<body>
	<main>
		<form action="MyServlet?flag=modifyArticle" method="post">
			<fieldset>
                <legend>Modifier Article</legend>
				<label for="oldDesignation">Désignation :</label>
				
				<select name="oldDesignation">
				<%
					CreerConnexion cc = new CreerConnexion();
	      			cc.etablirConnexion();
		      		Article article = new Article();
		      		List<Article> listeArticle = cc.listArticle();
		      		cc.cloturerConnexion();
		      		String item;
					for (int i=0; i<listeArticle.size(); i++)
					{
				    	item = (String) listeArticle.get(i).getDesignation() ;
				%>
					   <option value="<%=item%>"><%=item%></option>
				<%
					}
				%>
				</select>
				<br>
				<br>
				
                <label for="nvxDesignation">Nouvelle désignation :</label>
				<input type="text" id="nvxDesignation" name="nvxDesignation" value="">
				<br>
				<br>
				<label for="nvxPrix">Nouveau Prix :</label>
				<input type="number" id="nvxPrix" name="nvxPrix" value="">
				<br>
				<br>
				<label for="nvxQtx">Nouvelle Quantité :</label>
				<input type="number" id="nvxQtx" name="nvxQtx" value="">
				<br>
				<br>
	      		<label for="newCat" class="form-label mt-4">Categorie</label>
		      	<select id="newCat" name="newCat">
		      	
		      	<%
	      			cc.etablirConnexion();
		      		Categorie cat = new Categorie();
	      			List<Categorie> liste = cc.listCategorie();
		      		cc.cloturerConnexion();
		      		for( int i =0; i<liste.size(); i++) {
		      			int id= liste.get(i).getIdCategorie() ;
		      			item = (String) liste.get(i).getDesignation();
		      	%>
		      	<option value="<%=id%>"><%=id%> <%=item%></option>
		      	<%
		      		}
		      	%>
		      	</select>
				<br>
				<br>
				<input type="submit" class="btn btn-outline-success" value="Valider">
		      	<input type="reset" class="btn btn-outline-danger" value="Reset">
		      	<a href="menuAdmin.jsp"><input type="button" class="btn btn-primary" value="Annuler"></a>
				<br>
				
			</fieldset>
		</form>
	</main>
</body>
</html>