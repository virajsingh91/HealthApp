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

public class CreateNewCase extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		String caseid=(String)session.getAttribute("caseid");
//		System.out.println("caseid :" + caseid);
		String docid=(String)session.getAttribute("docid");
		System.out.println("docid :" + docid);
		String pid =(String)session.getAttribute("pid");
		System.out.println("pid :" + pid);
		String symptomid="";
		symptomid = request.getParameter("symptoms");
		System.out.println("symptomid :" + symptomid);
		String icdcode = request.getParameter("icdcodes");
		System.out.println("icdcode :" + icdcode);
		String notes = request.getParameter("notes");
		System.out.println("notes :" + notes);
		String meds[][] = new String[10][10];
		String medcode = request.getParameter("medcodes");
		System.out.println("medcode :" + medcode);
		String composition = request.getParameter("composition");
		System.out.println("composition :" + composition);
		String labtests;
		labtests = request.getParameter("labtests");
		String pharmacyid = request.getParameter("pharmacyid");
		System.out.println("pharmacyid :" + pharmacyid);
		String comments = request.getParameter("comments");
		System.out.println("comments :" + comments);
		String frequency = request.getParameter("frequency");
		System.out.println("frequency :" + frequency);
		String severity = request.getParameter("severity");
		System.out.println("severity :" + severity);
		String dcomplete = request.getParameter("dcomplete");
		System.out.println("dcomplete :" + dcomplete);
		SimpleDateFormat dateTime = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss");
		Date dateobj = new Date();
		String current = dateTime.format(dateobj);
		SimpleDateFormat dateTime1 = new SimpleDateFormat("dd-MMM-yyyy");
		Date dateobj1 = new Date();
		String current1 = dateTime.format(dateobj1);
		System.out.println(dateTime1.format(dateobj1));
		String text="";
		String presid="";
		String caseid="";
		try {
		Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		
		/*//Create a new case
		String query0 = "insert into case_details(caseid) values(?)";    		
		PreparedStatement stmt0 = con.prepareStatement(query0);
		stmt0.setInt(1, 1);
		System.out.println("Query :" + query0);
		stmt0.execute();*/
		
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
		
		//Get the CaseId
		String Case ="select max(caseid) as caseid from case_details";
		PreparedStatement stmtt = con.prepareStatement(Case);
		//stmt.setString(1, docid);
		System.out.println("Query :" + Case);
		ResultSet rss = stmtt.executeQuery(Case);
		while(rss.next()){
            caseid = rss.getString("caseid");
            request.setAttribute("caseid",caseid);
            System.out.println("case id : "+caseid);
            session.setAttribute("caseid",caseid );
		}

		
		//Insert into case_symptoms
		String query1 = "insert into case_symptoms values(?,?)";    		
		PreparedStatement stmt1 = con.prepareStatement(query1);
		
			stmt1.setString(1, caseid);
			stmt1.setString(2, symptomid);
			System.out.println("Query :" + query1);
			stmt1.execute();
		
		
		//Insert into diagnosis_details
		String query2 = "insert into diagnosis_details values(?,?,?,?,?)";    		
		PreparedStatement stmt2 = con.prepareStatement(query2);
		stmt2.setString(1, caseid);
		stmt2.setString(2, icdcode);
		stmt2.setString(3, notes);
		stmt2.setString(4, comments);
		stmt2.setString(5, dcomplete);
		System.out.println("Query :" + query2);
		System.out.println("DIagnosis Status :" + dcomplete);
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
		
		stmt3.execute();
		System.out.println("Query :" + query3);
		
		//Insert into prescription_labtests
		String current_pres = "select max(prescriptionid) from prescriptions";
		PreparedStatement stmt4 = con.prepareStatement(current_pres);
		ResultSet rs1 = stmt4.executeQuery(current_pres);
		while(rs1.next()){
		presid = rs1.getString(1);
		}
		String query4 = "insert into prescriptions_labtests values(?,?)";    		
		PreparedStatement stmt5 = con.prepareStatement(query4);
		
			stmt5.setString(1, labtests);
			stmt5.setString(2, presid);
			System.out.println("Query :" + query4);
			stmt5.execute();
		
	
		//Insert into drug_details
			String query6 = "insert into drug_details values(?,?,?,?)";    		
			PreparedStatement stmt6 = con.prepareStatement(query6);
			
				stmt6.setString(1, presid);
				stmt6.setString(2, medcode);
				stmt6.setString(3, frequency);
				stmt6.setString(4, composition);
				System.out.println("Query :" + query6);
				stmt6.execute();
		text="<p style=\"color:green\">Case Creation Successful</p>";
		con.close();
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            text="<p style=\"color:red\">Case Creation failed</p>";
        }
	
		request.setAttribute("text",text);
		System.out.println("text :" + text);
		request.getRequestDispatcher("SignIn.jsp").forward(request, response);

		
	}
         


}
