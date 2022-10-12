package com.creditcard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import com.connection.ConnectionDao;
import com.randomm.Randomm;

public class CreditCardDao {
	public long getRandomc(int size) {
        Random rnd = new Random();
        long number = 1000000000000L + Math.abs(rnd.nextLong());
        String s = String.format("%13d", number);
        s = s.substring(0,size);
        return Long.parseLong(s);
    }
	public int creditCardDao(String usr) {
		ConnectionDao cd = new ConnectionDao();
		
		Connection con;
		try {
			con = cd.connectionDao();
			PreparedStatement ps = con.prepareStatement("select Avg(balance) as A_balance from Transactions where userName = '"+usr+"'");
			ResultSet rs = ps.executeQuery();
			rs.next();
			double c_score = rs.getDouble(1)*2;
			System.out.println(getRandomc(12));
			PreparedStatement ps1 = con.prepareStatement("insert into creditUsers values ('"+usr+"', "+getRandomc(12)+","+getRandomc(3)+","+c_score+")");
			return  ps1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
