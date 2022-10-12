package com.signup;

import java.sql.Connection;
import java.sql.Statement;

import com.connection.ConnectionDao;

public class SignupDao {
	public boolean signUpDao(User u) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			Statement stmt = con.createStatement();
			stmt.execute("insert into Users(userName, password) values('"+u.getUserName()+"','"+u.getPassword()+"')");
			return true;
		} 
		catch (Exception e) {
			return false;
		}
	}
}
