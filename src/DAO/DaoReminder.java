package DAO;

import java.util.ArrayList;

import Services.Entities.Reminder;

public interface DaoReminder {
	
	public Reminder add(Reminder reminder);
	public ArrayList<Reminder> getStudentReminder(String studentCNE);

}
