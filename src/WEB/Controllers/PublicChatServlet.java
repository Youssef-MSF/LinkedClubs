package WEB.Controllers;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DaoMessage;
import DAO.DaoMessageImp;
import Services.Entities.Student;
import WEB.Models.AllMessages;

/**
 * Servlet implementation class PublicChatServlet
 */
@WebServlet("/pubchat")
public class PublicChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoMessage daoMessageImp;

	public void init(ServletConfig config) throws ServletException {
		this.daoMessageImp = new DaoMessageImp();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicChatServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");

		if (!(student == null)) {

			// Create a AllMessage object
			AllMessages messages = new AllMessages();

			messages.setAllMessages(daoMessageImp.getAllMessages());

			// Send messages to the jsp via the request
			request.setAttribute("messages", messages.getAllMessages());

			// TODO Auto-generated method stub
			request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/chatroom.jsp").forward(request, response);
		}else {
			response.sendRedirect("/LinkedClubs/Login");
		}
	}

}
