package DAO;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public interface DaoJoinClub {
	
	public ArrayList<ClubsMembers> readMembers(String clubId);
	public ArrayList<ClubsMembers> readClubs(String CNE);
	public ArrayList<Student> getMembers(ArrayList<ClubsMembers> membersCNE);
	public ArrayList<Club> getClubs(ArrayList<ClubsMembers> clubIds);

}
