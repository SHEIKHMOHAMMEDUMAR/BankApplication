package com.loggedIn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.LoginDao;
@WebServlet("/LoggedInServlet")
public class LoggedInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	String usr = (String) request.getSession().getAttribute("user");
	LoggedInDao lid = new LoggedInDao();
	try {
		ResultSet rs = lid.loggedInDao(usr);
		if(rs.next()) {
			request.getSession().setAttribute("account", true);
		}
		else {
			request.getSession().setAttribute("account", false);
		}
		RequestDispatcher rd = request.getRequestDispatcher("loggedIn.jsp");
		rd.forward(request, response);
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
}

}
