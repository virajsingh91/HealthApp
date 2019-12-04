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
		String [][] symptoms = new String[100][100];
		int i=0;
		String chatid="";
		try {
			String pid="";
			String sid="";
			String fname="";
			String lname="";
			String mi="";
			String name="";
			HttpSession session = request.getSession();
			String docid=(String)session.getAttribute("docid");
			System.out.println("DOC ID :" + docid);
			Connect c = new Connect();
			Connection con;
			con = c.JDBCConnection();
			
			//Get Patient ID
			String query ="select * from chat_details c join symptoms s on c.initial_symptoms =s.symptomid where docid=" + docid + " and chat_active=1";
			PreparedStatement stmt = con.prepareStatement(query);
			//stmt.setString(1, docid);
			System.out.println("Query :" + query);
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
	            pid = rs.getString("pid");
	            request.setAttribute("pid",pid);
	            System.out.println("Patient id : "+pid);
	            session.setAttribute("pid",pid);
	            chatid = rs.getString("chatid");
                request.setAttribute("chatid",chatid);
                System.out.println("chat id : "+chatid);
                session.setAttribute("chatid",chatid );
	            String iniSymptom = rs.getString("name");
	            request.setAttribute("iniSymptom",iniSymptom);
	            System.out.println("Initial Symptom : "+iniSymptom);
	        }
			
			//Get Student id
			String currentCase1 ="select studentid from patients where patientid='" + pid + "'";
			PreparedStatement stmtt1 = con.prepareStatement(currentCase1);
			//stmt.setString(1, docid);
			System.out.println("Query :" + currentCase1);
			ResultSet rss1 = stmtt1.executeQuery(currentCase1);
			while(rss1.next()){
			sid = rss1.getString("studentid");
			}
			
			//Get Patient name
			String query5 ="select * from students where studentid='" + sid + "'";
			PreparedStatement stmtt2 = con.prepareStatement(query5);
			//stmt.setString(1, docid);
			System.out.println("Query :" + query5);
			ResultSet rss2 = stmtt2.executeQuery(query5);
			while(rss2.next()){
			fname = rss2.getString("firstname");
			mi = rss2.getString("middleinitial");
			lname = rss2.getString("lastname");
			
			}
			name = fname + " " + mi + " " + lname;
			request.setAttribute("pname",name);
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
			icdcodes[i][0]= "0";
			icdcodes[i][1]= "None";
			i=i+1;
			request.setAttribute("icdcodelength",i);
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
			medcodes[i][0]= "0";
			medcodes[i][1]= "None";
			i=i+1;
			request.setAttribute("medcodelength",i);
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
			testcodes[i][0]= "0";
			testcodes[i][1]= "None";
			i=i+1;
			request.setAttribute("testcodelength",i);
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
			pharmacy[i][0]= "0";
			pharmacy[i][1]= "None";
			i=i+1;
			request.setAttribute("pharmacylength",i);
			request.setAttribute("pharmacy",pharmacy);
			
			//Get Symptoms
			i=0;
			String query6="select * from symptoms";
			PreparedStatement stmt5 = con.prepareStatement(query6);
			ResultSet rs5 = stmt5.executeQuery(query6);
			while(rs5.next()){
				symptoms[i][0] = rs5.getString("symptomid");
	            System.out.println("medcode : " + symptoms[i][0]);
	            symptoms[i][1]= rs5.getString("name");
	            System.out.println("productname : "+symptoms[i][1]);
	            i=i+1;
	        }
			con.close();
			request.setAttribute("symptomlength",i);
			request.setAttribute("symptoms",symptoms);
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	
		return request;
		
	}

}
