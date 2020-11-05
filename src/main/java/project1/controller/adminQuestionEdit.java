package project1.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project1.dao.QuestionDAO;


@WebServlet("/admin_question_edit")
public class adminQuestionEdit extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void init() {
		System.out.println("adminQuestionEdit init");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		HttpSession session = request.getSession(false); 
		request.setAttribute("question_id", (int)session.getAttribute("questionIdx"));
		System.out.println("Enter: " + (int) session.getAttribute("questionIdx"));
		request.setAttribute("question_context_update", (String)session.getAttribute("editQuestion"));
		request.setAttribute("optionA_updated", (String)session.getAttribute("editOptionA"));
		request.setAttribute("optionB_updated", (String)session.getAttribute("editOptionB"));
		request.setAttribute("optionC_updated", (String)session.getAttribute("editOptionC"));
		request.setAttribute("optionD_updated", (String)session.getAttribute("editOptionD"));
		request.setAttribute("correctAnswer_updated", (String)session.getAttribute("editCorrectValue"));
		 String destination = "pages/admin_question_edit.jsp";
		 RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
		 requestDispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {
		QuestionDAO testQuestionDAO = new QuestionDAO();
		int questionID = Integer.parseInt((String)request.getParameter("questionID"));
		System.out.println("Question edit:" + questionID);
		String questionContxt = (String) request.getParameter("questionContxt");
		String optionAUdated = (String) request.getParameter("optionAUpdated");
		String optionBUpdated = (String) request.getParameter("optionBUpdated");
		String optionCUpdated = (String) request.getParameter("optionCUpdated");
		String optionDUpdated = (String) request.getParameter("optionDUpdated");
		String correctValueUpdated = (String) request.getParameter("correctUpdated");
		int setCorrectIdxUpdated = testQuestionDAO.convertOption(correctValueUpdated);
		testQuestionDAO.editQuestion(questionID, questionContxt, optionAUdated, optionBUpdated, optionCUpdated, optionDUpdated, setCorrectIdxUpdated);
		//Go back to Question List
		String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_question");
	    response.sendRedirect(redirect);
	}
	
}