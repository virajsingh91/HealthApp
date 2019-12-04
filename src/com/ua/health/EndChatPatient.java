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

public class EndChatPatient extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String chatid=(String)session.getAttribute("chatid");
		//String caseid=(String)session.getAttribute("caseid");
		String text="";
		System.out.println("chatid :" + chatid);
		try {
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		String query = "update chat_details set chat_active=? where chatid=?";    		
    		PreparedStatement stmt = con.prepareStatement(query);
    		stmt.setInt(1, 0);
    		stmt.setString(2, chatid);
    		stmt.executeUpdate();
    		con.close();
			
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		text="<p style=\"color:green\">Chat Closed Successfully for Case. Thank You !</p>";
		request.setAttribute("text", text);
		System.out.println("in patient end chat :" + text);
		request.getRequestDispatcher("NewFile4.jsp").forward(request, response);
		
	}
}
