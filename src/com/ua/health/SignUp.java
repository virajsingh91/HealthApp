package com.ua.health;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUp extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sid = request.getParameter("sid");
        System.out.println("username: " + username);
        System.out.println("password: " + password);
        System.out.println("sid: " + sid);
        String query="";
        String text="";
        
        try {
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		CallableStatement storedProc = con.prepareCall("{call signup_check(?,?)}");
            storedProc.setString(1, username);
            storedProc.setString(2, sid);
            storedProc.execute();
//    		query = "insert into patients values(?,?,?,?)";    		
//    		PreparedStatement stmt = con.prepareStatement(query);
//    		stmt.setInt(1, 1);
//    		stmt.setString(2, username);
//    		stmt.setString(3, password);
//    		stmt.setString(4, sid);
//    		System.out.println("Query :" + query);
//    		stmt.execute();
    		con.close();
    		text="Account Created Successfully";
            } catch (SQLException e) {
            	int err_code= e.getErrorCode();
            	if(err_code == 20090) {
            		text="Username already used. Please use a different username";
            	}
            	else if(err_code==20091) {
            		text="You are already registered.Please login with your credentials";
            	}
            	//System.out.println("Error description: " + e.getMessage());
            	System.out.println("Error code: " + err_code);
            	
                // TODO Auto-generated catch block
            	e.printStackTrace();
            }
        request.setAttribute("text",text);
        request.getRequestDispatcher("Signup.jsp").forward(request, response); 

	}

}
