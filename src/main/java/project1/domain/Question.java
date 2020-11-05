package project1.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "questionTable" )
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idquestionTable", nullable = false)
	private int questionID;
	
	@Column(name="categoryNum")
	private int categoryQuestion;
	
	@Column(name="questionNum")
	private int questionNumber;
	
	@Column(name="questionText")
	private String questionContext;
	
	@Column(name="optionA")
	private String optionA;
	
	@Column(name="optionB")
	private String optionB;
	
	@Column(name="optionC")
	private String optionC;
	
	@Column(name="optionD")
	private String optionD;
	
	@Column(name="correctValue")
	private int correctIdx;
	 
	@Column(name="questionStatus")
	private String questionStatus;
	
	@Column(name="answerText")
	private String userChoice;
	
	@Column(name="correctText")
	private String answerValue;
	
	public Question() {
		
	}
	
	
	public Question(int categoryQuestion, String questionContext, String optionA,
			String optionB, String optionC, String optionD, int correctIdx) {
		super();
		this.categoryQuestion = categoryQuestion;
		this.questionContext = questionContext;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.correctIdx = correctIdx;
		this.questionStatus = "ACTIVE";
	}


	public String getQuestionContext() {
		return questionContext;
	}
	public void setQuestionContext(String questionContext) {
		this.questionContext = questionContext;
	}
	public int getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getUserChoice() {
		return userChoice;
	}
	public void setUserChoice(String userChoice) {
		this.userChoice = userChoice;
	}
	public String getCorrectValue() {
		answerValue = convertCorrect(correctIdx);
		return answerValue;
	}
	public void setCorrectValue(String correctValue) {
		this.answerValue = correctValue;
	}
	
	public String convertCorrect(long value) {
		String correctValue = null;
		switch((int)value) {
		case 1:
			correctValue = "A";
			break;
		case 2:
			correctValue ="B";
			break;
		case 3:
			correctValue="C";
			break;
		case 4:
			correctValue="D";
			break;
		default:
			correctValue ="N/A";
			break;
		}
		return correctValue;
	}
	
	public int getCategoryQuestion() {
		return categoryQuestion;
	}
	public void setCategoryQuestion(int categoryQuestion) {
		this.categoryQuestion = categoryQuestion;
	}


	public int getQuestionID() {
		return questionID;
	}


	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}


	public int getCorrectIdx() {
		return correctIdx;
	}


	public void setCorrectIdx(int correctIdx) {
		this.correctIdx = correctIdx;
	}


	public String getQuestionStatus() {
		return questionStatus;
	}


	public void setQuestionStatus(String questionStatus) {
		this.questionStatus = questionStatus;
	}
	
}
