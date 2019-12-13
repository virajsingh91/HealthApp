package com.ua.health;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CaseHistory extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String pid=(String)session.getAttribute("pid");
			int i=0;
			String [][] casehistory = new String [100][100];
            Connect c = new Connect();
    		Connection con;
    		con = c.JDBCConnection();
    		//Get Case History for the patient
    		String query1="select cd.caseid, cd.status, to_char(cd.datetime, 'DD-MM-YY') as datetime, severity, (e.firstname || ' ' ||e.lastname) as doctorname, coalesce(p.prescriptionid,0) as prescriptionid, coalesce(ph.zip,0)  as \"pharmacyzip\", s.name, s.type, coalesce(di.description,'N/A') as description, coalesce(notes,'N/A') as notes, coalesce(comments,'N/A') as comments, coalesce(m.productname,'N/A') as productname,coalesce(lt.testname,'N/A') as testname " + 
    				"from case_details cd " + 
    				"left outer join employees e on e.employeeid = cd.doctorid " + 
    				"left outer join prescriptions p on cd.caseid = p.caseid " + 
    				"left outer join pharmacies ph on p.pharmacyid = ph.pharmacyid " + 
    				"left outer join case_symptoms cs on cd.caseid = cs.caseid " + 
    				"left outer join symptoms s on cs.symptomid = s.symptomid " + 
    				"left outer join diagnosis_details dd on cd.caseid = dd.caseid " + 
    				"left outer join diagnoses di on dd.icdcode = di.icdcode " + 
    				"left outer join trip_details td on cd.caseid = td.caseid " + 
    				"left outer join drug_details drd on p.prescriptionid = drd.prescriptiionid " + 
    				"left outer join medicines m on drd.medicineid = m.medicineid " + 
    				"left outer join prescriptions_labtests pl on p.prescriptionid= pl.prescriptionid " + 
    				"left outer join lab_tests lt on pl.testid = lt.testid " + 
    				"where cd.patientid = '" + pid + "' " + 
    				"order by cd.caseid";
    		System.out.println("querycase : "+ query1);
			PreparedStatement stmt1 = con.prepareStatement(query1);
			ResultSet rs1 = stmt1.executeQuery(query1);
			while(rs1.next()){
				casehistory[i][0] = rs1.getString("caseid");
	            System.out.println("icdcode : " + casehistory[i][0]);
	            casehistory[i][1]= rs1.getString("status");
	            System.out.println("description : "+casehistory[i][1]);
	            casehistory[i][2]= rs1.getString("datetime");
	            System.out.println("description : "+casehistory[i][2]);
	            casehistory[i][3]= rs1.getString("severity");
	            System.out.println("description : "+casehistory[i][3]);
	            casehistory[i][4]= rs1.getString("doctorname");
	            System.out.println("description : "+casehistory[i][4]);
	            casehistory[i][5]= rs1.getString("prescriptionid");
	            System.out.println("description : "+casehistory[i][5]);
	            casehistory[i][6]= rs1.getString("pharmacyzip");
	            System.out.println("description : "+casehistory[i][6]);
	            casehistory[i][7]= rs1.getString("name");
	            System.out.println("description : "+casehistory[i][7]);
	            casehistory[i][8]= rs1.getString("type");
	            System.out.println("description : "+casehistory[i][8]);
	            casehistory[i][9]= rs1.getString("description");
	            System.out.println("description : "+casehistory[i][9]);
	            casehistory[i][10]= rs1.getString("notes");
	            System.out.println("description : "+casehistory[i][10]);
	            casehistory[i][11]= rs1.getString("comments");
	            System.out.println("description : "+casehistory[i][11]);
	            casehistory[i][12]= rs1.getString("productname");
	            System.out.println("description : "+casehistory[i][12]);
	            casehistory[i][13]= rs1.getString("testname");
	            System.out.println("description : "+casehistory[i][13]);
	           
	            i=i+1;
	        }
			System.out.println("length : "+ i);
			request.setAttribute("length",i);
			request.setAttribute("casehistory",casehistory);
		} catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
        request.getRequestDispatcher("CaseHistory.jsp").forward(request, response); 
	}
}
