package com.usecard;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.LoginDao;
@WebServlet("/UseCardServlet")
public class UseCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		Double amt = Double.parseDouble(request.getParameter("amount"));
		String pwd = request.getParameter("pwd");
		LoginDao ld = new LoginDao();
		UseCardDao ucd = new UseCardDao();
		try {
			ResultSet rs = ld.logindao(usr);
			rs.next();
				if(rs.getString(2).equals(pwd)) {
					double bal = ucd.useCardDao(usr, amt);
					if(bal!=0) {
						request.getSession().setAttribute("uuauth", true);
						request.getSession().setAttribute("bal", bal);
						RequestDispatcher rd = request.getRequestDispatcher("successW.jsp");
						rd.forward(request, response);
					}
					else {
						request.getSession().setAttribute("uuauth", false);
						RequestDispatcher rd = request.getRequestDispatcher("unsuccessW.jsp");
						rd.forward(request, response);
					}
				}
					else {
						request.getSession().setAttribute("uuauth", false);
						RequestDispatcher rd = request.getRequestDispatcher("useCard.jsp");
						rd.forward(request, response);
					}
		}
		catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("uuauth", false);
			RequestDispatcher rd = request.getRequestDispatcher("useCard.jsp");
			rd.forward(request, response);
			
		}
	}
}
