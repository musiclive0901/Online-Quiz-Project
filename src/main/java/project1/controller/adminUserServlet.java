package project1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project1.dao.StudentDAO;
import project1.domain.Student;


@WebServlet("/admin_user")
public class adminUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private List<Student> studentList;
	 
	public void init() {
		System.out.println("adminUserServlet object is created");
		studentList = new ArrayList<Student>();
	}
		

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		//Get the list of user
		StudentDAO testStudentDAO = new StudentDAO();
		studentList = testStudentDAO.listStudent();
		request.setAttribute("admin_user_list", studentList);
		request.getRequestDispatcher("pages/admin_user.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		StudentDAO testStudentDAO = new StudentDAO();
		HttpSession session = request.getSession(false); 
		int idUpdated = (int) session.getAttribute("userIdx");
		 if (request.getParameter("active_btn") != null) {
			 System.out.println("active_btn Click here");
			 testStudentDAO.updateStudetn(idUpdated, "ACTIVE" );
	     } else if (request.getParameter("suspend_btn") != null) {
	    	 System.out.println("suspend_btn Click here");
	    	 testStudentDAO.updateStudetn(idUpdated, "SUSPEND" );
	     } else if(request.getParameter("disable_btn") != null){
	    	 System.out.println("disable_btn Click here");
	    	 testStudentDAO.updateStudetn(idUpdated, "DISABLE" );
	     }
		 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_user");
	     response.sendRedirect(redirect);
	}
}