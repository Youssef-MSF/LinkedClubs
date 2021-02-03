package WEB.Controllers;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DaoClub;
import DAO.DaoClubImp;
import Services.Entities.Club;
import Services.Verification.AdminVerification;

/**
 * Servlet implementation class CreateClubServlet
 */
@WebServlet("/CreateClub")
public class CreateClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoClub daoClubImp;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateClubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.daoClubImp = new DaoClubImp();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/adminPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminVerification adminVerification = new AdminVerification(this.daoClubImp);
		Club club = adminVerification.verifyClub(request);
		if(adminVerification.getErr().isEmpty()) {
		
			response.sendRedirect("/LinkedClubs/ClubLogin");
			
		}else {
			request.setAttribute("club", club);
			request.setAttribute("err", adminVerification.getErr());
			request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/adminPage.jsp").forward(request, response);
		}
	}

}
