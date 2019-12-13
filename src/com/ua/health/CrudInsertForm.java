package com.ua.health;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrudInsertForm extends HttpServlet {

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		String Crud = request.getParameter("CrudInsert");
		String text="";
		
		if (Crud.equals("1")) {
			text="<p style=\"color:black\"><b>Insert Form for PHARMACY</b></p>";
			request.setAttribute("text", text);
			request.getRequestDispatcher("FormPharmacy.jsp").forward(request, response);
			
		}else if (Crud.equals("2")) {
			text="<p style=\"color:black\"><b>Insert Form for DELIVERY ORGANIZATIONS</b></p>";
			request.setAttribute("text", text);
			request.getRequestDispatcher("FormMedicine.jsp").forward(request, response);
			
		}else if (Crud.equals("3")) {
			text="<p style=\"color:black\"><b>Insert Form for LABS</b></p>";
			request.setAttribute("text", text);
			request.getRequestDispatcher("FormLabs.jsp").forward(request, response);
			
		}else if (Crud.equals("4")) {
			text="<p style=\"color:black\"><b>Insert Form for AMBULANCE</b></p>";
			request.setAttribute("text", text);
			request.getRequestDispatcher("FormFeedback.jsp").forward(request, response);
			
		}
		
		
		
	}
	
}
