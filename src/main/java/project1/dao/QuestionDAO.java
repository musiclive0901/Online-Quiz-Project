package project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import project1.DBConnection;
import project1.config.HibernateConfigUtil;
import project1.domain.Question;
import project1.domain.Student;

import org.hibernate.HibernateException; 
import org.hibernate.Session; 
import org.hibernate.Transaction;

public class QuestionDAO {
	int currentQuestion;
	int questionIdex;
	ArrayList<Question> questionList;
	public QuestionDAO() {
		currentQuestion = 1;
		questionIdex = 1;
		questionList = new ArrayList<Question>();
	}
	
	public void addQuestionResult(Question question) {
		questionList.add(question);
	}
	
	public ArrayList<Question> getQuestionList(){
		return questionList;
	}
	
	public ArrayList<Question> generateResult(String username){
		PreparedStatement preparedStatement = null;
		Connection connection = DBConnection.getConnection();
		ArrayList<Question> result = new ArrayList<Question>();;
        try {
        	String RESULT_QUIZ = "select * from userAnswerTable where username = ?";
            preparedStatement = connection.prepareStatement(RESULT_QUIZ);
            preparedStatement.setString(1, username);
            boolean isResultSet = preparedStatement.execute();
            while (true) {
                if (isResultSet) {
                    ResultSet resultSet = preparedStatement.getResultSet();
                    while (resultSet.next()) {
                        Question resultChoice = new Question();
                        result.add(resultChoice);
                        
                    }

                    resultSet.close();
                } else {
                    if (preparedStatement.getUpdateCount() == -1) {
                        System.out.println("Record not found");
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
        return result;
	}
	
	public ArrayList<Question> generateQuiz(int categoryNum) {
		 Connection connection = DBConnection.getConnection();
		 String QUIZ = "select * from questionTable where categoryNum = ?";
		 PreparedStatement preparedStatement = null;
		 ArrayList<Question> questionList = new ArrayList<Question>();
	        try {
	            preparedStatement = connection.prepareStatement(QUIZ);
	            preparedStatement.setInt(1, categoryNum);
	 	         
	            boolean isResultSet = preparedStatement.execute();
	            while (true) {
	                if (isResultSet) {
	                    ResultSet resultSet = preparedStatement.getResultSet();
	                     while(resultSet.next())
	                     {
	                    	 // Copy the quiz question to list
		                     Question question = new Question();
		                     question.setQuestionNumber(questionIdex++);
		                     question.setQuestionContext(resultSet.getString("questionText"));
		                     question.setOptionA(resultSet.getString("optionA"));
		                     question.setOptionB(resultSet.getString("optionB"));
		                     question.setOptionC(resultSet.getString("optionC"));
		                     question.setOptionD(resultSet.getNString("optionD"));
		                     questionList.add(question);
	                     }
	                    resultSet.close();
	                } else {
	                    if (preparedStatement.getUpdateCount() == -1) {
	                        System.out.println("Record not found");
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
	        return questionList;
	}
	
	public int getCurrentQuestion() {
		return currentQuestion;
	}
	
	public void setCurrentQuestion(int currentQuestion) {
		this.currentQuestion = currentQuestion;
	}

	public String getResult(int score) {
		return score>6 ? "PASSED (" + score + "/10)" : "FAILED (" + score + "/10)";
	}
	
	public String getResult(int categoryChoice, String username) {
		//Search the scoreTable
		String SEARCH_SCORE = "SELECT * from scoreTable where username = ?";
		Connection connection = DBConnection.getConnection();
		PreparedStatement preparedStatement = null;
		String returnResult = null;
		try {
			preparedStatement  = connection.prepareStatement(SEARCH_SCORE);
			preparedStatement.setString(1, username);
			 boolean isResultSet = preparedStatement.execute();
			 while (true) {
	                if (isResultSet) {
	                    ResultSet resultSet = preparedStatement.getResultSet();
	                    while (resultSet.next()) {
	                    	switch(categoryChoice) {
	                			case 1:
	                				int scorePhysics = resultSet.getInt("score1");
	                				returnResult = getResult(scorePhysics);
	                				break;
	                			case 2:
	                				int scoreMath = resultSet.getInt("score2");
	                				returnResult = getResult(scoreMath);
	                		
	                				break;
	                			case 3:
	                				int scoreChemistry = resultSet.getInt("score3");
	                				returnResult = getResult(scoreChemistry);
	                				break;
	                		}
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
	   return returnResult;
	}
	
	public void updateScore(int answerChoice,int correctChoice, HttpSession session) {
		 Connection connection = DBConnection.getConnection();
			//Update score on ScoreTable
			 PreparedStatement preparedStatement = null;
		        try {
		        	String UPDATE_SCORE_MATH = "update scoreTable set score2 = ? where username = ?";
		        	String UPDATE_SCORE_PHYSICS = "update scoreTable set score1 = ? where username = ?";
		        	String UPDATE_SCORE_CHEMISTRY = "update scoreTable set score3 = ? where username = ?";
		        	//Check match up with "correctValue"
		        	int choice = (int) session.getAttribute("choice");
		        	switch(choice) {
		        	case 1:
		        		preparedStatement = connection.prepareStatement(UPDATE_SCORE_PHYSICS);
		        		break;
		        	case 2:
		        		preparedStatement = connection.prepareStatement(UPDATE_SCORE_MATH);
		        		break;
		        	case 3:
		        		preparedStatement = connection.prepareStatement(UPDATE_SCORE_CHEMISTRY);
		        		break;
		        	}
		        	int currentScore = 0;
		        	if(session.getAttribute("scores") != null) {
		        		currentScore = (int) session.getAttribute("scores");
		        	}
		    
		    
		        	if(answerChoice == correctChoice) {
		        		currentScore += 1;
		        		session.setAttribute("scores", currentScore);
		        		System.out.println("Correct question");
		        	}
		        	session.setAttribute("scores", currentScore);
		        	preparedStatement.setInt(1, currentScore);
		        	preparedStatement.setString(2, (String)session.getAttribute("username"));
		            //Update new score
		            session.setAttribute("scores", currentScore);
		            preparedStatement.executeUpdate();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
	}
	
	
	/* Method to list Question */
	public List<Question> listQuestion(){
		Session session = HibernateConfigUtil.openSession();
		List<Question> questions = null;
	    Transaction tx = null;
	      
	    try {
	         tx = session.beginTransaction();
	         questions = session.createQuery("FROM Question order by categoryQuestion").list(); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return questions;
	}
	/* Method to CREATE a question in the database */
	   public void insertQuestion(int categoryNum, String questionContext, String optionA,
			   String optionB, String optionC, String optionD, int correctValue){
		  Session session = HibernateConfigUtil.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Question question = new Question(categoryNum, questionContext, optionA, optionB, optionC, optionD,  correctValue);
	         session.save(question); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	   
	   /* Method to DELETE a question from the records */
	   public void deleteQuestion(int questionID){
		  Session session = HibernateConfigUtil.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Question question = (Question)session.get(Question.class, questionID); 
	         session.delete(question); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	   
	   public int convertOption(String option) {
		   int result = 0;
		   switch(option) {
		   case "A":
			   result = 1;
			   break;
		   case "B":
			   result = 2;
			   break;
		   case "C":
			   result = 3;
			   break;
		   case "D":
			   result = 4;
			   break;
		   }
		   return result;
	   }
	   
	   /* Method to EDIT question value */
	   public void editQuestion(int questionID, String questionContext, String optionA, String optionB,
			   String optionC, String optionD, int correctValue){
	      Session session = HibernateConfigUtil.openSession();	
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Question question = (Question)session.get(Question.class, questionID); 
	         System.out.println("Retrieved ID: " + question.getQuestionID());
	         question.setQuestionContext(questionContext);
	         question.setOptionA(optionA);
	         question.setOptionB(optionB);
	         question.setOptionC(optionC);
	         question.setOptionD(optionD);
	         question.setCorrectIdx(correctValue);
			 session.update(question); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }

	   public void updateQuestionStatus(int questionID, String questionStatus){
	      Session session = HibernateConfigUtil.openSession();	
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Question question = (Question)session.get(Question.class, questionID); 
	         question.setQuestionStatus(questionStatus);
	         session.update(question); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	   
	public int convertCategory(String categoryText) {
		int result = 0;
		switch(categoryText) {
		case "MATH":
			result = 2;
			break;
		case "PHYSICS":
			result = 1;
			break;
		case "CHEMISTRY":
			result = 3;
			break;
		}
		return result;
	}


	public String numToTextCategory(int categoryChoice) {
		String result = null;
		switch(categoryChoice) {
		case 1:
			result = "PHYSICS";
			break;
		case 2:
			result = "MATH";
			break;
		case 3:
			result = "CHEMISTRY";
			break;
		default:
			result = "N/A";
			break;
		}
		return result;
	}
}
