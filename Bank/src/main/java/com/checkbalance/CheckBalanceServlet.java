package com.checkbalance;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.login.LoginDao;
@WebServlet("/CheckBalanceServlet")
public class CheckBalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String pwd = request.getParameter("pwd");
		LoginDao ld = new LoginDao();
		CheckBalanceDao cbd = new CheckBalanceDao();
		try {
			ResultSet rs = ld.logindao(usr);
			if(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					request.getSession().setAttribute("auth", true);
					ResultSet rs1 = cbd.checkBalanceDao(usr);
					if(rs1.next()) {
						request.getSession().setAttribute("bal", rs1.getDouble(1));
						RequestDispatcher rd = request.getRequestDispatcher("balanceSuccess.jsp");
						rd.forward(request, response);
					}
					else {
						RequestDispatcher rd = request.getRequestDispatcher("balanceUnSuccess.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.getSession().setAttribute("auth", false);
					RequestDispatcher rd = request.getRequestDispatcher("checkBalance.jsp");
					rd.forward(request, response);
				}
			}
			else {
				request.getSession().setAttribute("auth", false);
				RequestDispatcher rd = request.getRequestDispatcher("checkBalance.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
