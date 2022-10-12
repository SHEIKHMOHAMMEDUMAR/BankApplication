package com.deposit;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.LoginDao;
import com.withdrawal.WithdrawalDao;
@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String pwd = request.getParameter("pwd");
		Double dAmt = Double.parseDouble(request.getParameter("dAmt"));
		LoginDao ld = new LoginDao();
		DepositDao dd = new DepositDao();
		try {
			ResultSet rs = ld.logindao(usr);
			if(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					double bal = dd.depositDao(usr,dAmt);
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
