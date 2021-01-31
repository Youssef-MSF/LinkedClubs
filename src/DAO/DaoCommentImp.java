package DAO;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Comment;

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

}
