<%

    //Get variables from session to be inserted into variables
    String userID = "";

    if (((String) session.getAttribute("userID")) != null) {
        userID = (String) session.getAttribute("userID");
    }

    String name = "";

    if (((String) session.getAttribute("name")) != null) {
        name = (String) session.getAttribute("name");
    }

    String group = "";

    if (((String) session.getAttribute("group")) != null) {
        group = (String) session.getAttribute("group");
    }

    if ((!group.equals("staff"))) {
        out.println("<script>alert('You do not have permission to use this module. Redirecting to Login.');document.location.href='login.jsp';</script>");
    }

%>

<%-- 
    Document   : editStaff2
    Created on : Apr 17, 2018, 12:32:51 AM
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
        <title>Edit Staff Info</title>
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

                String staffName = request.getParameter("staffName");
                String address = request.getParameter("address");
                String noTel = request.getParameter("noTel");
                String email = request.getParameter("email");

                String queryh = "UPDATE staff SET staffName = '" + staffName + "', address = '" + address + "', noTel = '" + noTel + "', email = '" + email + "'"
                        + "WHERE staffID='" + userID + "'";
                int h = statement.executeUpdate(queryh);

                if (h == 1) {
                    out.println("<script>alert('Staff Information Has Been Successfully Updated');document.location.href='profile.jsp';</script>");
                } else {
                    out.println("<script>alert('Staff Information Failed To Be Updated');window.history.back();</script>");
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