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

import project1.dao.QuestionDAO;
import project1.dao.ResultDAO;
import project1.domain.ResultDetail;
import project1.domain.ResultList;


@WebServlet("/admin_result_list")
public class adminResultList extends HttpServlet {
	ResultDAO resultDAO;
	QuestionDAO questionDAO;
	
	private List<ResultList> resultList;
	private static final long serialVersionUID = 1L;
	public void init() {
		System.out.println("adminResultList object exists");
		resultDAO = new ResultDAO();
		questionDAO = new QuestionDAO();
		resultList = new ArrayList<ResultList>();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		HttpSession session = request.getSession(false); 
		
		if(session.getAttribute("enable_name") != null) {
			if(session.getAttribute("filterUsername") != null) {
				String username = (String) session.getAttribute("filterUsername");
				resultList = resultDAO.listResultbyName(username);
			}else {
				resultList = new ArrayList<ResultList>();
			}
			
		}else if(session.getAttribute("enableCategory") != null) {
			//filter by cateory
			if(session.getAttribute("filterCategory") != null) {
				String choice = questionDAO.numToTextCategory((int)session.getAttribute("filterCategory"));
				resultList = resultDAO.listResultbyCategory(choice);
			}else {
				resultList = new ArrayList<ResultList>();
			}
	     	
		}else {
			//show all
			resultList = resultDAO.listResultAll();
		}
		request.setAttribute("admin_result_list", resultList);
		request.getRequestDispatcher("pages/admin_result_list.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		HttpSession session = request.getSession(false); 
		 if (request.getParameter("name_filter_button") != null) {
			 
			 String tempUser = (String) request.getParameter("tempUser");
			 session.setAttribute("filterUsername", tempUser);
			 session.setAttribute("enable_name", true);
			 if(session.getAttribute("enableCategory") != null) {
	     		 session.removeAttribute("enableCategory");
	     	 }
			 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_result_list");
		     response.sendRedirect(redirect);
		     
		 }else if(request.getParameter("category_filter_button") != null) {
			 session.setAttribute("enableCategory", true);
			 int categoryChoice = 1;
				//Check whether the question is correct
	     	if(request.getParameter("subjectChoice")!=null)
	     	{
	     		categoryChoice=Integer.parseInt(request.getParameter("subjectChoice"));
	     	}
	     	 session.setAttribute("filterCategory", categoryChoice);
	     	 if(session.getAttribute("filterName") != null) {
	     		 session.removeAttribute("filterName");
	     	 }
			 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_result_list");
		     response.sendRedirect(redirect);
		     
		 }else if(request.getParameter("list_all") != null) {
			 if(session.getAttribute("enableCategory") != null) {
				 session.removeAttribute("enableCategory");
			 }
			 if(session.getAttribute("filterUsername") != null) {
				 session.removeAttribute("filterUsername");
			 }
			 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_result_list");
		     response.sendRedirect(redirect);
		 }
	}
}