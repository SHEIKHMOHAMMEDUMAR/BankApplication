package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.ConnectionDao;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String usr = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		LoginDao ld = new LoginDao();
		try {
			ResultSet rs = ld.logindao(usr);
			if(rs.next()) {
				if(rs.getString(2).equals(pwd)) {
					request.getSession().setAttribute("auth", true);
					request.getSession().setAttribute("user", usr);
					RequestDispatcher rd = request.getRequestDispatcher("LoggedInServlet");
					rd.forward(request, response);
				}
				else {
					request.getSession().setAttribute("auth", false);
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				}
			}
			else {
				request.getSession().setAttribute("auth", false);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
