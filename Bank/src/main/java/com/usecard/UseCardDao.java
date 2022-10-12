package com.usecard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;
import com.randomm.Randomm;

public class UseCardDao {
	public double useCardDao(String usr, double amount) {
		ConnectionDao cd = new ConnectionDao();
		Randomm rd = new Randomm();
		Connection con;
		try {
			con = cd.connectionDao();
            String sql1 = "update Accounts set balance = balance + ? where userName = '"+usr+"'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setDouble(1, amount);
            ps1.execute();
            String sql2 = "update creditUsers set creditBalance = creditBalance - ? where userName = '"+usr+"'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setDouble(1, amount);
            ps2.execute();
            String sql3 = "select balance,Account_No from Accounts where userName = '"+usr+"'";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ResultSet rs1 = ps3.executeQuery();
            rs1.next();
            long t_id = rd.getRandom();
            String sql4 = "insert into Transactions values ("+t_id+","+rs1.getLong(2)+",'"+usr+"','Cr',NOW(),"+amount+","+rs1.getDouble(1)+")";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.execute();
            return rs1.getDouble(1);
		} 
	catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
