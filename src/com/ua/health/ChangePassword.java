package com.ua.health;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePassword extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query="";
		String text="";
		String username = request.getParameter("username");
		System.out.println("username : " + username);
		String sid = request.getParameter("sid");
		System.out.println("sid : " + sid);
		String oldPassword = request.getParameter("oldPassword");
		System.out.println("oldPassword : " + oldPassword);
		String newPassword = request.getParameter("newPassword");
		System.out.println("newPassword : " + newPassword);
		String enc_pass_new="";
		String enc_pass_old="";
		try {
			Connect c = new Connect();
			Connection con;
			con = c.JDBCConnection();
			CallableStatement storedProc = con.prepareCall("{call password_check(?,?,?)}");
            storedProc.setString(1, sid);
            storedProc.setString(2, username);
            storedProc.setString(3, oldPassword);
            storedProc.execute();
            String enc_query ="select encrypt('" + newPassword + "', 'keytestvalue') from dual";
    		PreparedStatement stmtt = con.prepareStatement(enc_query);
    		ResultSet rss = stmtt.executeQuery(enc_query);
    		while(rss.next()){
                enc_pass_new = rss.getString(1);
               
    		}
    		enc_query ="select encrypt('" + oldPassword + "', 'keytestvalue') from dual";
    		stmtt = con.prepareStatement(enc_query);
    		rss = stmtt.executeQuery(enc_query);
    		while(rss.next()){
                enc_pass_old = rss.getString(1);
               
    		}
			query = "update patients set password=? where studentid=? and password=? and username=?";
			PreparedStatement stmt = con.prepareStatement(query);
    		stmt.setString(1, enc_pass_new);
    		stmt.setString(2, sid);
    		stmt.setString(3, enc_pass_old);
    		stmt.setString(4, username);
			stmt.executeUpdate();
			text ="<p style=\"color:green\">Password Updated Successfully<p>";
		} catch (SQLException e) {
            // TODO Auto-generated catch block
			e.printStackTrace();
            text ="<p style=\"color:red\">Invalid Credentials</p>";
        }
		request.setAttribute("text",text);
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);

}

}
