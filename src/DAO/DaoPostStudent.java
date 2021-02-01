package DAO;

import java.util.ArrayList;

import Services.Entities.Post;
import Services.Entities.PostStudent;

public interface DaoPostStudent {
	public PostStudent add(PostStudent post_student);
	public ArrayList<PostStudent> getLikedPosts(String studentCNE);
	public PostStudent delete(PostStudent postStudent);
	
}