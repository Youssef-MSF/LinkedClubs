package DAO;


//the new imports
import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Student;




public class DaoStudentImp implements DaoStudent {
	//Attribute
	
	
	//Constructor
	public DaoStudentImp() {}
	
	
	@Override
	public Student add(Student student) {
		
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			session.save(student);
		}catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();
		
        return student;
	}
	
	@Override
	public Student find(String CNE) {
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			Student student=session.get(Student.class, CNE);
			session.getTransaction().commit();
			return student;
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

}
