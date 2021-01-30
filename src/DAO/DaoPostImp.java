package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.ClubsMembers;
import Services.Entities.Post;
import Services.Verification.PostVerification;

public class DaoPostImp implements DaoPost{

	@Override
	public Post add(Post post) {
		// TODO Auto-generated method stub
		Session session=HibernateUtil.openSession();
		try {
			session.beginTransaction();
			session.save(post);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return post;
	}

	@Override
	public ArrayList<Post> getPosts(String clubId) {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			@SuppressWarnings("unchecked")
			ArrayList<Post> postsOfClub = (ArrayList<Post>) session.createSQLQuery("SELECT * FROM post WHERE club_clubId='" + clubId + "' ORDER BY publishedDate DESC").addEntity(Post.class).list();
			session.getTransaction().commit();
			
			System.out.println("POSTS ---> " + postsOfClub.get(1).getPostDescription());
			
			return postsOfClub;
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

}