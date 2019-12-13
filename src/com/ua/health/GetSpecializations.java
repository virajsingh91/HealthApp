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

public class GetSpecializations extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
			try {
				HttpSession session = request.getSession();
				String pid=(String)session.getAttribute("pid");
				System.out.println("pid :" + pid);
				String[][] spec= new String[100][100];
				String[][] app= new String[100][100];
				String query="";
				String query1="";
				String fname="";
				String mi="";
				String lname="";
				int i=0;
				/*SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
				Date dateobj = new Date();
				String current = dateTime.format(dateobj);
				System.out.println(dateTime.format(dateobj));
				String specialization = request.getParameter("specialization");*/
	            Connect c = new Connect();
	    		Connection con;
	    		con = c.JDBCConnection();
	    		//Get Specializations list
	    		query = "select * " + 
	    				"from specialists sp join specializations ss on " + 
	    				"sp.specializationid = ss.specializationid " + 
	    				"join doctors d on d.doctorid = sp.specialistid ";
	    		PreparedStatement stmt = con.prepareStatement(query);
	    		System.out.println("Query :" + query);
	    		ResultSet rs = stmt.executeQuery(query);
	    		
	    		while(rs.next()){
	                spec[i][0] = rs.getString("specializationid");
	                spec[i][1] = rs.getString("specializationname");
	                spec[i][2] = rs.getString("specialistid");
	                
	               
	                System.out.println(spec[i][0]);
	                System.out.println(spec[i][1] );
	             
	                i=i+1;
	             }rs.close();
	             request.setAttribute("speclength",i);
		 		request.setAttribute("spec",spec);
		 		session.setAttribute("spec", spec);
		 		 session.setAttribute("speclength",i);
	             i=0;
	           //Get Booked appointments list
		    		query1 = "Select a.appdate , a.starttime, a.endtime , e.firstname, e.middleinitial , e.lastname from appointments_new a join doctors d on  a.doctorid=d.doctorid join employees e on e.employeeid = d.doctorid where patientid= " + pid + "";
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
	 			
	 			
			} catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			request.getRequestDispatcher("appointment.jsp").forward(request, response); 
	  
	}

}
