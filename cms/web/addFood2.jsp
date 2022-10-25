<%-- 
    Document   : addFood2
    Created on : Apr 6, 2018, 6:48:39 PM
    Author     : ASHADE'S
--%>

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

                String foodID = request.getParameter("foodID");
                String foodName = request.getParameter("foodName");
                String foodType = request.getParameter("foodType");
                String quantity = request.getParameter("quantity");

                String queryInsert2 = "INSERT INTO food "
                        + "(foodID, foodName, foodType, quantity)"
                        + "VALUES "
                        + "('" + foodID + "', '" + foodName + "', '" + foodType + "','" +quantity+"')";

                int j = statement.executeUpdate(queryInsert2);

                if (j == 1) {
                    out.println("<script>alert('New Food Has Been Successfully Added');document.location.href='manageFood.jsp';</script>");
                } else {
                    out.println("<script>alert('New Food Failed To Be Added');window.history.back();</script>");
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

