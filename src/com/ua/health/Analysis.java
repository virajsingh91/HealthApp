package com.ua.health;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Analysis extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
		String runAnalysis = request.getParameter("runAnalysis");
		System.out.println("runanalysis : "+runAnalysis);
		String filePath="";
		System.out.println("filePath : "+filePath);
		filePath= System.getenv("UAHealthAppQueryPath");
		String text="";
		if (runAnalysis.equals("1")) {
			text="<p style=\"color:blaclk\"><b>Case Count Analysis</b></p><br>";
			
		}else if (runAnalysis.equals("2")) {
			text="<p style=\"color:blaclk\"><b>Symptom and Drug Pattern</b></p><br>";
			
		}else if (runAnalysis.equals("3")) {
			text="<p style=\"color:blaclk\"><b>Crew Classification</b></p><br>";
			
		}else if (runAnalysis.equals("4")) {
			text="<p style=\"color:blaclk\"><b>Employee Ranking</b></p><br>";
			
		}else if (runAnalysis.equals("5")) {
			text="<p style=\"color:blaclk\"><b>Diagnosis Insured</b></p><br>";
			
		}else if (runAnalysis.equals("6")) {
			text="<p style=\"color:blaclk\"><b>Diagnosis Appropriatenessy</b></p><br>";
			
		}else if (runAnalysis.equals("7")) {
			text="<p style=\"color:blaclk\"><b>Student Subsidy Eligibility</b></p><br>";
			
		}else if (runAnalysis.equals("8")) {
			text="<p style=\"color:blaclk\"><b>Patient Historical Statistics</b></p><br>";
			
		}else if (runAnalysis.equals("9")) {
			text="<p style=\"color:blaclk\"><b>Pharmacy Medicine Availability</b></p><br>";
			
		}else if (runAnalysis.equals("10")) {
			text="<p style=\"color:blaclk\"><b>Time vs Symptom Statistics</b></p><br>";
			
		}
		
		String filename = "C:\\Users\\bitsplease\\Downloads\\sqlQueries\\query" + runAnalysis + ".txt";
		String query="";
		String col_name="";
		StringBuilder sb = new StringBuilder();
		String line;
		int j=0;
		/*String[] header = new String[1000];*/
		String thead="<tr>";
		String tbody="";
		
		try{
	        BufferedReader bufferedReader = new BufferedReader(
	                                        new FileReader(filename)
	                                                            );
	        while ((line = bufferedReader.readLine()) != null)
	        {
	            sb.append(line);
	        }
	        query = sb.toString();
	        System.out.println("query : "+query);
		}
		catch (FileNotFoundException e){
	        e.printStackTrace();
	    }
	    catch (IOException e){
	        e.printStackTrace();
	    }
		query= query.replaceAll("\\r\\n", "\\s");
		try {
			HttpSession session = request.getSession();
			String pid=(String)session.getAttribute("pid");
			int i=0;			
			String [][] output = new String [1000][1000];
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		            	
    		//Get Case History for the patient
    		
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs1 = stmt.executeQuery(query);
			ResultSetMetaData md = rs1.getMetaData();
			int col = md.getColumnCount();
			
			for (int m = 1; m <= col; m++){
				  col_name = md.getColumnName(m);
				  thead= thead + "<th>" + col_name + "</th>" ;
				  System.out.println(col_name);
			}
			while(rs1.next()){ 					
				tbody= tbody + "<tr>";
				for (int k=0; k<col ; k++) {
				output[i][k] = rs1.getString(k+1);
				tbody = tbody + "<td>" + output[i][k] + "</td>" ;
	            //System.out.println("output : " + output[i][k]);
				}
				tbody= tbody + "</tr>";
	            i=i+1;
	        }
			thead = thead + "</tr>";
			//tbody = tbody + "</tr>";
			request.setAttribute("thead",thead);
			request.setAttribute("tbody",tbody);
			System.out.println(thead+tbody);
		
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		request.setAttribute("text",text);
        request.getRequestDispatcher("adminDisplayResult.jsp").forward(request, response); 
	}
}
