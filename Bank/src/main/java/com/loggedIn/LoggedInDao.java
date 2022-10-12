package com.loggedIn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;

public class LoggedInDao {
	public ResultSet loggedInDao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select * from Accounts where userName = '"+usr+"'");
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
