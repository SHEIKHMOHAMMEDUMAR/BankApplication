package com.openaccount;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.randomm.Randomm;
@WebServlet("/OpenAccountServlet")
public class OpenAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public boolean panNoValidation(String panNo) {
		return panNo.matches("[A-Z]{5}[0-9]{4}[A-Z]");
	}
	public boolean phoneValidation(long phone) {
		String phone1 = String.valueOf(phone);
		return phone1.matches("[6-9][0-9]{9}");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Randomm rd = new Randomm();
		Account a = new Account();
		OpenAccountDao oad = new OpenAccountDao();
		long accountNo = rd.getRandom();
		String usr = (String) request.getSession().getAttribute("user");
		String accountType = (String) request.getParameter("atype");
		String gender = (String) request.getParameter("gender");
		long aadhaarNo = Long.parseLong(request.getParameter("aadhaar"));
		String panNo = (String)(request.getParameter("pan"));
		double balance = 1000.0;
		long phone = Long.parseLong(request.getParameter("phone"));
		String address = (String) request.getParameter("address");
		if(panNoValidation(panNo) && phoneValidation(phone)) {
			a.setAccountNo(accountNo);
			a.setUserName(usr);
			a.setAccountType(accountType);
			a.setGender(gender);
			a.setAadhaarNo(aadhaarNo);
			a.setPanNo(panNo);
			a.setBalance(balance);
			a.setPhoneNo(phone);
			a.setAddress(address);
			if(oad.openAccountDao(a)) {
				request.getSession().setAttribute("oauth", true);
				RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
				rd1.forward(request, response);
			}
			else {
				request.getSession().setAttribute("oauth", false);
				request.getSession().setAttribute("incorrect", "both");
				RequestDispatcher rd1 = request.getRequestDispatcher("openAccount.jsp");
				rd1.forward(request, response);
			}
			
		}
		else {
			request.getSession().setAttribute("oauth", false);
			if(!panNoValidation(panNo)) {
				request.getSession().setAttribute("incorrect", "pan");
			}
			else if(!phoneValidation(phone)) {
				request.getSession().setAttribute("incorrect", "phone");
			}
			else {
				request.getSession().setAttribute("incorrect", "both");
			}
			RequestDispatcher rd1 = request.getRequestDispatcher("openAccount.jsp");
			rd1.forward(request, response);
		}
	}
}
