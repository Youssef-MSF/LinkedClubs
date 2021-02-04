package DAO;

import java.util.ArrayList;

import Services.Entities.Notification;
import antlr.collections.List;

public interface DaoNotification {
	public Notification add(Notification notification);
	public ArrayList<Notification> getAll(String cne);
}
