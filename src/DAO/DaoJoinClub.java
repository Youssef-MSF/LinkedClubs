package DAO;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public interface DaoJoinClub {
	
	public ClubsMembers add(ClubsMembers clubsMembers);
	public ArrayList<ClubsMembers> readMembers(String clubId);
	public ArrayList<ClubsMembers> readClubs(String CNE);
	public ArrayList<Student> getMembers(ArrayList<ClubsMembers> membersCNE);
	public ArrayList<Club> getClubs(ArrayList<ClubsMembers> clubIds);
	public ClubsMembers delete(ClubsMembers clubsMembers);
	public ClubsMembers update(ClubsMembers clubsMembers);
	public ArrayList<ClubsMembers> getAll();

}
