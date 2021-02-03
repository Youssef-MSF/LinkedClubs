package DAO;

import java.util.ArrayList;

import Services.Entities.Post;
import Services.Entities.Student;
import Services.Verification.PostVerification;

public interface DaoPost {
	public Post add(Post post);
	public ArrayList<Post> getPosts(String clubId);
	public Post update(Post post);
	public Post find(int id);
	public Post updateLikeNumber(Post post, Boolean isLiked);
	public Post updateCommentNumber(Post post);
}