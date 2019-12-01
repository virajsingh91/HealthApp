package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateCase extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String caseid=(String)session.getAttribute("caseid");
		String docid=(String)session.getAttribute("docid");
		String pid = request.getParameter("pid");
		String symptomid[] = new String[10];
		symptomid = request.getParameterValues("symptomid");
		String icdcode = request.getParameter("icdcodes");
		String notes = request.getParameter("notes");
//		String meds[][] = new String[10][10];
//		meds = request.;
		String composition = request.getParameter("composition");
		String labtests[] = new String[10];
		labtests = request.getParameterValues("labtests");
		String pharmacyid = request.getParameter("pharmacyid");
		String comments = request.getParameter("comments");
		String severity = request.getParameter("severity");
		String dcomplete = request.getParameter("dcomplete");
		SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
		Date dateobj = new Date();
		String current = dateTime.format(dateobj);
		System.out.println(dateTime.format(dateobj));
		try {
		Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		//Insert into case_details
		String query = "insert into case_details values(?,?,?,?,?,?,?)";    		
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.setInt(1, 1);
		stmt.setString(2, "open");
		stmt.setString(3, current);
		stmt.setString(4, severity);
		stmt.setInt(5, 123);
		stmt.setString(6, docid);
		stmt.setString(7, pid);
		System.out.println("Query :" + query);
		stmt.execute();
		
		//Insert into case_symptoms
		String query1 = "insert into case_symptoms values(?,?)";    		
		PreparedStatement stmt1 = con.prepareStatement(query1);
		for (int i=0; i<symptomid.length ; i++) {
			stmt1.setString(1, caseid);
			stmt1.setString(2, symptomid[i]);
			System.out.println("Query :" + query1);
			stmt1.execute();
		}
		
		//Insert into diagnosis_details
		String query2 = "insert into diagnosis_details values(?,?,?,?,?)";    		
		PreparedStatement stmt2 = con.prepareStatement(query2);
		stmt2.setString(1, caseid);
		stmt2.setString(2, icdcode);
		stmt2.setString(3, notes);
		stmt2.setString(4, comments);
		stmt2.setString(5, dcomplete);
		System.out.println("Query :" + query2);
		stmt2.execute();
		
		//Insert into prescriptions
		String query3 = "insert into prescriptions values(?,?,?,?,?,?)";    		
		PreparedStatement stmt3 = con.prepareStatement(query3);
		stmt3.setInt(1, 1);
		stmt3.setString(2, current);
		stmt3.setInt(3, 111);
		stmt3.setString(4, caseid);
		stmt3.setString(5, docid);
		stmt3.setString(6, pharmacyid);
		System.out.println("Query :" + query3);
		stmt3.execute();
		
		//Insert into prescription_labtests
		String current_pres = "select max(prescriptionid) from prescriptions";
		PreparedStatement stmt4 = con.prepareStatement(current_pres);
		ResultSet rs1 = stmt4.executeQuery(current_pres);
		String presid = rs1.getString(1);
		String query4 = "insert into prescription_labtests values(?,?)";    		
		PreparedStatement stmt5 = con.prepareStatement(query4);
		for (int i=0; i<labtests.length ; i++) {
			stmt5.setString(1, labtests[i]);
			stmt5.setString(2,presid);
			System.out.println("Query :" + query4);
			stmt5.execute();
		}
	
		//Insert into drug_details
		con.close();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	
		
		
	}
         

}
