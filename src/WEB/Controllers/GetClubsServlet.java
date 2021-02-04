package WEB.Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DaoClubImp;
import Services.Entities.Club;

@WebServlet("/GetClubs")
public class GetClubsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Club> clubImages;
	private String result;

	public GetClubsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Club> clubs = DaoClubImp.getClubImages();
		ArrayList<String> images = new ArrayList<String>();
		Collections.shuffle(clubs);
		/*
		 * while(images.size()<=4) { int rand = new Random().nextInt(clubs.size());
		 * String clubImage = clubs.get(rand).getImage(); if
		 * (!(images.contains(clubImage))) { images.add(clubImage); } }
		 */

		this.result = "<result>";
		
		for (int i = 0; i < 4; i++) {
			this.result += "<image>" + clubs.get(i).getImage() + "</image><clubId>" + clubs.get(i).getClubId() + "</clubId>";
		}
		this.result += "</result>";

		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(this.result);
	}

}