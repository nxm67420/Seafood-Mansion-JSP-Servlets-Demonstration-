package com.moore.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "myRestaurant")
public class myRestaurant extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();


        //Header
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Items Ordered</title>");
        out.println("</head>");
        out.println("<body>");

        //Menu
        out.println("<h1 style=\"display: block; margin-left: 450px\"> Seafood Mansion Online Ordering </h1>");
        out.println("<h1 style=\"color: greenyellow; display: block\">Order Complete!!</h1>");
        out.println("<p><em>Menu</em></p>");
        try {
            System.out.println("In initializeJdbc");
            //Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");

            //Establish Connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant", "root", "");
            System.out.println("Database connected");

            //Statements
            String sql = "SELECT * FROM menu_item WHERE id in (?,?,?,?)";

            // Create a Statement
            PreparedStatement statement = conn.prepareStatement(sql);

            //Columns & Rows
            statement.setString(1, "1");
            statement.setString(2,"2");
            statement.setString(3,"3");
            statement.setString(4,"4");

            //Execution
            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {
                out.println("Dish: " + resultSet.getString(2) + "<br>");
                out.println("Description: " + resultSet.getString(3) + "<br>");
                out.println("Price: $" + resultSet.getString(5) + "<br><br>");
            }
        }
        catch (Exception e){
            System.out.print(e);
        }

        // Items Ordered
        out.println("<h1 style=\"color: red;\">Order Details</h1>");
        out.println("Lobster Soup : " + request.getParameter("LobsterSoup") + "x<br>");
        out.println("Grits & Shrimp: " + request.getParameter("Grits") + "x<br>");
        out.println("Smoked Salmon : " + request.getParameter("Salmon") + "x<br>");
        out.println("Oyster Platter: " + request.getParameter("Oyster") + "x<br>");

        //Subtotal Algorithm
        double lobsterNum = Double.parseDouble(request.getParameter("LobsterSoup"));
        double lobsterNum2 = (lobsterNum * 15.00);

        double gritsNum = Double.parseDouble(request.getParameter("Grits"));
        double gritsNum2 = (gritsNum * 13.00);

        double salmonNum = Double.parseDouble(request.getParameter("Salmon"));
        double salmonNum2 = (salmonNum * 10.00);

        double oysterNum = Double.parseDouble(request.getParameter("Oyster"));
        double oysterNum2 = (oysterNum * 25.00);

        double subTotal = lobsterNum2 + gritsNum2 + salmonNum2 + oysterNum2;
        //Subtotal
        out.println("Subtotal : $" + subTotal);

        //Footer
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
