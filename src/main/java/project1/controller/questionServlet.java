package project1.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project1.DBConnection;
import project1.dao.QuestionDAO;
import project1.dao.ResultDAO;
import project1.domain.Question;

@WebServlet("/question")
public class questionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	boolean isCorrect = false;
	PreparedStatement preparedStatement = null;
	private int currentQuestion ;
	private int correctChoice;
	private HashSet<Integer> answeredQuestion;
	QuestionDAO questionDAO;
	Question tempQuestion;
	ResultDAO resultDAO;
	
	public void init() {
		answeredQuestion = new HashSet<Integer>();
		System.out.println("Question object created"); 
		correctChoice = -1;
		questionDAO = new QuestionDAO();
		tempQuestion = new Question();
		resultDAO = new ResultDAO();
		//Random rand = new Random(); 
		currentQuestion = 1;//rand.nextInt(10);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		 session = request.getSession(false);
		 int categoryChoice = (int) session.getAttribute("choice");

		 if(session.getAttribute("numQues") != null) {
			 //Quiz started
			 if (request.getParameter("button1") != null) {
				 currentQuestion = (int) session.getAttribute("numQues") - 1;
				 while(answeredQuestion.contains(currentQuestion)) {
					 currentQuestion--;
				 }
				 if(currentQuestion <= 1) {
					 currentQuestion = 1;
				 }
		     } else if (request.getParameter("button2") != null) {
		        currentQuestion = (int) session.getAttribute("numQues") + 1;
		        while(answeredQuestion.contains(currentQuestion)) {
					 currentQuestion++;
				 }
				 if(currentQuestion >= 10) {
					 currentQuestion = 10;
				 }
		     } else if(request.getParameter("button1") == null && request.getParameter("button2") == null){
		    	 currentQuestion = (int) session.getAttribute("numQues") + 1;
		    	 while(answeredQuestion.contains(currentQuestion)) {
					 currentQuestion++;
				 }
		    	 if(currentQuestion >= 10) {
		 			currentQuestion = 10;
		 		}else if(currentQuestion <= 1){
		 			currentQuestion = 1;
		 		}
		     }
		}
		
		session.setAttribute("numQues", currentQuestion);
		
		 Connection connection = DBConnection.getConnection();
		 
		 String GET_QUESTION = "SELECT * from questionTable where categoryNum = ? and questionNum = ?";
		 try {
			preparedStatement = connection.prepareStatement(GET_QUESTION);
			preparedStatement.setInt(1, categoryChoice);
			preparedStatement.setInt(2, currentQuestion);
			 boolean isResultSet = preparedStatement.execute();
			 while (true) {
	                if (isResultSet) {
	                    ResultSet resultSet = preparedStatement.getResultSet();
	                    while (resultSet.next()) {
	                       request.setAttribute("question", resultSet.getString("questionText"));
	                       request.setAttribute("optionA", resultSet.getString("optionA"));
	                       request.setAttribute("optionB", resultSet.getString("optionB"));
	                       request.setAttribute("optionC", resultSet.getString("optionC"));
	                       request.setAttribute("optionD", resultSet.getString("optionD"));
	                       tempQuestion.setQuestionContext((String)resultSet.getString("questionText"));
	                       tempQuestion.setOptionA((String)resultSet.getString("optionA"));
	                       tempQuestion.setOptionB((String)resultSet.getString("optionB"));
	                       tempQuestion.setOptionC((String)resultSet.getString("optionC"));
	                       tempQuestion.setOptionD((String)resultSet.getString("optionD"));
	           	        
	        	           correctChoice = resultSet.getInt("correctValue");;
	                    }
	                    resultSet.close();
	                } else {
	                    if (preparedStatement.getUpdateCount() == -1) {
	                        break;
	                    }
	                }
	                isResultSet = preparedStatement.getMoreResults();
	            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
		 String destination = "pages/question.jsp";
		 RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
		 requestDispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		 session = request.getSession(false);
		 int categoryChoice = (int) session.getAttribute("choice");
		 String username = (String) session.getAttribute("username");
		 int answerChoice = 1;
		//Check whether the question is correct
     	if(request.getParameter("answer")!=null)
     	{
     		answerChoice=Integer.parseInt(request.getParameter("answer"));
     	}
 		questionDAO.updateScore(answerChoice, correctChoice, session);
        answeredQuestion.add(currentQuestion);
        
        Question question = new Question();
        question.setQuestionNumber(answeredQuestion.size());
        
        question.setQuestionContext(tempQuestion.getQuestionContext());
        question.setOptionA(tempQuestion.getOptionA());
        question.setOptionB(tempQuestion.getOptionB());
        question.setOptionC(tempQuestion.getOptionC());
        question.setOptionD(tempQuestion.getOptionD());
       
        String userAnswer = tempQuestion.convertCorrect(answerChoice);
        question.setUserChoice(userAnswer);
        String correctAnswer = tempQuestion.convertCorrect(correctChoice);
        question.setCorrectValue(correctAnswer);
        questionDAO.addQuestionResult(question);
        String timeTaken = (String)session.getAttribute("start_time");
        resultDAO.insertResultDetail(timeTaken, tempQuestion.getQuestionContext(), tempQuestion.getOptionA(), tempQuestion.getOptionB(),
        		tempQuestion.getOptionC(), tempQuestion.getOptionD(), userAnswer, correctAnswer);
        
        //Go to next question
        if(answeredQuestion.size() >= 10) {
        	//Go to result page
        	String quizResult =  questionDAO.getResult(categoryChoice, username);
        	String quizCategory = questionDAO.numToTextCategory(categoryChoice);
        	String timeTaken1 = (String)session.getAttribute("start_time");
        	
        	request.setAttribute("testResult", quizResult);
        	request.setAttribute("resultLists", questionDAO);
        	Date date_chemistry = new Date();
        	String end_time = date_chemistry.toString();
        	session.setAttribute("end_time", end_time);
        	try {
				resultDAO.insertResultList(username, quizResult, quizCategory, timeTaken1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
        	answeredQuestion.clear();
        	request.getRequestDispatcher("pages/result.jsp").forward(request, response);
        	//Reset the score	       	
        }else {
        	//Pop up the warning message to submit questions
        	String redirect = response.encodeRedirectURL(request.getContextPath() + "/question");
 	        response.sendRedirect(redirect);
        }   
	       
	}
}