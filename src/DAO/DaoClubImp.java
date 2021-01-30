package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public class DaoClubImp implements DaoClub {

	public DaoClubImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Club add(Club club) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Club find(String clubId) {
		// TODO Auto-generated method stub
		Session session=HibernateUtil.openSession();
		session.beginTransaction();
		try {
			Club club=session.get(Club.class, clubId);
			session.getTransaction().commit();
			return club;
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Club update(Club club) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
