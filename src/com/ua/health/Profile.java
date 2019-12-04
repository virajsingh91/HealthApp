package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Profile extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		String sid ="";
		HttpSession session = request.getSession();
		sid= (String)session.getAttribute("sid");
		System.out.println("sid : " + sid);
		Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		String query ="";
		String fname="";
		String lname="";
		query = "select * from students where studentid='" + sid + "'";
		PreparedStatement stmt = con.prepareStatement(query);
		//stmt.setString(1, sid);
		ResultSet rs = stmt.executeQuery(query);
		System.out.println("In Profile Servlet");
        while(rs.next()){
            System.out.println(rs.getString("firstname"));
            System.out.println(rs.getString("lastname"));
            fname = rs.getString("firstname");
            lname = rs.getString("lastname");
            String mi = rs.getString("middleinitial");
            String dob = rs.getString("dateofbirth");
            String bloodgroup = rs.getString("bloodgroup");
            String phoneno = (String)rs.getString("phoneno");
            String email = rs.getString("emailaddress");
            String gender = rs.getString("gender");
            String buildingno = rs.getString("buildingno");
            String street = rs.getString("street");
            String zip = rs.getString("zip");
            request.setAttribute("fname",fname);
            request.setAttribute("lname",lname);
            request.setAttribute("mi",mi);
            request.setAttribute("dob",dob);
            request.setAttribute("bloodgroup",bloodgroup);
            request.setAttribute("phoneno",phoneno);
            request.setAttribute("email",email);
            request.setAttribute("gender",gender);
            request.setAttribute("address",buildingno+ ", " + street+ ", " +zip);
            
        }
        rs.close();
        con.close();
        request.getRequestDispatcher("Profile2.jsp").forward(request, response); 

		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

	}
}


