package com.ua.health;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {

		protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
			HttpSession session=request.getSession();  
            session.invalidate();  
              
            String text ="<p style=\"color:green\">You are successfully logged out!</p>"; 
            request.setAttribute("text",text);
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);

	}

}
