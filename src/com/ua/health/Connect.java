package com.ua.health;
import java.sql.*;
import oracle.jdbc.driver.*;
import oracle.sql.*;

public class Connect {

	public Connection JDBCConnection() {
		// TODO Auto-generated method stub
		Connection con=null;
		try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.
                getConnection("jdbc:oracle:thin:@128.196.27.219:1521:MIS00"
                    ,"bitsplease","BLD46d:h4");
            
            System.out.println("Created DB Connection....");
            return con;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return con;
	}

}
