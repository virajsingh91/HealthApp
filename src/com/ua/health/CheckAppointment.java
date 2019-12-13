package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckAppointment extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String docid=(String)session.getAttribute("docid");
			String spec= "";
			String query="";
			spec = request.getParameter("spec");
			System.out.println("Spec " + spec);
			session.setAttribute("specid", spec);
	        String appDate = request.getParameter("appDate");
	        request.setAttribute("appDate", appDate);
	        session.setAttribute("appDate", appDate);
	        SimpleDateFormat dateTime1 = new SimpleDateFormat("dd-MMM-yy");
			Date dateobj1 = new Date();
			String current = dateTime1.format(dateobj1);
			System.out.println(dateTime1.format(dateobj1));
			current = current.toUpperCase();
			session.setAttribute("appDate", current);
			current = current.toUpperCase();
	        
			int i=0;
			String [][] timeslots = new String [100][100];
						//String specialization = request.getParameter("specialization");
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		
    		/*query = "With s as (select * from (select starttime, endtime from appointment_time_slots)) " + 
    				"select s.starttime as timeslotstarttime,s.endtime as timeslotendtime, a.appdate,a.doctorid from s left outer join appointments a " + 
    				"on a.starttime = s.starttime " + 
    				"where a.doctorid = "+ spec + " " + 
    				"and appdate != '" + current + "' " + 
    				"or( a.starttime is null " + 
    				"and a.endtime is null ) " + 
    				"order by s.starttime,s.endtime";*/
    		
    		query = "WITH s AS " + 
    				"(SELECT * FROM (SELECT starttime, endtime FROM appointment_slots_new)) " + 
    				
    				"SELECT to_char(cast(s.starttime as date),'hh12:mi:ss') as timeslotstarttime, " + 
    				"to_char(cast(s.endtime as date),'hh12:mi:ss') as timeslotendtime , to_char(cast(a.appdate as date),'DD-MON-YY') ,a.doctorid " + 
    				"FROM s " + 
    				"LEFT OUTER join appointments_new a on to_char(cast(a.starttime as date),'hh12:mi:ss') = to_char(cast(s.starttime as date),'hh12:mi:ss') " + 
    				"WHERE (a.doctorid = "+ spec + " " +
    				"AND to_char(cast(a.appdate as date),'DD-MON-YY') != '" + current + "' )" +  
    				"OR ( a.starttime is null AND a.endtime is null ) " + 
    				"ORDER BY s.starttime,s.endtime ";
    		PreparedStatement stmt = con.prepareStatement(query);
    		System.out.println("Query :" + query);
    		ResultSet rs = stmt.executeQuery(query);
    		
    		while(rs.next()){
                timeslots[i][0] = rs.getString("timeslotstarttime");
                timeslots[i][1] = rs.getString("timeslotendtime");
               
                System.out.println(timeslots[i][0]);
                System.out.println(timeslots[i][1] );
             
                i=i+1;
             }rs.close();
             con.close();
             request.setAttribute("length",i);
 			request.setAttribute("timeslots",timeslots);
    		/*CallableStatement storedProc = con.prepareCall("{call check_appointments(?,?,?)}");
            storedProc.setString(1, specialization);
            storedProc.setString(2, current);
            storedProc.setString(2, pid);
            storedProc.execute();*/
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		request.getRequestDispatcher("appointmentSlots.jsp").forward(request, response); 
	
	}
}
