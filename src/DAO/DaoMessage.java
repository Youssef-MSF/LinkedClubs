package DAO;

import java.util.ArrayList;

import Services.Entities.Message;

public interface DaoMessage {
	
	public Message add(Message message); // Add new public chat message
	public ArrayList<Message> getAllMessages(); // Get all the messages of the public chat

}
