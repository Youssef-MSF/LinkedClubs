package WEB.Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DaoComment;
import DAO.DaoCommentImp;
import DAO.DaoJoinClub;
import DAO.DaoJoinClubImp;
import DAO.DaoPost;
import DAO.DaoPostImp;
import Services.Entities.ClubsMembers;
import Services.Entities.Comment;
import Services.Entities.Post;
import Services.Entities.Student;
import Services.Verification.CommentVerification;
import WEB.Models.PostsOfClub;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoPost daoPostImp;
	private DaoJoinClub daoJoinClubImp;
	private DaoComment daoCommentImp;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.daoPostImp=new DaoPostImp();
		this.daoJoinClubImp = new DaoJoinClubImp();
		this.daoCommentImp=new DaoCommentImp();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String CNE = ((Student) session.getAttribute("student")).getCNE();
		
		ArrayList<ClubsMembers> clubIds = this.daoJoinClubImp.readClubs(CNE);
		
		PostsOfClub postsOfClub = new PostsOfClub();
		
		ArrayList<Post> posts = new ArrayList<Post>();
		
		for(ClubsMembers clubsMembers: clubIds) {
			
			posts.addAll(this.daoPostImp.getPosts(clubsMembers.getClubId()));
			
		}
		
		Collections.shuffle(posts);
		
		postsOfClub.setPostsOfClub(posts);
		
		
		request.setAttribute("posts", postsOfClub.getPostsOfClub());

		request.getServletContext().getRequestDispatcher("/WEB-INF/JSP/Profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CommentVerification commentForm=new CommentVerification(this.daoCommentImp);
		Comment comment=commentForm.verifyComment(request);
		
		if(!commentForm.getErr().isEmpty()) {
			request.setAttribute("err",commentForm.getErr());
			request.setAttribute("comment", comment);
			doGet(request, response);
		}else response.sendRedirect("/LinkedClubs/profile");

	}

}
