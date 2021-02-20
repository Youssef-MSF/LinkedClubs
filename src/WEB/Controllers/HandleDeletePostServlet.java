package WEB.Controllers;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DaoPost;
import DAO.DaoPostImp;
import Services.Entities.Post;
import Services.Verification.DeletePostVerification;

/**
 * Servlet implementation class HandleDeletePostServlet
 */
@WebServlet("/HandleDeletePost")
public class HandleDeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoPost daoPostImPost;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDeletePostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.daoPostImPost = new DaoPostImp();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Create object of DeletePostVerify
		DeletePostVerification deletePostVerify = new DeletePostVerification(daoPostImPost);
		
		// Get the deleted post
		Post post = deletePostVerify.verifyDeletePost(request);
		
		// Test if the deletion has succeded or not
		if (post != null) {
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write("<message>success</message>");
		}else {
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write("<message>failure</message>");
		}
	}

}
