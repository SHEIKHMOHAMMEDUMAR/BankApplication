package com.closeaccount;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.checkbalance.CheckBalanceDao;
import com.login.LoginDao;
@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String pwd = request.getParameter("pwd");
		LoginDao ld = new LoginDao();
		CloseAccountDao cad = new CloseAccountDao();
		try {
			ResultSet rs = ld.logindao(usr);
			if(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					if(cad.closeAccountDao(usr)) {
						request.getSession().setAttribute("authc", true);
						RequestDispatcher rd = request.getRequestDispatcher("LoggedInServlet");
						rd.forward(request, response);
					}
					else {
						request.getSession().setAttribute("authc", false);
						RequestDispatcher rd = request.getRequestDispatcher("closeAccount.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.getSession().setAttribute("authc", false);
					RequestDispatcher rd = request.getRequestDispatcher("closeAccount.jsp");
					rd.forward(request, response);
				}
			}
			else {
				request.getSession().setAttribute("authc", false);
				RequestDispatcher rd = request.getRequestDispatcher("closeAccount.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
