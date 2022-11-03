import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import Pojo.GooglePojo;

@WebServlet("/Creg")

public class Creg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		response.setContentType("json");
		try {
			Connection dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
			Statement statement = dbcon.createStatement();
			// Statement statement1 = dbcon.createStatement();
			HttpSession session = request.getSession();
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String npwd = request.getParameter("npwd");
			String rpwd = request.getParameter("rpwd");
			statement.executeUpdate("insert into customer(name,ph,uname,pwd,rpwd) values('" + name + "','" + phone+ "','" + email + "','" + npwd + "','" + rpwd + "')");

			ResultSet rs = statement.executeQuery("select id from customer where name= '" + name + "'");
			if (rs.next()) {
				String id = Integer.toString(rs.getInt("id"));
				String json = "{'id':" + id + "}";
				GooglePojo data = (GooglePojo) new Gson().fromJson(json, GooglePojo.class);
				//session.setAttribute("cid", data.getId());
				out.println(data.getId());
			}

			dbcon.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}