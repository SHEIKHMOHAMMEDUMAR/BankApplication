package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;

public class LoginDao {
	public ResultSet logindao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select * from Users where userName = '"+usr+"'");
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
