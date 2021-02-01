package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Comment;
import Services.Entities.PostStudent;

public class DaoCommentImp implements DaoComment {

	public DaoCommentImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Comment add(Comment comment) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.openSession();
		try {
			session.beginTransaction();
			session.save(comment);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return comment;
	}

	@Override
	public ArrayList<Comment> getAllComments() {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			@SuppressWarnings("unchecked")
			ArrayList<Comment> getAllComments = (ArrayList<Comment>) session.createSQLQuery("SELECT * FROM comment").addEntity(Comment.class).list();
			session.getTransaction().commit();
			
			return getAllComments;
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

}
