package com.withdrawal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.ConnectionDao;
import com.randomm.Randomm;

public class WithdrawalDao {
	public double withdrawalDao(String usr, double wAmount) {
		ConnectionDao cd = new ConnectionDao();
		Randomm rd = new Randomm();
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select balance from Accounts where userName = '"+usr+"'");
			ResultSet rs = ps.executeQuery();
			rs.next();
			if(rs.getDouble(1)-wAmount>=1000){
				System.out.println("in WIthdrawal");
                String sql1 = "update Accounts set balance = balance - ? where userName = '"+usr+"'";
                PreparedStatement ps1 = con.prepareStatement(sql1);
                ps1.setDouble(1, wAmount);
                ps1.execute();
                String sql2 = "select balance,Account_No from Accounts where userName = '"+usr+"'";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ResultSet rs1 = ps2.executeQuery();
                rs1.next();
                long t_id = rd.getRandom();
                String sql3 = "insert into Transactions values ("+t_id+","+rs1.getLong(2)+",'"+usr+"','Wd',NOW(),"+wAmount+","+rs1.getDouble(1)+")";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                ps3.execute();
                return rs1.getDouble(1);
            }
            else{
                return 0;
            }
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
