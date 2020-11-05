package project1.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class DownloadAsExcel extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
    {
        res.setContentType("application/vnd.ms-excel");
        PrintWriter out=res.getWriter();
        out.println("<table>");
        out.println("<tr bgcolor=lightblue><td>Hello </td><td>James</td></tr>");
        out.close();
    }
}