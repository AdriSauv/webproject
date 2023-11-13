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
		<form action="MyServlet?flag=modifyCat" method="post">
			<fieldset>
                <legend>Modifier catégorie</legend>
                <label for="nvxDesignation">Nouvelle désignation :</label>
				<input type="text" id="nvxDesignation" name="nvxDesignation" value="">
				<br>
				<label for="designation">Désignation :</label>
				
				<select name="eltSelected">
				<%
					CreerConnexion cc = new CreerConnexion();
	      			cc.etablirConnexion();
		      		Categorie cat = new Categorie();
		      		List<Categorie> liste = cc.listCategorie();
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