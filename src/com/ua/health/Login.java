package com.ua.health;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
       HttpSession session = request.getSession(true);
       session.setMaxInactiveInterval(5*60);
       //session.setAttribute("UserName", username);
       //InetAddress IP=InetAddress.getLocalHost();
       String dec_query="";
       String ip = Inet4Address.getLocalHost().getHostAddress();
       System.out.println("My IP : " + ip);
/*       Socket socket = new Socket();
       socket.connect(new InetSocketAddress("google.com", 80));
       System.out.println("My IP : ");
       System.out.println( socket.getLocalAddress());*/
/*      System.out.println("My IP : " + IP.toString());*/
       request.setAttribute("localip",ip);
       session.setAttribute("localip" , ip);
        String query="";
        String user="";
        String pass ="";
        String sid ="";
        String pid ="";
        String duser="";
        String dpass ="";
        String docid ="";
        String query1="";
        try {
        Connect c = new Connect();
		Connection con;
		con = c.JDBCConnection();
		query = "select * from patients where username ='" + username +"'";
		PreparedStatement stmt = con.prepareStatement(query);
		System.out.println("Query :" + query);
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
            user = rs.getString("username");
            pass = rs.getString("password");
            sid = rs.getString("studentid");
            pid = rs.getString("patientid");
            System.out.println(user);
            System.out.println(pass);
            System.out.println(sid);
            request.setAttribute("user",user);
            request.setAttribute("pass",pass);
            request.setAttribute("sid",sid);
            session.setAttribute("sid" , sid);
            session.setAttribute("pid" , pid);
            dec_query ="select decrypt('" + pass + "', 'keytestvalue') from dual";
       		PreparedStatement stmtt = con.prepareStatement(dec_query); 		
       		ResultSet rss = stmtt.executeQuery(dec_query);
       		while(rss.next()){
                   pass = rss.getString(1);
                  
       		}
            
            
         }rs.close(); 
        
             
			query1 = "select * from doctors where username ='" + username +"'";;
			PreparedStatement stmt1 = con.prepareStatement(query1);
			System.out.println("Querydoc :" + query1);
			ResultSet rs1 = stmt1.executeQuery(query1);
			while(rs1.next()){
	            duser = rs1.getString("username");
	            dpass = rs1.getString("password");
	            docid = rs1.getString("doctorid");
	            System.out.println(duser);
	            System.out.println(dpass);
	            System.out.println(docid);
	            request.setAttribute("user",user);
	            request.setAttribute("pass",pass);
	            request.setAttribute("docid",docid);
	            session.setAttribute("docid" , docid);
	            
	            dec_query ="select decrypt('" + dpass + "', 'keytestvalue') from dual";
	     		PreparedStatement stmtt1 = con.prepareStatement(dec_query); 		
	     		ResultSet rss1 = stmtt1.executeQuery(dec_query);
	     		while(rss1.next()){
	                 dpass = rss1.getString(1);
	     		}
			}rs1.close();
        
		

        con.close();
        
        
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        /*session.setAttribute("user",user);
        session.setAttribute("pass",pass);*/
        if((username.equals(user)) & (password.equals(pass))) {
        	FetchDataPatient fe = new FetchDataPatient();
        	HttpServletRequest reqq = fe.fetchdata(request);
        	request.getRequestDispatcher("welcomePage.jsp").forward(reqq, response);
        }  else if((username.equals("admin")) & (password.equals("pass"))) {
        	/*FetchDataPatient fe = new FetchDataPatient();
        	HttpServletRequest reqq = fe.fetchdata(request);*/
        	request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        } 
        else if((username.equals(duser)) & (password.equals(dpass))) {
        	FetchDetails f = new FetchDetails();
        	HttpServletRequest req = f.fetch(request);
        	request.getRequestDispatcher("NewFile1.jsp").forward(req, response);
        }else {
        	String text ="<p style=\"color:red\">Invalid Credentials</p>";
        	request.setAttribute("text",text);
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
        }
    }			
			
}

	


