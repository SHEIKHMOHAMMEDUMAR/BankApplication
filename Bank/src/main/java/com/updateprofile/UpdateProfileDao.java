package com.updateprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;
import com.openaccount.Account;

public class UpdateProfileDao {
	ConnectionDao cd = new ConnectionDao();
	Connection con;
	public ResultSet updateProfileDaoRead(String usr) {
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
	public boolean updateProfileDaoWrite(String usr, Account a) {
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("update Accounts set phone_No = "+a.getPhoneNo()+",address = '"+a.getAddress()+"' where userName = '"+usr+"'");
			ps.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
