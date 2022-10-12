package com.closeaccount;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.connection.ConnectionDao;

public class CloseAccountDao {
	public boolean closeAccountDao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps1 = con.prepareStatement("delete from Accounts where userName = '"+usr+"'");
			PreparedStatement ps2 = con.prepareStatement("delete from creditUsers where userName = '"+usr+"'");
			PreparedStatement ps3 = con.prepareStatement("delete from Transactions where userName = '"+usr+"'");
			ps1.execute();
			ps2.execute();
			ps3.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
