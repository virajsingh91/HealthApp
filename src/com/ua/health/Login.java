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


//@WebServlet("/login")
public class Login extends HttpServlet {
			
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        // read form fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
       System.out.println("username: " + username);
       System.out.println("password: " + password);
      
       //session.setAttribute("UserName", username);
       
        String query="";
        String user="";
        String pass ="";
        String sid ="";
        try {
        Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		query = "select * from patients where username ='" + username +"'";
		PreparedStatement stmt = con.prepareStatement(query);
		//stmt.setString(1, username);
		System.out.println("Query :" + query);
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
            user = rs.getString("username");
            pass = rs.getString("password");
            sid = rs.getString("studentid");
            System.out.println(user);
            System.out.println(pass);
            System.out.println(sid);
            request.setAttribute("user",user);
            request.setAttribute("pass",pass);
            request.setAttribute("sid",sid);
        }
        rs.close();
        con.close();
        HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(5*60);
        session.setAttribute("sid" , sid);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

 
        if((username.equals(user)) & (password.equals(pass))) {
        	response.sendRedirect("welcomePage.jsp");
        }        
        else if((username.equals("doctor")) & (password.equals("password"))) {
        	response.sendRedirect("welcomePageDoctor.jsp");
        }else {
        	response.sendRedirect("accessDenied.html");
        }
    }			
			
}

	


