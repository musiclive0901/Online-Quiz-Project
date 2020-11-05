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
import project1.domain.Question;

@WebServlet("/admin_question")
public class adminUserQuestion extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private List<Question> questionList;
	
	public void init() {
		System.out.println("adminUserServlet object is created");
		questionList = new ArrayList<Question>();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		//Get the list of question
		QuestionDAO testQuestionDAO = new QuestionDAO();
		questionList = testQuestionDAO.listQuestion();
		request.setAttribute("admin_question_list", questionList);
		request.getRequestDispatcher("pages/admin_question.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		QuestionDAO testQuestionDAO = new QuestionDAO();
		HttpSession session = request.getSession(false); 
		int idx = (int) session.getAttribute("questionIdx");
		session.removeAttribute("questionIdx");
		
		int questionIdUpdated = questionList.get(idx).getQuestionID();
		
		 if (request.getParameter("edit_btn_question") != null) {
			//Pass the edit question to the form
			 System.out.println(questionList.get(idx).getQuestionContext());
			 request.setAttribute("question_id", questionIdUpdated);
			 request.setAttribute("question_context_update", questionList.get(idx).getQuestionContext());
			 request.setAttribute("optionA_updated", questionList.get(idx).getOptionA());
			 request.setAttribute("optionB_updated", questionList.get(idx).getOptionB());
			 request.setAttribute("optionC_updated", questionList.get(idx).getOptionC());
			 request.setAttribute("optionD_updated", questionList.get(idx).getOptionD());
			 request.setAttribute("correctAnswer_updated", questionList.get(idx).getCorrectValue());
			 request.getRequestDispatcher("pages/admin_question_edit.jsp").forward(request, response);
			 
	     } else if (request.getParameter("disable_btn_question") != null) {
	    	 System.out.println(questionIdUpdated);
	    	 testQuestionDAO.updateQuestionStatus(questionIdUpdated, "DISABLE");
	    	 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_question");
		     response.sendRedirect(redirect);
	     }else if(request.getParameter("activate_btn_question") != null) {
	    	 System.out.println(questionIdUpdated);
	    	 testQuestionDAO.updateQuestionStatus(questionIdUpdated, "ACTIVE");
	    	 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_question");
		     response.sendRedirect(redirect);
	     }else if(request.getParameter("delete_btn_question") != null) {
	    	 System.out.println(questionIdUpdated);
	    	 testQuestionDAO.deleteQuestion(questionIdUpdated);
	    	 String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_question");
		     response.sendRedirect(redirect);
	     }
	}
	
}