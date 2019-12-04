package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BookAppointment extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String text="";
		try {
			
			HttpSession session = request.getSession();
			String appDate=(String)session.getAttribute("appDate");
			String [][] spec=(String[][])session.getAttribute("spec");
			int speclength=(int)session.getAttribute("speclength");
			request.setAttribute("speclength",speclength);
	 		request.setAttribute("spec",spec);
	 		System.out.println("spec :" + spec);
			String pid=(String)session.getAttribute("pid");
			System.out.println("pid :" + pid);
			String docid=(String)session.getAttribute("specid");
			System.out.println("docid :" + docid);
			String startTime = request.getParameter("startTime");
			System.out.println("Start Time :" + startTime);
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		
    		/*//Insert into appointments
    		//String query2 = "insert into appointments values(?,?,?,?,?,?,?)";  
    		String query2 = "insert into appointment_slots_new values(?,?,?,?,?,?,?)";  
    		PreparedStatement stmt2 = con.prepareStatement(query2);
    		stmt2.setInt(1, 7);
    		stmt2.setString(2, "In-Person");
    		stmt2.setString(3, startTime);
    		stmt2.setString(4, startTime);
    		stmt2.setString(5, appDate);
    		stmt2.setString(6, pid);
    		stmt2.setString(7, docid);
    		
    		System.out.println("Query :" + query2);*/
    		
    		/*stmt2.execute();*/
    		
    		String query2 = "insert into appointment_slots_new values(?,?,?)";  
    		PreparedStatement stmt2 = con.prepareStatement(query2);
    		stmt2.setInt(1, 7);
    		//stmt2.setString(2, "In-Person");
    		stmt2.setString(2, startTime);
    		stmt2.setString(3, startTime);
    		//stmt2.setString(5, appDate);
    		//stmt2.setString(6, pid);
    		//stmt2.setString(7, docid);
    		
    		System.out.println("Query :" + query2);
    		
    		stmt2.execute();
    		
    		
    		con.close();
    		text="<p style=\"color:green\">Appointment Booked Successfully</p>";
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            text="<p style=\"color:red\">Appointment Booking Failed. Please try again.</p>";
        }
		request.getRequestDispatcher("SignIn.jsp").forward(request, response);
	}

}
