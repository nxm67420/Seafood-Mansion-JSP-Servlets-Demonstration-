<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: nicholasmoore
  Date: 5/1/20
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Items Ordered</title>
</head>
<body>
        <%
                System.out.println("In initializeJdbc");
                //Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded");

                //Establish Connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/restaurant" , "root", "");
                System.out.println("Database connected");


                //Statements
                String sql = "Select * from menu_item where id in (?,?,?,?)";
                PreparedStatement stmt = conn.prepareStatement(sql);

                stmt.setString(1,"1");
                stmt.setString(2,"2");
                stmt.setString(3, "3");
                stmt.setString(4, "4");

                ResultSet resultSet = stmt.executeQuery();

                resultSet.next();

                /*String sql2 = "SELECT * FROM menu_item WHERE id = 2";
                String sql3 = "SELECT * FROM menu_item WHERE id = 3";
                String sql4 = "SELECT * FROM menu_item WHERE id = 4";*/

                // Create a Statement
                //Statement statement = conn.createStatement();
                /*Statement statement2 = conn.createStatement();
                Statement statement3 = conn.createStatement();
                Statement statement4 = conn.createStatement();*/

                //ResultSet resultSet = statement.executeQuery(sql);
                /*ResultSet resultSet2 = statement2.executeQuery(sql2);
                ResultSet resultSet3 = statement3.executeQuery(sql3);
                ResultSet resultSet4 = statement4.executeQuery(sql4);*/

                //resultSet.next();
                /*resultSet2.next();
                resultSet3.next();
                resultSet4.next();*/

        %>
        <h1 style="display: block; margin-left: 450px">Seafood Mansion Online Ordering</h1>
        <h1 style="color: greenyellow; display: block">Order Complete!!</h1>
        Dish : <%= resultSet.getString(2) %> <br>
        Description : <%= resultSet.getString(3) %> <br>
        Price : $<%= resultSet.getString(5) %> <br>
        <br>
        Dish : <%= resultSet.getString(2) %> <br>
        Description : <%= resultSet.getString(3) %> <br>
        Price : $<%= resultSet.getString(5) %> <br>
        <br>
        Dish : <%= resultSet.getString(2) %> <br>
        Description : <%= resultSet.getString(3) %> <br>
        Price : $<%= resultSet.getString(5) %> <br>
        <br>
        Dish : <%= resultSet.getString(2) %> <br>
        Description : <%= resultSet.getString(3) %> <br>
        Price : $<%= resultSet.getString(5) %> <br>
        <br>

      <h1 style="color: red;">You Ordered</h1>
        <%=request.getParameter("LobsterSoup")%>x <%= resultSet.getString(2) %><br>
        <%= request.getParameter("Grits")%>x <%= resultSet.getString(2) %> <br>
        <%= request.getParameter("Salmon")%>x <%= resultSet.getString(2) %> <br>
        <%= request.getParameter("Oyster")%>x <%= resultSet.getString(2) %>
        <p style="text-decoration: underline">_</p>
        <%! double count = 15.00; %>
        <%! double count2 = 13.00; %>
        <%! double count3 = 10.00; %>
        <%! double count4 = 25.00; %>

        Subtotal : $<%= Integer.parseInt(request.getParameter("LobsterSoup")) * count %> +
        <%= Integer.parseInt(request.getParameter("Grits")) * count2 %> +
        <%= Integer.parseInt(request.getParameter("Salmon")) * count3 %> +
        <%= Integer.parseInt(request.getParameter("Oyster")) * count4 %>
</body>
</html>
