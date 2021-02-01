package DAO;

import java.util.ArrayList;

import Services.Entities.Comment;

public interface DaoComment {
	
	public Comment add(Comment comment);
	public ArrayList<Comment> getAllComments();

}
