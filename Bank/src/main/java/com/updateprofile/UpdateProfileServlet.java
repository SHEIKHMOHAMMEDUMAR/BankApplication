package com.updateprofile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openaccount.Account;
import com.openaccount.OpenAccountDao;
import com.randomm.Randomm;
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public boolean phoneValidation(long phone) {
		String phone1 = String.valueOf(phone);
		return phone1.matches("[6-9][0-9]{9}");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Account a = new Account();
		UpdateProfileDao upd = new UpdateProfileDao();
		String usr = (String) request.getSession().getAttribute("user");
		long phone = Long.parseLong(request.getParameter("phone"));
		String address = (String) request.getParameter("address");
		if(phoneValidation(phone)) {
			a.setPhoneNo(phone);
			a.setAddress(address);
			if(upd.updateProfileDaoWrite(usr, a)) {
				request.getSession().setAttribute("uauth", true);
				RequestDispatcher rd1 = request.getRequestDispatcher("loggedIn.jsp");
				rd1.forward(request, response);
			}
			else {
				request.getSession().setAttribute("uauth", false);
				request.getSession().setAttribute("incorrect", false);
				RequestDispatcher rd1 = request.getRequestDispatcher("updateProfile.jsp");
				rd1.forward(request, response);
			}
		}
		else {
			request.getSession().setAttribute("oauth", false);
			request.getSession().setAttribute("incorrect", true);
			RequestDispatcher rd1 = request.getRequestDispatcher("updateProfile.jsp");
			rd1.forward(request, response);
		}

	}
}
