package DAO;

import java.util.ArrayList;

import Services.Entities.Post;
import Services.Verification.PostVerification;

public interface DaoPost {
	public Post add(Post post);
	public ArrayList<Post> getPosts(String clubId);
	public Post update(Post post);
	public Post find(int id);
}