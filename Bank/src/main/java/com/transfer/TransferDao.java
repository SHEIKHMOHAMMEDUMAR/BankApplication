package com.transfer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.checkbalance.CheckBalanceDao;
import com.connection.ConnectionDao;
import com.randomm.Randomm;

public class TransferDao {
	public double transferDao(String usr, String tusr, double tAmount) {
		ConnectionDao cd = new ConnectionDao();
		Randomm rd = new Randomm();
		CheckBalanceDao cbd = new CheckBalanceDao();
		Connection con;
		try {
			con = cd.connectionDao();
			ResultSet rs = cbd.checkBalanceDao(usr);
			rs.next();
			double bal = rs.getDouble(1);
			if(bal-tAmount>=1000) {
	            String sql1 = "update Accounts set balance = balance - ? where userName = '"+usr+"'";
	            String sql2 = "update Accounts set balance = balance + ? where userName = '"+tusr+"'";
	            PreparedStatement ps1 = con.prepareStatement(sql1);
	            PreparedStatement ps2 = con.prepareStatement(sql2);
	            ps1.setDouble(1, tAmount);
	            ps2.setDouble(1, tAmount);
	            ps1.execute();
	            ps2.execute();
	            String sql3 = "select balance,Account_No from Accounts where userName = '"+usr+"'";
	            String sql4 = "select balance,Account_No from Accounts where userName = '"+tusr+"'";
	            PreparedStatement ps3 = con.prepareStatement(sql3);
	            PreparedStatement ps4 = con.prepareStatement(sql4);
	            ResultSet rs1 = ps3.executeQuery();
	            ResultSet rs2 = ps4.executeQuery();
	            rs1.next();
	            rs2.next();
	            long t_id1 = rd.getRandom();
	            long t_id2 = rd.getRandom();
	            String sql5 = "insert into Transactions values ("+t_id1+","+rs1.getLong(2)+",'"+usr+"','Tr',NOW(),"+tAmount+","+rs1.getDouble(1)+"),"
	            		+ "("+t_id2+","+rs2.getLong(2)+",'"+tusr+"','Cr',NOW(),"+tAmount+","+rs2.getDouble(1)+")";
	            PreparedStatement ps5 = con.prepareStatement(sql5);
	            ps5.execute();
	            return rs1.getDouble(1);
			}
			else {
				return 0;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
