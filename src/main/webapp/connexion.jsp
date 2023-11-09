<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Connexion</title>
		<link rel="stylesheet" href="css/bootstrap.min-century.css"/>
		<link rel="stylesheet" href="css/style.css"/>
	</head>
	<body>
	<% 
		String login = request.getParameter("pseudo");
		String pwd = request.getParameter("mdp");
		if(login == null){login = "";}
		if(pwd == null){pwd = "";}
		
		if(request.getMethod().equals("POST") &&
				login.equals("admin") &&
				pwd.equals("admin")){
	%>
	<h2>Bienvenue <%= login %></h2>
	<%
		}
		else {
	%>
	<div class="mt-5 row">
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
							<input type="submit" class="btn btn-primary" value="Valider">
							<input type="reset" class="btn btn-primary" value="Annuler">
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
		</div>
	</div>
		<% } %>
	</body>
</html>