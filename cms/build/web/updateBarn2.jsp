<%-- 
    Document   : updateBarn2
    Created on : Apr 10, 2018, 6:49:41 AM
    Author     : Syafiq
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                String barnType = request.getParameter("barnType");
                String width = request.getParameter("width");
                String height = request.getParameter("height");
                String length = request.getParameter("length");
                String yearBuilt = request.getParameter("yearBuilt");

                String queryh = "UPDATE barn SET barnType = '" + barnType + "', width = '" + width + "', height = '" + height + "', length = '" + length + "', yearBuilt = '" + yearBuilt + "'"
                        + "WHERE barnID='" + barnID + "'";
                int h = statement.executeUpdate(queryh);

                if (h == 1) {
                    out.println("<script>alert('Barn Information Has Been Successfully Updated');document.location.href='barnList.jsp';</script>");
                } else {
                    out.println("<script>alert('Barn Information Failed To Be Updated');document.location.href='barnList.jsp';</script>");
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