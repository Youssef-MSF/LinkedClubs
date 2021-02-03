package DAO;

import java.util.ArrayList;

import Services.Entities.Club;
import Services.Entities.ClubsMembers;
import Services.Entities.Student;

public interface DaoClub {
	
	public Club add(Club club);
	public Club find(String clubId);
	public Club update(Club club);
	public ArrayList<Club> getAllClubs();

}
