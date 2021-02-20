package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Message;

public class DaoMessageImp implements DaoMessage {

	public DaoMessageImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Message add(Message message) {
		Session session = HibernateUtil.openSession();
		try {
			session.beginTransaction();
			session.save(message);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return message;
	}

	@Override
	public ArrayList<Message> getAllMessages() {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			@SuppressWarnings("unchecked")
			ArrayList<Message> getAllMessages = (ArrayList<Message>) session.createSQLQuery("SELECT * FROM message").addEntity(Message.class).list();
			session.getTransaction().commit();
			
			return getAllMessages;
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

}
