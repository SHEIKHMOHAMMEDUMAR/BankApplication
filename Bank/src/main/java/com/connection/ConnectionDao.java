package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDao {
	public Connection connectionDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb", "root", "password");
		return con;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
