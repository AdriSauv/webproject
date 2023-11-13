<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"%>
<%@ page import="webproject.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Supprimer Article</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
<body>
	<main>
		<form action="MyServlet?flag=deleteArticle" method="post">
			<fieldset>
                <legend>Supprimer Article</legend>
				<label for="deleteArticle">Désignation :</label>
				<select name="deleteArticle">
				<%
					CreerConnexion cc = new CreerConnexion();
	      			cc.etablirConnexion();
		      		Article article = new Article();
		      		List<Article> liste = cc.listArticle();
		      		cc.cloturerConnexion();
		      		String item;
					for (int i=0; i<liste.size(); i++)
					{
				    	item = (String) liste.get(i).getDesignation() ;
				%>
					   <option value="<%=item%>"><%=item%></option>
				<%
					}
				%>
				</select>
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