package project1.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project1.dao.QuestionDAO;


@WebServlet("/admin_question_add")
public class adminQuestionAdd extends HttpServlet {
/*
 *  public void insertQuestion(int categoryNum, int questionNumber, String questionContext, String optionA,
			   String optionB, String optionC, String optionD, int correctValue){
 */
	private static final long serialVersionUID = 2260346085846671390L;
	
	public void init() {
		System.out.println("adminQuestionAdd init");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		QuestionDAO testQuestionDAO = new QuestionDAO();
		String categoryText = (String) request.getParameter("categoryText_add");
		int categoryNum = 1;
		if(request.getParameter("categoryText_add")!=null)
     	{
			categoryNum=Integer.parseInt(request.getParameter("categoryText_add"));
     	}
		
		String questionContxt_add = (String) request.getParameter("questionContxt_add");
		String optionA_add = (String) request.getParameter("optionA_add");
		String optionB_add = (String) request.getParameter("optionB_add");
		String optionC_add = (String) request.getParameter("optionC_add");
		String optionD_add = (String) request.getParameter("optionD_add");
		String correctUpdated_add = (String) request.getParameter("correctUpdated_add");
		int setCorrectIdx_add = testQuestionDAO.convertOption(correctUpdated_add);
		testQuestionDAO.insertQuestion(categoryNum, questionContxt_add, optionA_add, optionB_add, optionC_add, optionD_add, setCorrectIdx_add);
		//Go back to Question List
		String redirect = response.encodeRedirectURL(request.getContextPath() + "/admin_question");
	    response.sendRedirect(redirect);
		
	}
}
