<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Staff</title>
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
                String gender = request.getParameter("gender");
                String breed = request.getParameter("breed");
                String cowStatus = request.getParameter("CowStatus");
                String earlyAge = request.getParameter("EarlyAge");
                String earlyWeight = request.getParameter("EarlyWeight");

                String queryh = "UPDATE cow SET gender = '" + gender + "', breed = '" + breed + "', cowStatus = '" + cowStatus + "', earlyAge = '" + earlyAge + "', earlyWeight = '" + earlyWeight + "'"
                        + "WHERE cowTag='" + cowTag + "'";

                int h = statement.executeUpdate(queryh);

                if (h == 1) {
                    out.println("<script>alert('Cow Information Has Been Successfully Updated');document.location.href='manageCow.jsp';</script>");
                } else {
                    out.println("<script>alert('Cow Information Failed To Be Updated');window.history.back();</script>");
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