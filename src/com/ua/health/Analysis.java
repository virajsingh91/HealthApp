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
		String filename = "C:\\Users\\Romy\\eclipse-workspace\\HealthApp\\sqlQueries\\query" + runAnalysis + ".txt";
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
		
        request.getRequestDispatcher("adminDisplayResult.jsp").forward(request, response); 
	}
}
