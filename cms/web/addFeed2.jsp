<%-- 
    Document   : addFeed2
    Created on : Apr 6, 2018, 6:56:37 PM
    Author     : ASHADE'S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>    
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.Statement"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <title>Staff Registration</title>
    </head>
    <body>
        <%

            Connection connection = null;
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                String url = "jdbc:mysql://localhost/cms";
                String user = "root";
                String pwd = "";
                connection = DriverManager.getConnection(url, user, pwd);
                Statement statement = connection.createStatement();

                String barnID = request.getParameter("barnID");
                String foodID = request.getParameter("foodID");
                String timeFeed = request.getParameter("timeFeed");
                String dateFeed = request.getParameter("dateFeed");
                String quantity = request.getParameter("quantity");
                int quantityI = Integer.parseInt(quantity);
                boolean checkQuantity = false;
                int newQuantity = 0;

                String querySelect2 = "select * from food WHERE foodID='" + foodID + "'";
                ResultSet rows = statement.executeQuery(querySelect2);
                while (rows.next()) {
                    int quantity2I = Integer.parseInt(rows.getString("quantity"));
                    if (quantityI < quantity2I) {
                        newQuantity = quantity2I - quantityI;
                        checkQuantity = true;
                    }
                }

                if (checkQuantity == true) {

                    String queryl = "UPDATE food SET quantity = '" + newQuantity + "'"
                            + "WHERE foodID='" + foodID + "'";
                    int l = statement.executeUpdate(queryl);

                    String queryInsert2 = "INSERT INTO feedschedule "
                            + "(barnID, foodID, timeFeed, dateFeed, quantity )"
                            + "VALUES "
                            + "('" + barnID + "','" + foodID + "', '" + timeFeed + "', '" + dateFeed + "','" + quantity + "')";

                    int k = statement.executeUpdate(queryInsert2);

                    if (k == 1) {
                        out.println("<script>alert('New Feed Has Been Successfully Added');document.location.href='manageFeed.jsp';</script>");
                    } else {
                        out.println("<script>alert('New Feed Failed To Be Added');window.history.back();</script>");
                    }
                } else {
                    out.println("<script>alert('The quantity for the food is exceeding the food stock.');window.history.back();</script>");

                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                out.println("Error" + e);
                System.out.println("Error" + e);
            } finally {
                if (null != connection) {
                    connection.close();

                }
            }
        %>
        <br></br>

    </body>
</html>
