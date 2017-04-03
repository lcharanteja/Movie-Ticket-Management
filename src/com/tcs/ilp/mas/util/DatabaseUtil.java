package com.tcs.ilp.mas.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseUtil {
	
	    private static final String URL = "jdbc:oracle:thin:@intvmoradb02:1521:ORAJAVADB";
	    private static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	    private static final String USERNAME = "PJ02TEST_TJA31";
	    private static final String PASSWORD = "tcstvm";
	    public static Connection getConnection(){
	    	Connection con = null;
	    	
	    	try {
				 Class.forName(DRIVER_NAME);
				 con  = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
			    	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
           catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	    	return con;
	    	
	    }
	    
	    public static void closeConnection(Connection con){
	    	
	    	if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	    }
	    
	    
          public static void closeStatement(PreparedStatement ps){
	    	
	    	if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	    }

}

