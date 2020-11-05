package project1.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project1.dao.StudentDAO;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDAO studentDao;
	    
	public void init() {
		System.out.println("Login Servlet object init");
		studentDao = new StudentDAO();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		 if (studentDao.loginStudent(username,password)) {
			 HttpSession session = request.getSession(false);
			  if (session != null)
			  {
			    session.invalidate();
			    session = request.getSession();
			  }
			 session.setAttribute("username", username);
			 //Log in successfully
			 session.setMaxInactiveInterval(30*60);
			 response.sendRedirect("pages/loginsuccess.jsp");
		}else {
			String message = "Invalid username/password";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("pages/login.jsp").forward(request, response);
		}
	}
	
}
