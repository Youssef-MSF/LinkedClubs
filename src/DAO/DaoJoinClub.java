package DAO;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public interface DaoJoinClub {
	
	public ArrayList<ClubsMembers> readMembers(String clubId);
	public ArrayList<Student> getMembers(ArrayList<ClubsMembers> membersCNE);

}
