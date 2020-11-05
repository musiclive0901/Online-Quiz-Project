package project1.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class SignoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void init() {
		System.out.println("SignoutServlet object init");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
    	response.setContentType("text/html");
 
    	//invalidate the session if exists
    	HttpSession session = request.getSession(false);
    	System.out.println("User="+session.getAttribute("username"));
    	if(session != null){
    		session.invalidate();
    	}
    	//Re-direct to login page
    	response.sendRedirect("pages/login.jsp");
    }
	
}