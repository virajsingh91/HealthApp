package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteRow1 extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String ID = request.getParameter("ID");
		String text="";
		System.out.println("ID : " + ID);
		try {
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
		String query3 = "delete from pharmacies where pharmacyid=" + ID ; 		
		PreparedStatement stmt3 = con.prepareStatement(query3);
		stmt3.executeUpdate();
		text="<p style=\"color:green\">Record Deleted Successfully</p>";
		}
		catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            text="<p style=\"color:red\">Record Deletion Failed</p>";
	}
		request.setAttribute("text",text);
		request.getRequestDispatcher("Crud.jsp").forward(request, response);
}
	}
	