package Services.Verification;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;

import DAO.DaoPost;
import DAO.DaoPostImp;
import Services.Entities.Club;
import Services.Entities.Post;

public class PostVerification {
	//Variables
	private HashMap<String, String> err=new HashMap<String, String>();
	private DaoPost daoPostImp;
	
	//Constructors
	public PostVerification(DaoPost daoPostImp) {
		this.daoPostImp=daoPostImp;
	}
	
	//Verification function
	public Post verifyPost(HttpServletRequest request) throws IOException, ServletException {
		
		// Get the current project path
		String applicationPath = request.getServletContext().getRealPath("");

		// Get the upload folder for profile images
		String profileImagesUploadDirectory = applicationPath + File.separator + "Images" + File.separator
						+ "postFiles";

		// Getting files
		Part postImagePart = request.getPart("postFile");
		
		//System.out.println("hhhhhhhh : " + postImagePart.getContentType());
		
		//Getting parameters
		String postDescription=(String) request.getParameter("description");
		String postFileLink=(String) postImagePart.getSubmittedFileName();
		
		//Create post object
		Post post=new Post();
		
		//Call verification functions
		verifyPostDescription(postDescription, post);
		verifyFileLink(postImagePart, postFileLink, post);
		
		HttpSession session = request.getSession();
		Club club = (Club) session.getAttribute("club");
		
		post.setClub(club);
		
		if(err.isEmpty()) {
			postImagePart.write(profileImagesUploadDirectory + File.separator + postFileLink);
			//Setting the date of the post
			post.setPublishedDate(new java.util.Date());
			//Inserting the post in the dataBase
			post=this.daoPostImp.add(post);
		}
		
		
		return post;
	}
	
	//functions
	public void verifyPostDescription(String postDescription, Post post) {
		// Setting post description
		post.setPostDescription(postDescription);
		//Sometimes we will have a post width description sometimes not
	}
	
	public void verifyFileLink(Part postImagePart, String fileLink,Post post) {
		//Setting post image
		post.setFileLink(fileLink);
		
		//Verify the type of the file
		if(!postImagePart.getContentType().equals("application/octet-stream")) {
			post.setFileType(postImagePart.getContentType());
		}
		
		try {
			if(post.getPostDescription().isEmpty() && post.getFileLink().isEmpty())
				throw new Exception("Please make sure to insert a valid post information");
		} catch (Exception e) {
			err.put("errPost", e.getMessage());
			// TODO: handle exception
		}
	}
	
	//Getters and Setters
	public HashMap<String, String> getErr() {
		return err;
	}

	public void setErr(HashMap<String, String> err) {
		this.err = err;
	}
	
	
}