package com.creditcard;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.LoginDao;
@WebServlet("/CreditCardServlet")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String pwd = request.getParameter("pwd");
		LoginDao ld = new LoginDao();
		CreditCardDao ccd = new CreditCardDao();
		try {
			ResultSet rs = ld.logindao(usr);
			rs.next();
			if(rs.getString(2).equals(pwd) && ccd.creditCardDao(usr) == 1){
				request.getSession().setAttribute("ccauth", true);					
				RequestDispatcher rd = request.getRequestDispatcher("creditCard1.jsp");
				rd.forward(request, response);
			}
			else {
				request.getSession().setAttribute("ccauth", false);
				RequestDispatcher rd = request.getRequestDispatcher("creditCard.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
