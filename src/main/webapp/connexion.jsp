<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<title>Connexion</title>
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
	<%
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		if(email==null){
			email="";
		}
		if(pw==null){
			pw="";
		}
		if(request.getMethod().equals("POST") && email.equals("admin@admin") && pw.equals("admin")){
	%>
	<h2>
		Bienvenue <%= email%>
	</h2>
	<%
		}
		else {
	%>
			<form action="MyServlet?flag=connexion" method="POST">
				<fieldset>
					<div class="form-group">
				      <label for="email" class="form-label mt-4">Email address</label>
				      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
				    </div>
				    <div class="form-group">
				      <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
				      <input type="password" class="form-control" id="pw" placeholder="Password" autocomplete="off" name="pw">
				    </div>
				    <br>
				    <button type="submit" class="btn btn-primary">Submit</button>
				    <button type="reset" class="btn btn-primary">Reset</button>
				</fieldset>
			</form>
	<%
		}
	%>
		</main>
	</body>
</html>