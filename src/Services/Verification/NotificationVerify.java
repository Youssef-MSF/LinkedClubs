package Services.Verification;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import DAO.DaoNotification;
import DAO.DaoPost;
import Services.Entities.Notification;
import Services.Entities.Post;
import Services.Entities.Student;

public class NotificationVerify {
	//Variables
	private DaoNotification daoNotificationImp;
	private DaoPost daoPostImp;
	
	
	//Constructor
	public NotificationVerify(DaoNotification daoNotificationImp, DaoPost daoPostImp) {
		super();
		this.daoNotificationImp = daoNotificationImp;
		this.daoPostImp = daoPostImp;
	}
	public NotificationVerify() {}
	
	//Main Function
	public Notification notificatinFct(HttpServletRequest request) {
			//Getting parameters
			 String title=request.getParameter("title");
			 String date=request.getParameter("date");
			 String postId=request.getParameter("postId");

			Notification notification=new Notification();
			//Getting the id of the student to idStudent notification
			HttpSession session=request.getSession();
			Student student=(Student) session.getAttribute("student");
			notification.setIdStudent(student.getCNE());
			notification.setDate(date);
			notification.setTitle(title);
			//Getting the post to set notification field
			System.out.println("post id "+Integer.parseInt(postId));
			Post post=this.daoPostImp.find(Integer.parseInt(postId));
			post.setNotification(notification);
			//Insert notification to data base
			this.daoNotificationImp.add(notification);
			//updating the post for notification field
			Post pstPost =this.daoPostImp.updateNotification(post);
			return notification;
	}
	
}
