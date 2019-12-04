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

public class InitiateChat extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String chatid="";
		try {
			//String specialization = request.getParameter("specialization");
			String symptom = request.getParameter("symptom");
			System.out.println("symptom :" + symptom);
			HttpSession session = request.getSession();
			String pid = (String)session.getAttribute("pid");
			System.out.println("pid :" + pid);
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		String query = "insert into chat_details values(?,?,?,?,?)";    		
    		PreparedStatement stmt = con.prepareStatement(query);
    		stmt.setInt(1, 1);
    		stmt.setInt(2, 122);
    		stmt.setString(3, pid);
    		stmt.setInt(4, 1);
    		stmt.setString(5, symptom);
    		stmt.execute();
    		
    		//Get the chatid
    		String chat ="select max(chatid) as chatid from chat_details";
    		PreparedStatement stmtt = con.prepareStatement(chat);
    		//stmt.setString(1, docid);
    		System.out.println("Query :" + chat);
    		ResultSet rss = stmtt.executeQuery(chat);
    		while(rss.next()){
                chatid = rss.getString("chatid");
                request.setAttribute("chatid",chatid);
                System.out.println("case id : "+chatid);
                session.setAttribute("chatid",chatid );
    		}
    		con.close();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
        request.getRequestDispatcher("PatientChat.jsp").forward(request, response); 
	}

}
