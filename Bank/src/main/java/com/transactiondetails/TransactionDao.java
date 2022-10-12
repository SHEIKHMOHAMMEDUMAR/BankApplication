package com.transactiondetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;

public class TransactionDao {
	public ResultSet transactionDao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select * from Transactions where userName = '"+usr+"' order by date desc");
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
