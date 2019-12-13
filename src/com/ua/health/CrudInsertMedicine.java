package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrudInsertMedicine extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String orgname = request.getParameter("orgname");
		String noofemp = request.getParameter("noofemp");
		String buildingno = request.getParameter("buildingno");
		String street = request.getParameter("street");
		String zip = request.getParameter("zip");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String text="";
		try {
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
		String query3 = "insert into delivery_organizations values(?,?,?,?,?,?,?,?)";    		
		PreparedStatement stmt3 = con.prepareStatement(query3);
		stmt3.setInt(1, 1);
		stmt3.setString(2, orgname);
		stmt3.setString(3, noofemp);
		stmt3.setString(4, buildingno);
		stmt3.setString(5, street);
		stmt3.setString(6, zip);		
		stmt3.setString(7, phone);	
		stmt3.setString(8, email);
		stmt3.execute();
		text="<p style=\"color:green\">Record Inserted Successfully </p>";
		
	}catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
       text="<p style=\"color:red\">Record Insertion Failed</p>";
}	
	request.setAttribute("text", text);
	request.getRequestDispatcher("FormMedicine.jsp").forward(request, response);
	
	}

}
