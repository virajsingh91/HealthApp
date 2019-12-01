package com.ua.health;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class FetchDataPatient {
	
	public HttpServletRequest fetchdata(HttpServletRequest request) {
		try {
			String [] sym = new String[100]; 
			int i=0;
			Connect c = new Connect();
			Connection con;
			con = c.JDBCConnection();
			//Get the Specializations
			String query ="select name from symptoms";
			PreparedStatement stmtt = con.prepareStatement(query);
			System.out.println("Query :" + query);
			ResultSet rs = stmtt.executeQuery(query);
			while(rs.next()){
	            sym[i] = rs.getString("name");
	            i=i+1;
			}
			request.setAttribute("length",i);
			request.setAttribute("sym",sym);
			
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return request;
	}

}
