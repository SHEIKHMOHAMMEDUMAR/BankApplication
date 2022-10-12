package com.navBar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyNavBar extends TagSupport{
	private static final long serialVersionUID = 1L;
	private String menu;
	private String isLoggedIn;
	private boolean account;
	private String usr;
	public void setAccount(boolean account) {
		this.account = account;
	}
	public void setUsr(String usr) {
		this.usr = usr;
	}
	public void setMenu(String menu) {  
	    this.menu = menu;  
	}
	public void setIsLoggedIn(String isLoggedIn) {  
	    this.isLoggedIn = isLoggedIn;  
	}
	public int doStartTag() throws JspException {  
	    JspWriter out=pageContext.getOut();  
	    try{  
	    	out.print( "<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css' integrity='sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm' crossorigin='anonymous'>"
    		+ "<script src='https://code.jquery.com/jquery-3.2.1.slim.min.js' integrity='sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN' crossorigin='anonymous'></script>"
    		+ "<script src='https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js' integrity='sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q' crossorigin='anonymous'></script>"
    		+ "<script src='https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js' integrity='sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl' crossorigin='anonymous'></script>"
    		+ "<title>JDBC Bank</title>"
    		+ "<body>"
    		+ "<nav class='navbar navbar-expand-lg navbar-dark bg-primary'>");
	    	
	    	if(isLoggedIn.equals("home")) {
	        out.print("<a class='navbar-brand' href='home.jsp'>JDBC Bank</a>"
	        		+ "<div class='collapse navbar-collapse justify-content-end' id='navbarNavDropdown'>"
	        		+ "    <ul class='navbar-nav'>"
	        		+ "      <li class='nav-item active'>"
	        		+ "        <a class='nav-link' href='login.jsp'>Login<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item'>"
	        		+ "        <a class='nav-link' href='signup.jsp'>Sign-up</a>"
	        		+ "      </li>"
	        		+ "   	</ul>"
	        		+ "  </div>"
	        		+ "</nav>"
	        		+ "</body>"); 
	        
	    	}
	    	else if(isLoggedIn.equals("login") || isLoggedIn.equals("signup")){
	    		out.println("<a class='navbar-brand' href='home.jsp'>JDBC Bank</a>"
	    				+ "</nav>"
	    				+ "</body>");
	    	}
    		else if (isLoggedIn.equals("logged")) {
    			String cb = "";
    			String wd = "";
    			String de = "";
    			String tr = "";
    			String ui = "";
    			String ca = "";
    			String cc = "";
    			String ucb = "#";
    			String uwd = "#";
    			String ude = "#";
    			String utr = "#";
    			String uui = "#";
    			String uca = "#";
    			String ucc = "#";
    			switch(menu) {
    			case "checkBalance": cb = "active";
    				break;
    			case "withdrawal": wd = "active";
				break;
    			case "deposit": de = "active";
				break;
    			case "transfer": tr = "active";
				break;
    			case "transactionDetails": ui = "active";
				break;
    			case "closeAccount": ca = "active";
				break;
    			case "creditCard": cc = "active";
				break;
				default:
					break;
    			}
    			
    		out.print("<a class='navbar-brand' href='loggedIn.jsp'>JDBC Bank</a>"
    				+ "<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarNavDropdown' aria-controls='navbarNavDropdown' aria-expanded='false' aria-label='Toggle navigation'>"
    				+ "<span class='navbar-toggler-icon'></span>-"
    				+ "</button>"
    				+ " <div class='collapse navbar-collapse justify-content-center' id='navbarNavDropdown'>"
	        		+ "    <ul class='navbar-nav'>");
    		if(account == true) {
    			ucb = "checkBalance.jsp";
    			uwd = "withdrawal.jsp";
    			ude = "deposit.jsp";
    			utr = "transfer.jsp";
    			uui = "transactionDetails.jsp";
    			uca = "closeAccount.jsp";
    			ucc = "CreditCardServlet1";
			}
    		else {
    			cb = "";
    			out.println("<li class='nav-item active'>"
	        		+ "        <a class='nav-link' href='openAccount.jsp'>Open New Account<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>");
    		}
    		out.println("<li class='nav-item "+cb+"'>"
	        		+ "        <a class='nav-link' href="+ucb+">Check Balance<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item "+wd+"'>"
	        		+ "        <a class='nav-link' href="+uwd+">Withdrawal<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item "+de+"'>"
	        		+ "        <a class='nav-link' href="+ude+">Deposit<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item "+tr+"'>"
	        		+ "        <a class='nav-link' href="+utr+">Transfer<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item "+ui+"'>"
	        		+ "        <a class='nav-link' href="+uui+">Transaction Details<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item "+cc+"'>"
	        		+ "        <a class='nav-link' href="+ucc+">Credit Card<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "       <li class='nav-item "+ca+"'>"
	        		+ "        <a class='nav-link' href="+uca+">Close Account<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "    </ul>"
	        		+ "  </div>"
	        		+ "  <div class='collapse navbar-collapse justify-content-end' id='navbarNavDropdown'>"
	        		+ "    <ul class='navbar-nav'>"
	        		+ "      <li class='nav-item active'>"
	        		+ "        <a class='nav-link' href='updateProfile.jsp'>"+usr+"<span class='sr-only'>(current)</span></a>"
	        		+ "      </li>"
	        		+ "      <li class='nav-item'>"
	        		+ "        <a class='nav-link' href='home.jsp'>Log-out</a>"
	        		+ "      </li>"
	        		+ "   	</ul>"
	        		+ "  </div>"
	        		+ "</nav>"
	        		+ "</body>");
	    	}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }    
	    return SKIP_BODY;  
	}  
}
