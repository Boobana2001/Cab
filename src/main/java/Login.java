

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Pojo.GooglePojo;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("json");
		Connection dbcon;
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		try {
			Class.forName("org.postgresql.Driver");
			dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
			PrintWriter out=response.getWriter();  
		    String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			ResultSet rs;
			PreparedStatement statement = dbcon.prepareStatement("select id from customer where uname= ? and pwd= ?");
			statement.setString(1, email);
			statement.setString(2, pwd);
			rs = statement.executeQuery();
			if (rs.next()) { 
		    String id = Integer.toString(rs.getInt("id"));
			String json = "{'id':" + id + "}";
			GooglePojo data = (GooglePojo) new Gson().fromJson(json, GooglePojo.class);
			out.println(data.getId());
			//chain.doFilter(request, response);
		    }  
		    else{
		    	String msg = "0";
				out.println(msg);  
		    }  
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}   
		catch (Exception e) {
			e.printStackTrace();
		}   
	}

}
