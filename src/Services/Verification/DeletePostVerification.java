package Services.Verification;

import javax.servlet.http.HttpServletRequest;

import DAO.DaoPost;
import Services.Entities.Post;

public class DeletePostVerification {
	private DaoPost daoPostImPost;

	// Constructor
	public DeletePostVerification(DaoPost daoPostImp) {
		// TODO Auto-generated constructor stub
		this.daoPostImPost = daoPostImp;
	}
	
	// Public method to be called in the servlet
	public Post verifyDeletePost(HttpServletRequest request) {
		
		try {
			int postId = Integer.parseInt(request.getParameter("postId"));
			
			// Get the post object from the integer id
			Post post = daoPostImPost.find(postId);
			
			// Delete the corresponding post
			post = daoPostImPost.delete(post);
			
			return post;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

}
