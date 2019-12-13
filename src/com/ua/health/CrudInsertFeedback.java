package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrudInsertFeedback extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String vehno = request.getParameter("vehno");
		String avail = request.getParameter("avail");
	
		String text="";
		try {
			Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
		String query3 = "insert into ambulances values(?,?,?)";    		
		PreparedStatement stmt3 = con.prepareStatement(query3);
		stmt3.setInt(1, 1);
		stmt3.setString(2, vehno);
		stmt3.setString(3, avail);

		stmt3.execute();
		text="<p style=\"color:green\">Record Inserted Successfully</p>";
		
	}catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        text="<p style=\"color:red\">Record Insertion Failed</p>";
}	
	request.setAttribute("text", text);
	request.getRequestDispatcher("FormFeedback.jsp").forward(request, response);
	
	}

}
