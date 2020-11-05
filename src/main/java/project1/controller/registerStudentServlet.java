package project1.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project1.dao.StudentDAO;
import project1.domain.Student;

@WebServlet("/register")
public class registerStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDao;

    public void init() {
    	System.out.println("Register Student object created");
    	studentDao = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Student student = new Student();
        student.setUsername(username);
        student.setPassword(password);
        student.setName(name);
        student.setEmail(email);

        try {
        	studentDao.registerStudent(student);
        	studentDao.registerStudentScore(student);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/error.jsp");
            return;
        }

        //If student register successfully
        response.sendRedirect("pages/registersuccess.jsp");
    }
}