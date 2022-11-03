import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Addcar")
@MultipartConfig(maxFileSize = 16177215)
public class Addcar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("json");
		try {
			Class.forName("org.postgresql.Driver");
			Connection dbcon = DriverManager.getConnection("jdbc:postgresql://ec2-44-199-9-102.compute-1.amazonaws.com:5432/d7edesbjtg8p92", "mkeofhmtzymzfb", "8362708bf13eb488bde191ca3abf83b65fb60d71f7b99eaf86483c2ab68459d0");
			Statement statement = dbcon.createStatement();
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String pwd = request.getParameter("npwd");
			String rpwd = request.getParameter("rpwd");
			String model = request.getParameter("model");
			String color = request.getParameter("color");
			String no = request.getParameter("no");
			Part opanPart = request.getPart("opan");
			Part opbPart = request.getPart("opb");
			Part oaadharPart = request.getPart("oaadhar");
			Part rcPart = request.getPart("rc");
			Part insurancePart = request.getPart("insurance");
			Part permitPart = request.getPart("permit");
			Part licensePart = request.getPart("license");
			Part daadharPart = request.getPart("daadhar");
			Part daddproofPart = request.getPart("daddproof");
			InputStream opan, opb, oaadhar, rc, insurance, permit, license, daadhar, daddproof;
			opan = opanPart.getInputStream();
            opb = opbPart.getInputStream();
			oaadhar = oaadharPart.getInputStream();
			rc = rcPart.getInputStream();
			insurance = insurancePart.getInputStream();
			permit = permitPart.getInputStream();
			license = licensePart.getInputStream();
			daadhar = daadharPart.getInputStream();
			daddproof = daddproofPart.getInputStream();
			statement.executeUpdate("insert into driver(name,ph,uname,pwd,rpwd,opan,opb,oaadhar,rc,insurance,permit,license,daadhar,daddproof,model,colour,no) values('" + name + "','" + phone + "','"+ email + "','" + pwd + "','" + rpwd + "','" + opan + "','" + opb + "','" + oaadhar + "','" + rc + "','" + insurance + "','" + permit + "','" + license + "','" + daadhar + "','" + daddproof + "','" + model + "','" + color + "','" + no + "')");
			out.println("done");
			statement.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
