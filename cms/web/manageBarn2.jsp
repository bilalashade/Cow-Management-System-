<%-- 
    Document   : manageBarn2
    Created on : Apr 10, 2018, 6:47:39 AM
    Author     : Syafiq
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Barn</title>
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
                String cowTag = request.getParameter("cowTag");
                
                Date dNow = new Date();
                String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
                SimpleDateFormat df = new SimpleDateFormat(DATE_FORMAT);
                String dateIn = df.format(dNow);

                String queryh = "UPDATE cow SET barnID = '" + barnID + "'"
                        + "WHERE cowTag='" + cowTag + "'";
                int h = statement.executeUpdate(queryh);

                String queryInsert2 = "INSERT INTO checkin "
                        + "(dateIn, cowTag, barnID )"
                        + "VALUES "
                        + "('" + dateIn + "', '" + cowTag + "', '" + barnID + "')";

                int j = statement.executeUpdate(queryInsert2);

                if (h == 1) {
                    out.println("<script>alert('Cow Successfully Added To Barn');document.location.href='barnList.jsp';</script>");
                } else {
                    out.println("<script>alert('Fail To Add Cow Into Barn');document.location.href='barnList.jsp';</script>");
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