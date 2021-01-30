package DAO;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;

import DAO.UTIL.HibernateUtil;
import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public class DaoJoinClubImp implements DaoJoinClub {

	public DaoJoinClubImp() {
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ClubsMembers> readMembers(String clubId) {
		// TODO Auto-generated method stub
				Session session=HibernateUtil.openSession();
				session.beginTransaction();
				try {
					ArrayList<ClubsMembers> getAllClubsAndMembers = (ArrayList<ClubsMembers>) session.createSQLQuery("SELECT * FROM clubsmembers WHERE clubId='" + clubId + "'").addEntity(ClubsMembers.class).list();
					session.getTransaction().commit();
					
					System.out.println(getAllClubsAndMembers.get(0).getCNE());
					
					return getAllClubsAndMembers;
					
				}catch(Exception e) {
					session.getTransaction().rollback();
					e.printStackTrace();
				}
				
				return null;
		
	}
	
	@Override
	public ArrayList<Student> getMembers(ArrayList<ClubsMembers> membersCNE) {
		// TODO Auto-generated method stub
		
		DaoStudent daoStudentImp = new DaoStudentImp();
		
		ArrayList<Student> members = new ArrayList<Student>();
		
		for (ClubsMembers clubsMembers : membersCNE) {
			System.out.println("tttttttttttt --> " + clubsMembers.getCNE());
			members.add(daoStudentImp.find(clubsMembers.getCNE()));
		}
		
		return members;
	}
	

}
