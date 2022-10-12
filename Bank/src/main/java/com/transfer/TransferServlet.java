package com.transfer;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.login.LoginDao;
@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = (String)request.getSession().getAttribute("user");
		String tusr = request.getParameter("tuser");
		String pwd = request.getParameter("pwd");
		Double tAmt = Double.parseDouble(request.getParameter("tAmt"));
		LoginDao ld = new LoginDao();
		AccountDao ad =new AccountDao();
		TransferDao td = new TransferDao();
		try {
			ResultSet rs = ld.logindao(usr);
			ResultSet rs1 = ad.accountDao(tusr);
			if(rs1.next()) {
				if(rs.next()) {
					if(rs.getString(2).equals(pwd)) {
						double bal = td.transferDao(usr,tusr,tAmt);
						if(bal!=0) {
							request.getSession().setAttribute("tauth", "authi");
							request.getSession().setAttribute("bal", bal);
							RequestDispatcher rd = request.getRequestDispatcher("successW.jsp");
							rd.forward(request, response);
						}
						else {
							request.getSession().setAttribute("tauth", "unauthi");
							RequestDispatcher rd = request.getRequestDispatcher("unsuccessW.jsp");
							rd.forward(request, response);
						}
					}
					else {
						request.getSession().setAttribute("tauth", "unauthi");
						RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.getSession().setAttribute("tauth", "unauthi");
					RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
					rd.forward(request, response);
				}
			}
			else {
				request.getSession().setAttribute("tauth", "bunathi");
				RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
