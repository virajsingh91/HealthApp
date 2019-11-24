package com.ua.health;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/login")
public class Login extends HttpServlet {
			
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        // read form fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");
         
        System.out.println("username: " + username);
        System.out.println("password: " + password);
 
        if((username.equals("username")) & (password.equals("password"))) {
        	response.sendRedirect("welcomePage.jsp");
        }        
        else if((username.equals("doctor")) & (password.equals("password"))) {
        	response.sendRedirect("welcomePageDoctor.jsp");
        }else {
        	response.sendRedirect("accessDenied.html");
        }
    }			
			
}

	


