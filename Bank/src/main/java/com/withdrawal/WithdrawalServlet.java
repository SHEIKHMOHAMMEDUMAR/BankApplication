package com.withdrawal;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.login.LoginDao;
@WebServlet("/WithdrawalServlet")
public class WithdrawalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String pwd = request.getParameter("pwd");
		Double wAmt = Double.parseDouble(request.getParameter("wAmt"));
		LoginDao ld = new LoginDao();
		WithdrawalDao wdd = new WithdrawalDao();
		try {
			ResultSet rs = ld.logindao(usr);
			if(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					double bal = wdd.withdrawalDao(usr,wAmt);
					if(bal!=0) {
						request.getSession().setAttribute("auth", true);
						request.getSession().setAttribute("bal", bal);
						RequestDispatcher rd = request.getRequestDispatcher("successW.jsp");
						rd.forward(request, response);
					}
					else {
						request.getSession().setAttribute("auth", false);
						RequestDispatcher rd = request.getRequestDispatcher("unsuccessW.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.getSession().setAttribute("auth", false);
					RequestDispatcher rd = request.getRequestDispatcher("withdrawal.jsp");
					rd.forward(request, response);
				}
			}
			else {
				request.getSession().setAttribute("auth", false);
				RequestDispatcher rd = request.getRequestDispatcher("withdrawal.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
