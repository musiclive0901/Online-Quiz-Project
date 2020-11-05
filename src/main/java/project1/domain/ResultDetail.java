package project1.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "quizDetail" )
public class ResultDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idquizDetail", nullable = false)
	private int resultDetailID;
	
	@Column(name="timeTaken")
	private String quizTaken;
	
	@Column(name="questionContext")
	private String questionContext;
	
	@Column(name="optionA")
	private String a_option;
	
	@Column(name="optionB")
	private String b_option;
	
	@Column(name="optionC")
	private String c_option;
	

	@Column(name="optionD")
	private String d_option;
	
	@Column(name="userAnswer")
	private String userChoice;
	
	@Column(name="correctAnswer")
	private String correctChoice;
	public int getResultDetailID() {
		return resultDetailID;
	}
	
	public ResultDetail() {
	}
	
	public ResultDetail(int resultDetailID, String quizTaken, String questionContext, String a_option, String b_option, String c_option,
			String d_option, String userChoice, String correctChoice) {
		super();
		this.resultDetailID = resultDetailID;
		this.quizTaken = quizTaken;
		this.questionContext = questionContext;
		this.a_option = a_option;
		this.b_option = b_option;
		this.c_option = c_option;
		this.d_option = d_option;
		this.userChoice = userChoice;
		this.correctChoice = correctChoice;
	}
	public String getQuizTaken() {
		return quizTaken;
	}
	public void setQuizTaken(String quizTaken) {
		this.quizTaken = quizTaken;
	}
	
	public void setResultDetailID(int resultDetailID) {
		this.resultDetailID = resultDetailID;
	}

	public String getQuestionContext() {
		return questionContext;
	}
	public void setQuestionContext(String questionContext) {
		this.questionContext = questionContext;
	}
	public String getA_option() {
		return a_option;
	}
	public void setA_option(String a_option) {
		this.a_option = a_option;
	}
	public String getB_option() {
		return b_option;
	}
	public void setB_option(String b_option) {
		this.b_option = b_option;
	}
	public String getC_option() {
		return c_option;
	}
	public void setC_option(String c_option) {
		this.c_option = c_option;
	}
	public String getD_option() {
		return d_option;
	}
	public void setD_option(String d_option) {
		this.d_option = d_option;
	}
	public String getUserChoice() {
		return userChoice;
	}
	public void setUserChoice(String userChoice) {
		this.userChoice = userChoice;
	}
	public String getCorrectChoice() {
		return correctChoice;
	}
	public void setCorrectChoice(String correctChoice) {
		this.correctChoice = correctChoice;
	}
	
}

