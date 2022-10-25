<%-- 
    Document   : updateFeed2
    Created on : Apr 6, 2018, 6:58:01 PM
    Author     : ASHADE'S
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Feed</title>
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

                String queryk = "UPDATE feedschedule SET foodID = '" + foodID + "', quantity = '" + quantity + "'"
                        + "WHERE barnID='" + barnID + "' && dateFeed='" + dateFeed + "'&& timeFeed='" + timeFeed + "'";
                int k = statement.executeUpdate(queryk);

                if (k == 1) {
                    out.println("<script>alert('Feed Information Has Been Successfully Updated');document.location.href='manageFeed.jsp';</script>");
                } else {
                    out.println("<script>alert('Feed Information Failed To Be Updated');window.history.back();</script>");
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
    </body>
</html>
