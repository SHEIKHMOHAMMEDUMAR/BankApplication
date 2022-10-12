package com.creditcard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.ConnectionDao;
@WebServlet("/CreditCardServlet1")
public class CreditCardServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html");
	 String usr = (String)request.getSession().getAttribute("user");
	 ConnectionDao conn = new ConnectionDao();
	 try {
		Connection con = conn.connectionDao();
		PreparedStatement ps = con.prepareStatement("select * from creditUsers where userName = '"+usr+"'");
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			RequestDispatcher rd = request.getRequestDispatcher("creditCard1.jsp");
			rd.forward(request, response);
		}
		else {
			System.out.println("NOt a credit card");
			RequestDispatcher rd = request.getRequestDispatcher("creditCard.jsp");
			rd.forward(request, response);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		RequestDispatcher rd = request.getRequestDispatcher("creditCard.jsp");
		rd.forward(request, response);
	}
	}
}
