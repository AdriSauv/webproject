package webproject;


import jakarta.servlet.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CreerConnexion cc = new CreerConnexion();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		if(flag.equalsIgnoreCase("connect")) {
			this.doConnexion(request,response);
		}else {
			if(flag.equalsIgnoreCase("inscrit")) {
				try {
					this.doInscription(request, response);
				} catch (ServletException | IOException | SQLException e) {
					e.printStackTrace();
				}
			}else {
				if(flag.equalsIgnoreCase("addCat")) {
					this.doAddCategorie(request,response);
				}else {
					if(flag.equalsIgnoreCase("modifyCat")) {
						this.doUpdateCategorie(request,response);
					}else {
						if(flag.equalsIgnoreCase("deleteCat")) {
							this.doDeleteCategorie(request,response);
						} else if(flag.equalsIgnoreCase("addArticle")){
							this.doAddArticle(request,response);
						} else if(flag.equalsIgnoreCase("deleteArticle")){
							this.doDeleteArticle(request,response);
						} else if(flag.equalsIgnoreCase("modifyArticle")){
							this.doModifyArticle(request,response);
						}
					}
				}
			}
		}
	}

	private void doInscription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		// sauvegarde du résultat de validation
		String resultat;
		Map<String,String> erreurs = new HashMap<String,String>();
		// Récupérer les valeurs des champs à partir du JSP
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String adresse = request.getParameter("adresse");
		String tel = request.getParameter("tel");
		int age = Integer.parseInt(request.getParameter("age"));
		String[] tabRadio = request.getParameterValues("sexe");
		String login = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		// récupérer la valeur du bouton radio
		String sexe = "";
		for(int i = 0; i < tabRadio.length; i++) {
			if(tabRadio[i] != null) {
				sexe = tabRadio[i];
			}
		}
		
		
		// Contrôle des champs
		try {
			this.validationAge(age);
		} catch (Exception e) {
			erreurs.put(""+age, e.getMessage());
		}
		try {
			this.validationNomination(fname);
		} catch (Exception e) {
			erreurs.put(fname, e.getMessage());
		}
		try {
			this.validationNomination(lname);
		} catch (Exception e) {
			erreurs.put(lname, e.getMessage());
		}
		try {
			this.validationMotsDePasse(pwd, pwd2);
		} catch (Exception e) {
			erreurs.put(pwd, e.getMessage());
		}
		// Résultat global des validations
		if(erreurs.isEmpty()) {
			resultat = "Succès de l'inscription";
			// INSERT INTO
			Users u = new Users(fname,lname,adresse,tel,age,sexe);
			cc.ajouterUsers(u);
			int idUsers = cc.idLastUsers();
			Compte c = new Compte(login, pwd, idUsers);
			cc.ajouterCompte(c);
		}else {
			resultat = "Échec d'inscription";
		}
		
		request.setAttribute("erreurs", erreurs);
		request.setAttribute("resultat", resultat);
		// Redirection
		
		request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		//response.sendRedirect("/inscrit.jsp");
	}

	// Vérification de l'âge
	public void validationAge(int age) throws Exception {
		if(age < 15 || age > 120) {
			throw new Exception("L'age doit etre compris entre 15 et 120");
		}
	}
	// Vérification du nom/prénom
	public void validationNomination(String ch) throws Exception {
		if(ch != null && ch.trim().length() < 3) {
			throw new Exception("Le champ doit être d'au moins 3 caractères");
		}
	}
	// Vérification du mot de passe et de sa confirmation
	public void validationMotsDePasse(String motDePasse, String confirmation) throws Exception {
		if(motDePasse != null && motDePasse.trim().length() != 0 &&
				confirmation != null && confirmation.trim().length() != 0) {
			if(!motDePasse.equals(confirmation)) {
				throw new Exception("les mots des passe ne sont pas les mêmes");
			}else {
				if(motDePasse.trim().length() < 3) {
					throw new Exception("Longueur insuffisant pour mots de passe");
				}
			}
		}else {
			throw new Exception("SVP saisir un mot des passe");
		}
	}
	// Vérification du pseudo
	public void validationPseudo(String pseudo) throws Exception {
		if(pseudo != null && pseudo.trim().length() != 0) {
			if(!pseudo.matches(
					"([^.@])(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
				throw new Exception("Pseudo non valide");	
			}
		}else {
			throw new Exception("SVP saisir un pseudo");
		}
	}
	
	private void doConnexion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("pseudo");
		String pwd = request.getParameter("mdp");
		String pwdBDD = cc.verifierCoordonnees(login);
		if(pwdBDD == null) {
			request.getRequestDispatcher("/connectionKO.jsp").forward(request, response);
		}else {
			if(pwd.equals(pwdBDD)) {
				request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/connectionKO.jsp").forward(request, response);
			}
		}
	}

	private void doDeleteCategorie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String designation = request.getParameter("deleteCat");
		session.setAttribute("msgSup", "");
		if(cc.verifierArticleAvantSuppressionCategorie(designation)) {
			session.setAttribute("msgSupCat", "Suppression impossible : catégorie " + designation + " utilisé dans Article");
			request.getRequestDispatcher("/deleteCategorie.jsp").forward(request, response);
		}else {
			cc.supprimerCategorie(designation);
			session.setAttribute("msgSup", "OK");
			session.setAttribute("msgSupCat", "Suppression de la catégorie " + designation + " réussie");
			request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		}
	}
	private void doAddCategorie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		String designation = request.getParameter("designation");
		String msgReponse = "";
		if(!designation.isEmpty() && designation != null) {
			msgReponse = cc.ajouterCategorie(designation);
			session.setAttribute("msgReponse", msgReponse);
			//session.setAttribute("msgAddCat", "Ajout du catégorie " + designation + " réussie");
			request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);	
		}else {
			msgReponse = "Il faut préciser une catégorie à ajouter.";
			session.setAttribute("msgReponse", msgReponse);
			request.getRequestDispatcher("/addCategorie.jsp").forward(request, response);
		}
	}
	private void doUpdateCategorie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String nvxDesignation = request.getParameter("nvxDesignation");
		String ancienneDesignation = request.getParameter("eltSelected");
		session.setAttribute("msgModif", "OK");
		session.setAttribute("msgModifCat", "Modification de la catégorie " + ancienneDesignation + " vers " + nvxDesignation + " réussie");
		cc.modifierCategorie(ancienneDesignation, nvxDesignation);
		request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		
	}
	private void doAddArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designation = request.getParameter("designation"); 
		int pu = Integer.parseInt(request.getParameter("pu")); 
		int qtx = Integer.parseInt(request.getParameter("qtx"));
		int idCategorie = Integer.parseInt(request.getParameter("categorie"));
		
		if(!designation.isEmpty()) {
			cc.ajoutArticle(designation,pu,qtx, idCategorie);
			request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		}
		
	}
	private void doDeleteArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String designation = request.getParameter("deleteArticle");
		session.setAttribute("msgSup", "");
		cc.supprimerArticle(designation);
		request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
	}
	
	private void doModifyArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nvxDesignation = request.getParameter("nvxDesignation");
		String oldDesignation = request.getParameter("oldDesignation");
		String nvxPrix = request.getParameter("nvxPrix");
		String nvxQtx = request.getParameter("nvxQtx");
		int newCat = Integer.parseInt(request.getParameter("newCat"));
		
		cc.modifierArticle(oldDesignation, nvxDesignation, nvxPrix, nvxQtx, newCat);
		request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
		
	}
}
