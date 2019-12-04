package com.ua.health;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoHome extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession session = request.getSession();
		String user=(String)session.getAttribute("user");
		String pass=(String)session.getAttribute("pass");*/
		
		FetchDataPatient fe = new FetchDataPatient();
    	HttpServletRequest reqq = fe.fetchdata(request);
    	request.getRequestDispatcher("welcomePage.jsp").forward(reqq, response);
	}
}
