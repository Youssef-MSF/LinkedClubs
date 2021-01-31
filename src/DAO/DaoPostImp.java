package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.ClubsMembers;
import Services.Entities.Post;
import Services.Entities.Student;
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
			session.beginTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Post update(Post post) {
		Session session=HibernateUtil.openSession();
		try {
			session.beginTransaction();
			Post pst=find(post.getId());
			pst.setPostDescription(post.getPostDescription());
			pst.setFileType(post.getFileType());
			
			if(!post.getFileLink().isEmpty()) {
				pst.setFileLink(post.getFileLink());
			}else {
				
			}
			
			session.update(pst);
			
			session.getTransaction().commit();	
			
			return pst;
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
		}
		// TODO Auto-generated method stub
		return post;
	}

	@Override
	public Post find(int id) {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			Post post=session.get(Post.class, id);
			session.getTransaction().commit();
			return post;
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

}