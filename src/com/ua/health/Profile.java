package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Profile extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		String query ="";
		String fname="";
		String lname="";
		query = "select * from employees";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		System.out.println("In Profile Servlet");
        while(rs.next()){
            System.out.println(rs.getString("firstname"));
            System.out.println(rs.getString("lastname"));
            fname = rs.getString("firstname");
            lname = rs.getString("lastname");
            request.setAttribute("fname",fname);
            request.setAttribute("lname",lname);
        }
        rs.close();
        con.close();
        request.getRequestDispatcher("Profile.jsp").forward(request, response); 

		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

	}
}


