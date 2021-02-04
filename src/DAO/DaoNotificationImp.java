package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Comment;
import Services.Entities.Notification;

public class DaoNotificationImp implements DaoNotification {

	@Override
	public Notification add(Notification notification) {
		Session session=HibernateUtil.openSession();
		try {
			session.beginTransaction();
			session.save(notification);
			session.getTransaction().commit();
			return notification;
		} catch (Exception e) {
			session.getTransaction().rollback();
			 //TODO handle exception
		}
		 //TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Notification> getAll(String cne) {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			@SuppressWarnings("unchecked")
			ArrayList<Notification> getAllNotifications = (ArrayList<Notification>) session.createSQLQuery("SELECT * FROM notification WHERE idStudent='"+cne+"'").addEntity(Notification.class).list();
			session.getTransaction().commit();
			
			return getAllNotifications;
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

	

}
