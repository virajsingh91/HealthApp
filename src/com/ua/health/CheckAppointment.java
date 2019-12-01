package com.ua.health;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
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
			String pid=(String)session.getAttribute("pid");
			SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
			Date dateobj = new Date();
			String current = dateTime.format(dateobj);
			System.out.println(dateTime.format(dateobj));
			String specialization = request.getParameter("specialization");
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		CallableStatement storedProc = con.prepareCall("{call check_appointments(?,?,?)}");
            storedProc.setString(1, specialization);
            storedProc.setString(2, current);
            storedProc.setString(2, pid);
            storedProc.execute();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		request.getRequestDispatcher("appointment.jsp").forward(request, response); 
	
	}
}
