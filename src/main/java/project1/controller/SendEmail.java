package project1.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/contact")
public class SendEmail extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
	private String host;
    private String port;
    private static String user;
    private static String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String resultMessage = "";
 
        try {

            String recipient = request.getParameter("recipient");
            String subject = request.getParameter("subject");
            String content = request.getParameter("content");
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content, null);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("pages/contact.jsp").forward(
                    request, response);
        }
    }
}