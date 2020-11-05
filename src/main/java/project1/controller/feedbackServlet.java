package project1.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project1.DBConnection;

@WebServlet("/feedback")
public class feedbackServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 
	public void init() {
		System.out.println("Feedback object is created");
	}
	
	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {
		  int rating = Integer.parseInt(request.getParameter("rating"));
		  String message = request.getParameter("message");
		  Random rand = new Random(); 
		  String INSERT_RATING = "INSERT INTO feedbackTable" +
		            "  (idFeedback, ratingScore, Message) VALUES " +
		            " (?, ?, ?);";
			Connection connection = DBConnection.getConnection();
			PreparedStatement batchStatement = null;
			try {
	            batchStatement = connection.prepareStatement(INSERT_RATING);
	            batchStatement.setInt(1, rand.nextInt(1000));
	            batchStatement.setInt(2, rating);
	            batchStatement.setString(3, message);
	            batchStatement.addBatch();
	            batchStatement.executeUpdate();
	           
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("pages/error.jsp");
	            return;
	        } finally {
	            if (batchStatement != null) {
	                try {
	                    batchStatement.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    response.sendRedirect("pages/error.jsp");
	                    return;
	                }
	            }
	        }
			
			//If feedback form sent succesfully
			 response.sendRedirect("pages/feedbacksuccess.jsp");
	  }
}
