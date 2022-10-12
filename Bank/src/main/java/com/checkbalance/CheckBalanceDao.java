package com.checkbalance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;

public class CheckBalanceDao {
	public ResultSet checkBalanceDao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select balance from Accounts where userName = '"+usr+"'");
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
