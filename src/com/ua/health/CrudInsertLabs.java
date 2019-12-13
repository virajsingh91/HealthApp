package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrudInsertLabs extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
		String LabName = request.getParameter("LabName");
		String PhoneNo = request.getParameter("PhoneNo");
		String BuildingNo = request.getParameter("BuildingNo");
		String Zip = request.getParameter("Zip");
		String Street = request.getParameter("Street");
		String Email = request.getParameter("Email");
		String text="";
		try {
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
		String query3 = "insert into labs values(?,?,?,?,?,?,?)";    		
		PreparedStatement stmt3 = con.prepareStatement(query3);
		stmt3.setInt(1, 1);
		stmt3.setString(2, LabName);
		stmt3.setString(3, PhoneNo);
		stmt3.setString(4, BuildingNo);
		stmt3.setString(5, Zip);
		stmt3.setString(6, Street);		
		stmt3.setString(7, Email);	
		stmt3.execute();
		text="<p style=\"color:green\">Record Inserted Successfully for Case </p>";
		
	}catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        text="<p style=\"color:red\">Record Insertion Failed</p>";
}	
	request.setAttribute("text", text);
	request.getRequestDispatcher("FormMedicine.jsp").forward(request, response);
	
	}

}
