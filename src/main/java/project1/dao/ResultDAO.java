package project1.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;

import project1.config.HibernateConfigUtil;
import project1.domain.Question;
import project1.domain.ResultDetail;
import project1.domain.ResultList;

public class ResultDAO {
	public void insertResultList(String username, String quizResult, String quizCategory, String dateTake) throws ParseException {
		 Session session = HibernateConfigUtil.openSession();
	      Transaction tx = null;
	      try {
	    	  Random rand = new Random(); 
	         tx = session.beginTransaction();
	         ResultList resultList = new ResultList(rand.nextInt(1000),username, quizResult, quizCategory, dateTake);
	         session.save(resultList); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	}
	
	public void insertResultDetail(String quizTaken, String questionContext, String a_option, String b_option, String c_option,
			String d_option, String userChoice, String correctChoice) {
		  Session session = HibernateConfigUtil.openSession();
	      Transaction tx = null;
	      try {
	    	  System.out.println(quizTaken);
	    	  Random rand = new Random(); 
	         tx = session.beginTransaction();
	         ResultDetail resultDetail = new ResultDetail(rand.nextInt(1000),quizTaken, questionContext, a_option, b_option, c_option, d_option, userChoice, correctChoice);
	         session.save(resultDetail); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	}

	public List<ResultList> listResultAll(){
		Session session = HibernateConfigUtil.openSession();
		List<ResultList> results = null;
	    Transaction tx = null;
	    try {
	         tx = session.beginTransaction();
	         results = session.createQuery("FROM ResultList").list(); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return results;
	}
	
	public List<ResultDetail> listResultDetail(String inputTime){
	    Session session = HibernateConfigUtil.openSession();
		Transaction tx = null; 
		List<ResultDetail> detailList = new ArrayList<ResultDetail>();
		try {
	         tx = session.beginTransaction();
	     	String sql = "SELECT * FROM quizDetail WHERE timeTaken = :timeTaken";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(ResultDetail.class);
			query.setParameter("timeTaken", inputTime);
			List results = query.list();
	         for (Iterator iterator = results.iterator(); iterator.hasNext();){
	        	 ResultDetail result = (ResultDetail) iterator.next(); 
	        	detailList.add(result);
	            }
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return detailList;
	}
	
	public List<ResultList> listResultbyName(String username){
		Session session = HibernateConfigUtil.openSession();
		Transaction tx = null; 
		List<ResultList> resultList = new ArrayList<ResultList>();
	
		try {
	         tx = session.beginTransaction();
	     	String sql = "SELECT * FROM quizResultTable WHERE username = :username";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(ResultList.class);
			query.setParameter("username", username);
			List results = query.list();
			
	         for (Iterator iterator = results.iterator(); iterator.hasNext();){
	        	ResultList result = (ResultList) iterator.next(); 
	            resultList.add(result);
	            }
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return resultList;
	}
	
	public List<ResultList> listResultbyCategory(String categoryType){
		Session session = HibernateConfigUtil.openSession();
		Transaction tx = null; 
		List<ResultList> resultList = new ArrayList<ResultList>();
		try {
	         tx = session.beginTransaction();
	     	String sql = "SELECT * FROM quizResultTable WHERE categoryQuiz = :categoryQuiz";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(ResultList.class);
			query.setParameter("categoryQuiz", categoryType);
			List results = query.list();
			
	         for (Iterator iterator = results.iterator(); iterator.hasNext();){
	        	ResultList result = (ResultList) iterator.next(); 
	            resultList.add(result);
	            }
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
		return resultList;
	}
}
