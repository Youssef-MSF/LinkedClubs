package WEB.Controllers;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.DaoMessage;
import DAO.DaoMessageImp;
import Services.Entities.Message;

/**
 * Servlet implementation class HandleMessagesServlet
 */
@WebServlet("/HandleMessages")
public class HandleMessagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoMessage daoMessageImp;
	
	public void init(ServletConfig config) throws ServletException {
		this.daoMessageImp = new DaoMessageImp();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleMessagesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Create the message
		Message message = new Message();
		
		String image = request.getParameter("image");
		String messageTxt = request.getParameter("message");
		
		message.setImage(image);
		message.setMessage(messageTxt);
		
		this.daoMessageImp.add(message);
		
	}


}
