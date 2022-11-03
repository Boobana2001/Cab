
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Pojo.GooglePojo;

@WebServlet("/Booking")
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("json");
		try {
			Class.forName("org.postgresql.Driver");
			Connection dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
			Statement statement = dbcon.createStatement();
			String did = request.getParameter("did");
			String cid = request.getParameter("cid").toString();
			String pickuppoint = request.getParameter("pickuppoint");
			String destination = request.getParameter("destination");
			String pickupTime = request.getParameter("pickupTime");
			String pickupDate = request.getParameter("pickupDate");
			HttpSession session = request.getSession(false);
			statement.executeUpdate("insert into booking(did,cid,time,date,dept,arrival) values('" + did + "','" + cid
					+ "','" + pickupTime + "','" + pickupDate + "','" + pickuppoint + "','" + destination + "')");
			String json = "{'id':" + cid + "}";
			GooglePojo data = (GooglePojo) new Gson().fromJson(json, GooglePojo.class);
			out.println(data.getId());

			statement.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}