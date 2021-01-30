package WEB.Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DaoJoinClub;
import DAO.DaoJoinClubImp;
import DAO.DaoPost;
import DAO.DaoPostImp;
import DAO.DaoStudent;
import DAO.DaoStudentImp;
import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Post;
import Services.Entities.Student;
import Services.Verification.PostVerification;

/**
 * Servlet implementation class ProfileClubServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet("/ProfileClub")
public class ProfileClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoPost daoPostImp;
	private DaoJoinClub daoJoinClubImp;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileClubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.daoPostImp=new DaoPostImp();
		this.daoJoinClubImp = new DaoJoinClubImp();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String clubId = ((Club) session.getAttribute("club")).getClubId();
		
		ArrayList<ClubsMembers> membersCNE = this.daoJoinClubImp.readMembers(clubId);
		
		ArrayList<Student> members = this.daoJoinClubImp.getMembers(membersCNE);
		
		ArrayList<Post> posts = this.daoPostImp.getPosts(clubId);
		
		request.setAttribute("members", members);
		request.setAttribute("membersCNE", membersCNE);
		request.setAttribute("posts", posts);
		
		request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/ProfileClub.jsp").forward(request, response);
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("do post method is called profile club");
		PostVerification postForm=new PostVerification(this.daoPostImp);
		Post post=postForm.verifyPost(request);
		
		if(!postForm.getErr().isEmpty()) {
			request.setAttribute("err",postForm.getErr());
			request.setAttribute("post", post);
			request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/ProfileClub.jsp").forward(request, response);
		}else response.sendRedirect("/LinkedClubs/ProfileClub");
		
		
		//doGet(request, response);
	}

}