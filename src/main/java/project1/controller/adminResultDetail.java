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

import project1.dao.ResultDAO;
import project1.domain.ResultDetail;
import project1.domain.ResultList;

@WebServlet("/admin_resultdetail")
public class adminResultDetail extends HttpServlet {
	private List<ResultDetail> detailList;
	ResultDAO resultDAO;
	private static final long serialVersionUID = 1L;
	public void init() {
		System.out.println("adminResultDetail object created");
		resultDAO = new ResultDAO();
		detailList = new ArrayList<ResultDetail>();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		System.out.println("Generate details");
		HttpSession session = request.getSession(false); 
		String timeSelected = (String) session.getAttribute("chosenTime"); 
		if(timeSelected == null) {
			System.out.println("Cannot find time");
		}else {
			System.out.println(timeSelected);
		}
		detailList = resultDAO.listResultDetail(timeSelected);
		request.setAttribute("admin_result_detail", detailList);
		request.getRequestDispatcher("pages/admin_result_detail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		
	}
}