package com.ua.health;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class FetchDetails {
	
	public HttpServletRequest fetch(HttpServletRequest request) {
		String [][] icdcodes = new String[100][100];
		String [][] medcodes = new String[100][100];
		String [][] testcodes = new String[100][100];
		String [][] pharmacy = new String[100][100];
		int i=0;
		try {
			HttpSession session = request.getSession();
			String docid=(String)session.getAttribute("docid");
			System.out.println("DOC ID :" + docid);
			Connect c = new Connect();
			Connection con;
			con = c.JDBCConnection();
			//Create a new case
			String query0 = "insert into case_details(caseid) values(?)";    		
			PreparedStatement stmt0 = con.prepareStatement(query0);
			stmt0.setInt(1, 1);
			System.out.println("Query :" + query0);
			stmt0.execute();
			
			//Get the CaseId
			String currentCase ="select max(caseid) from case_details";
			PreparedStatement stmtt = con.prepareStatement(currentCase);
			//stmt.setString(1, docid);
			System.out.println("Query :" + currentCase);
			ResultSet rss = stmtt.executeQuery(currentCase);
			while(rss.next()){
	            String caseid = rss.getString("caseid");
	            request.setAttribute("caseid",caseid);
	            System.out.println("case id : "+caseid);
	            session.setAttribute("caseid",caseid );
			}
			//Get Patient ID
			String query ="select * from chat_details where docid=" + docid + " and chat_active=1";
			PreparedStatement stmt = con.prepareStatement(query);
			//stmt.setString(1, docid);
			System.out.println("Query :" + query);
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
	            String pid = rs.getString("pid");
	            request.setAttribute("pid",pid);
	            System.out.println("Patient id : "+pid);
	            String iniSymptom = rs.getString("initial_symptoms");
	            request.setAttribute("iniSymptom",iniSymptom);
	            System.out.println("Initial Symptom : "+iniSymptom);
	        }
			
			//Get ICD Codes
			String query1="select * from diagnoses";
			PreparedStatement stmt1 = con.prepareStatement(query1);
			ResultSet rs1 = stmt1.executeQuery(query1);
			while(rs1.next()){
				icdcodes[i][0] = rs1.getString("icdcode");
	            System.out.println("icdcode : " + icdcodes[i][0]);
	            icdcodes[i][1]= rs1.getString("description");
	            System.out.println("description : "+icdcodes[i][1]);
	            i=i+1;
	        }
			request.setAttribute("icdcodes",icdcodes);
			//Get Medicine
			i=0;
			String query2="select * from medicines";
			PreparedStatement stmt2 = con.prepareStatement(query2);
			ResultSet rs2 = stmt2.executeQuery(query2);
			while(rs2.next()){
				medcodes[i][0] = rs2.getString("medicineid");
	            System.out.println("medcode : " + medcodes[i][0]);
	            medcodes[i][1]= rs2.getString("productname");
	            System.out.println("productname : "+medcodes[i][1]);
	            i=i+1;
	        }
			request.setAttribute("medcodes",medcodes);
			//Get LabTests
			i=0;
			String query3="select * from lab_tests";
			PreparedStatement stmt3 = con.prepareStatement(query3);
			ResultSet rs3 = stmt3.executeQuery(query3);
			while(rs3.next()){
				testcodes[i][0] = rs3.getString("testid");
	            System.out.println("testid : " + testcodes[i][0]);
	            testcodes[i][1]= rs3.getString("testname");
	            System.out.println("testname : "+testcodes[i][1]);
	            i=i+1;
	        }
			request.setAttribute("testcodes",testcodes);
			//Get Pharmacy
			i=0;
			String query4="select * from pharmacies";
			PreparedStatement stmt4 = con.prepareStatement(query4);
			ResultSet rs4 = stmt4.executeQuery(query4);
			while(rs4.next()){
				pharmacy[i][0] = rs4.getString("pharmacyid");
	            System.out.println("pharmacyid : " + pharmacy[i][0]);
	            pharmacy[i][1]= rs4.getString("zip");
	            System.out.println("pharmacyid : "+pharmacy[i][1]);
	            i=i+1;
	        }
			request.setAttribute("pharmacy",pharmacy);
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	
		return request;
		
	}

}
