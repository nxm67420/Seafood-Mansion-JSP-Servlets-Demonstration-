package com.moore.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "myServlet")
public class myServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        //output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Cool Servlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("2+2=" + (2+2));
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
