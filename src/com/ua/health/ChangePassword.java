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
		try {
			Connect c = new Connect();
			Connection con;
			con = c.JDBCConnection();
			CallableStatement storedProc = con.prepareCall("{call password_check(?,?,?)}");
            storedProc.setString(1, sid);
            storedProc.setString(2, username);
            storedProc.setString(3, oldPassword);
            storedProc.execute();
			query = "update patients set password=? where studentid=? and password=? and username=?";
			PreparedStatement stmt = con.prepareStatement(query);
    		stmt.setString(1, newPassword);
    		stmt.setString(2, sid);
    		stmt.setString(3, oldPassword);
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
