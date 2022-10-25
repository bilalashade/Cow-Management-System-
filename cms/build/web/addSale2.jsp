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
        <title>Sell Cow</title>
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

                String cowTag = request.getParameter("cowTag");
                String saleName = request.getParameter("saleName");
                String noTel = request.getParameter("noTel");
                String saleDate = request.getParameter("saleDate");
                String price = request.getParameter("price");
                
                String cowStatus = "Sold";

                String queryInsert = "INSERT INTO sale"
                        + "(cowTag, saleName, noTel ,saleDate, price)"
                        + " VALUES "
                        + "('" + cowTag + "', '" + saleName + "','" + noTel + "', '" + saleDate + "', '" + price + "' )";

                int i = statement.executeUpdate(queryInsert);

                String queryUpdate = "UPDATE cow SET cowStatus = '" + cowStatus + "'"
                        + "WHERE cowTag='" + cowTag + "'";

                int j = statement.executeUpdate(queryUpdate);

                if (i == 1) {
                    out.println("<script>alert('Sale Information Has Been Successfully Registered');document.location.href='manageSale.jsp';</script>");
                } else {
                    out.println("<script>alert('Sale Information Failed To Be Registered');window.history.back();</script>");
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
    <center><a href=sellCow.jsp>Sell Cow</center></a> <br>
</body>
</html>


