package DAO;

import java.util.ArrayList;

import Services.Entities.Student;

public interface DaoStudent {
	
	public Student add(Student student);
	public Student find(String CNE);
	public Student update(Student student);
	public ArrayList<Student> getAll();
	
}
