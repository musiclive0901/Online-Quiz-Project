package project1.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "quizResultTable" )
public class ResultList {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idquizResultTable", nullable = false)
	private int resultID;
	
	@Column(name="username")
	private String studentUsername;
	
	@Column(name="quizResult")
	private String quizResult;
	
	@Column(name="categoryQuiz")
	private String quizCategory;
	
	@Column(name="dateTaken")
	private String dateTaken;

	public ResultList() {
	}
	
	public ResultList(int resultID, String studentUsername, String quizResult, String quizCategory, String dateTaken) {
		super();
		this.resultID = resultID;
		this.studentUsername = studentUsername;
		this.quizResult = quizResult;
		this.quizCategory = quizCategory;
		this.dateTaken = dateTaken;
	}
	
	public int getResultID() {
		return resultID;
	}
	public void setResultID(int resultID) {
		this.resultID = resultID;
	}
	
	public String getQuizResult() {
		return quizResult;
	}
	public void setQuizResult(String quizResult) {
		this.quizResult = quizResult;
	}
	public String getQuizCategory() {
		return quizCategory;
	}
	public void setQuizCategory(String quizCategory) {
		this.quizCategory = quizCategory;
	}
	public String getDateTaken() {
		return dateTaken;
	}
	public void setDateTaken(String dateTaken) {
		this.dateTaken = dateTaken;
	}
	public String getStudentUsername() {
		return studentUsername;
	}
	public void setStudentUsername(String studentUsername) {
		this.studentUsername = studentUsername;
	}
	
}
