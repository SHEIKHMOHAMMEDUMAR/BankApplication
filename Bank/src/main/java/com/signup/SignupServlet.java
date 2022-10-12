package com.signup;

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

import com.connection.ConnectionDao;
import com.exception.InvalidUserNameException;
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	public boolean userNameValidation(String usr) {
		return usr.matches("[a-zA-Z][a-zA-Z0-9]+");
	}
	public boolean passwordValidation(String pwd) {
		return pwd.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}");
	}
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String usr = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		String rpwd = request.getParameter("rpwd");
		User u = new User();
		SignupDao sud = new SignupDao();
		try {
			if(userNameValidation(usr) && passwordValidation(pwd) && pwd.equals(rpwd)) {
				u.setUserName(usr);
				u.setPassword(pwd);
				boolean b =sud.signUpDao(u);
				if(b) {
					request.getSession().setAttribute("auth1", "authi");
					request.getSession().setAttribute("user1", usr);
					RequestDispatcher rd = request.getRequestDispatcher("LoggedInServlet");
					rd.forward(request, response);
				}
				else {
					request.getSession().setAttribute("auth1", "alused");
				}
			}
			else{
				request.getSession().setAttribute("auth1", "unauthi");
			}
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
