package project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import project1.DBConnection;
import project1.config.HibernateConfigUtil;
import project1.domain.Student;

import java.util.List;
 
import org.hibernate.HibernateException; 
import org.hibernate.Session; 
import org.hibernate.Transaction;

public class StudentDAO {
	public int registerStudentScore(Student student) throws ClassNotFoundException{
		int result = 0;
		String INSERT_SCORE = "INSERT INTO scoreTable" +
	            "  (idscoreTable, username,Name) VALUES " +
	            " (?, ?,Name);";
		Connection connection = DBConnection.getConnection();
		Random rand = new Random(); 
		if(connection == null) {
			System.out.println("registerStudent no connection");
			return 0;
		}
		PreparedStatement batchStatement = null;
		try {
            batchStatement = connection.prepareStatement(INSERT_SCORE);
            int id = rand.nextInt(1000); 
            batchStatement.setInt(1, id);
            batchStatement.setString(2, student.getUsername());
            batchStatement.setString(3, student.getName());
            batchStatement.addBatch();
            result = batchStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (batchStatement != null) {
                try {
                    batchStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
		return result;
	}
	
	public int registerStudent(Student student) throws ClassNotFoundException{
		String INSERT_STUDENT = "INSERT INTO StudentTable" +
	            "  (idStudent, username, password, Name, Email) VALUES " +
	            " (?, ?, ?, ?, ?);";
		int result = 0;
		Random rand = new Random(); 
		Connection connection = DBConnection.getConnection();
		if(connection == null) {
			System.out.println("registerStudent no connection");
			return 0;
		}
		PreparedStatement batchStatement = null;
		try {
            batchStatement = connection.prepareStatement(INSERT_STUDENT);
            batchStatement.setInt(1, rand.nextInt(1000));
            batchStatement.setString(2, student.getUsername());
            batchStatement.setString(3, student.getPassword());
            batchStatement.setString(4, student.getName());
            batchStatement.setString(5, student.getEmail());
            batchStatement.addBatch();
            batchStatement.executeBatch();
            result = 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (batchStatement != null) {
                try {
                    batchStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
		return result;
	}
	
	public boolean loginStudent(String username, String password) {
		Connection connection = DBConnection.getConnection();
		boolean status = false;
		if(connection == null) {
			System.out.println("loginStudent no connection");
			return status;
		}
		String SEARCH_BY_ID = "select * from StudentTable where username = ? and password = ?";
		PreparedStatement preparestatement = null;
		try {
			preparestatement = connection.prepareStatement(SEARCH_BY_ID);
			preparestatement.setString(1, username);
			preparestatement.setString(2, password);
			 ResultSet rs = preparestatement.executeQuery();
	         status = rs.next() && (boolean)(rs.getString("status").equals("ACTIVE"));
		}catch (SQLException e) {
           e.printStackTrace();
        }
		return status;
	}
	
	/* Method to list student */
	public List<Student> listStudent(){
		Session session = HibernateConfigUtil.openSession();
		List<Student> students = null;
	    Transaction tx = null;
	      
	    try {
	         tx = session.beginTransaction();
	        students = session.createQuery("FROM Student").list(); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return students;
	}
	
	/* Method to UPDATE status for a student */
	   public void updateStudetn(int studentID, String status ){
		  Session session = HibernateConfigUtil.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Student student = (Student)session.get(Student.class, studentID); 
	         String currentStatus = student.getStatus();
	         if(!currentStatus.equals("DISABLE")) {
	        	 //CANNOT GO BACK FROM DISABLE
	        	  student.setStatus(status);
	         }
			 session.update(student); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
   
}
