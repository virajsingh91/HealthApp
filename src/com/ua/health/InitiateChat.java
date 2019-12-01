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

public class InitiateChat extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		try {
			//String specialization = request.getParameter("specialization");
			String symptom = request.getParameter("symptom");
			HttpSession session = request.getSession();
			String pid = (String)session.getAttribute("pid");
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		String query = "insert into chat_details values(?,?,?,?,?)";    		
    		PreparedStatement stmt = con.prepareStatement(query);
    		stmt.setInt(1, 1);
    		stmt.setString(2, pid);
    		stmt.setString(3, "122");
    		stmt.setInt(4, 1);
    		stmt.setString(5, symptom);
    		stmt.execute();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
        request.getRequestDispatcher("PatientChat.jsp").forward(request, response); 
	}

}
