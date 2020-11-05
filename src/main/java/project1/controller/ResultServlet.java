package project1.controller;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet("/result")
public class ResultServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void init() {
		System.out.println("ResultServlet Init");
	}
	
}