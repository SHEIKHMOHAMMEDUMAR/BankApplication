package com.deposit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;
import com.randomm.Randomm;

public class DepositDao {
	public double depositDao(String usr, double dAmount) {
		ConnectionDao cd = new ConnectionDao();
		Randomm rd = new Randomm();
		Connection con;
		try {
			con = cd.connectionDao();
            String sql1 = "update Accounts set balance = balance + ? where userName = '"+usr+"'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setDouble(1, dAmount);
            ps1.execute();
            String sql2 = "select balance,Account_No from Accounts where userName = '"+usr+"'";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet rs1 = ps2.executeQuery();
            rs1.next();
            long t_id = rd.getRandom();
            String sql3 = "insert into Transactions values ("+t_id+","+rs1.getLong(2)+",'"+usr+"','De',NOW(),"+dAmount+","+rs1.getDouble(1)+")";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.execute();
            return rs1.getDouble(1);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
