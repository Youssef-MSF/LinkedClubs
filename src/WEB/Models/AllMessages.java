package WEB.Models;

import java.util.ArrayList;

import Services.Entities.Message;

public class AllMessages {
	
	private ArrayList<Message> allMessages;

	public AllMessages() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Message> getAllMessages() {
		return allMessages;
	}

	public void setAllMessages(ArrayList<Message> allMessages) {
		this.allMessages = allMessages;
	}

}
