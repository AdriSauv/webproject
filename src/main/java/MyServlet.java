

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class MyServlet
 */

@WebServlet("/MyServlet")

public class MyServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    CreerConnection cn = new CreerConnection();

    public MyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		if(flag.equalsIgnoreCase("connexion")) {
			try {
				this.doConnexion(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			this.doGet(request, response);
		}
		
	}

	private void doConnexion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String login = request.getParameter("email");
		String pwd = request.getParameter("pw");
		String pwdBDD = cn.verifierCoordonnees(login);
		
		if(pwdBDD==null) {
			request.getRequestDispatcher("/connectionKO.jsp").forward(request, response);
		}else {
			if(pwd.equals(pwdBDD)) {
				request.getRequestDispatcher("/connectionOK.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/connectionKO.jsp").forward(request, response);
			}
		}
	}

}
