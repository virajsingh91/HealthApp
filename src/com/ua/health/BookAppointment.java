package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
			//String [][] app=(String[][])session.getAttribute("app");
			String [][] app = new String [1000][1000];
			int speclength=(int)session.getAttribute("speclength");
			int applength=(int)session.getAttribute("applength");
			request.setAttribute("speclength",speclength);
	 		request.setAttribute("spec",spec);
	 		request.setAttribute("app",app);
	 		request.setAttribute("applength",applength);
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
    		
    		String query2 = "insert into appointments_new values(?,?,?,?,?,?,?)";  
    		PreparedStatement stmt2 = con.prepareStatement(query2);
    		stmt2.setInt(1, 7);
    		stmt2.setString(2, "In-Person");
    		stmt2.setString(3, (appDate + " " + startTime ));
    		stmt2.setString(4, (appDate + " " + startTime ));
    		stmt2.setString(5, appDate);
    		stmt2.setString(6, pid);
    		stmt2.setString(7, docid);
    		
    		System.out.println("Query :" + query2);
    		System.out.println(appDate + " " + startTime);
    		stmt2.execute();
    		
    		//Get Booked appointments list
    		int i=0;
    		String fname="";
			String mi="";
			String lname="";
    		String query1 = "Select a.appdate , a.starttime, a.endtime , e.firstname, e.middleinitial , e.lastname from appointments_new a join doctors d on  a.doctorid=d.doctorid join employees e on e.employeeid = d.doctorid where patientid= " + pid + "";
    		PreparedStatement stmt1 = con.prepareStatement(query1);
    		System.out.println("Query :" + query1);
    		ResultSet rs1 = stmt1.executeQuery(query1);
    		
    		while(rs1.next()){
                app[i][0] = rs1.getString("appdate");
                app[i][1] = rs1.getString("starttime");
                app[i][2] = rs1.getString("endtime");
                fname= rs1.getString("firstname");
                mi= rs1.getString("middleinitial");
                lname= rs1.getString("lastname");
                app[i][3] = fname + " " + mi + " " + lname;
               
                
             
                i=i+1;
             }
    	rs1.close();
         con.close();
         request.setAttribute("applength",i);
			request.setAttribute("app",app);
			session.setAttribute("applength", i);
 		 session.setAttribute("app",app);
			
    		
    		con.close();
    		text="<p style=\"color:green\">Appointment Booked Successfully</p>";
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            text="<p style=\"color:red\">Appointment Booking Failed. Please try again.</p>";
        }
		request.setAttribute("text", text);
		request.getRequestDispatcher("appointment.jsp").forward(request, response);
	}

}
