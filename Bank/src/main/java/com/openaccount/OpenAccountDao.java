package com.openaccount;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.connection.ConnectionDao;

public class OpenAccountDao {
	public boolean openAccountDao(Account a) {
		ConnectionDao cd = new ConnectionDao();
		Connection con;
		try {
			con = cd.connectionDao();
			System.out.println(a.getAccountNo());
			System.out.println(a.getUserName());
			System.out.println(a.getAccountType());
			System.out.println(a.getGender());
			System.out.println(a.getAadhaarNo());
			System.out.println(a.getPanNo());
			System.out.println(a.getBalance());
			System.out.println(a.getPhoneNo());
			System.out.println(a.getAddress());
			PreparedStatement ps = con.prepareStatement("insert into Accounts values("+a.getAccountNo()+",'"+a.getUserName()+"','"+a.getAccountType()+"','"+a.getGender()+"','"+a.getAadhaarNo()+"','"+a.getPanNo()+"',"+a.getBalance()+","+a.getPhoneNo()+",'"+a.getAddress()+"')");
			ps.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
