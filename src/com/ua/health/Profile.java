package com.ua.health;

import java.sql.*;
import oracle.jdbc.driver.*;
import oracle.sql.*;

public class Profile {

	public static void main(String[] args) {
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


