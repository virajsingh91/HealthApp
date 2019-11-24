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
		Connect c = null;
		Connection con;
		con = c.JDBCConnection();
		String query ="";
		query = "select * from employees";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
            System.out.println(rs.getString("firstname"));
            System.out.println(rs.getString("lastname"));
            
        }
        rs.close();
        con.close();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

	}
}


