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

    if ((group.equals(""))) {
        out.println("<script>alert('You do not have permission to use this module. Redirecting to Login.');document.location.href='login.jsp';</script>");
    }

%>

<%-- 
    Document   : updateStaff2
    Created on : Apr 3, 2018, 1:57:26 AM
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
        <title>Update Checkup</title>
    </head>
    <body>
        <%
            String cowTag = request.getParameter("cowTag");
            String checkupDate = request.getParameter("checkupDate");
            String checkupTime = request.getParameter("checkupTime");
            String notes = request.getParameter("notes");
            String diseaseID = request.getParameter("diseaseID");
            
            String checkupDateTime = checkupDate + " " + checkupTime;
            
            Connection connection = null;
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                String url = "jdbc:mysql://localhost/cms";
                String user = "root";
                String pwd = "";
                connection = DriverManager.getConnection(url, user, pwd);
                Statement statement = connection.createStatement();

                String queryh = "UPDATE checkup SET diseaseID = '" + diseaseID + "', notes = '" + notes + "'"
                        + "WHERE cowTag='" + cowTag + "' && checkupDateTime='" + checkupDateTime + "'";
                int h = statement.executeUpdate(queryh);

                if (h == 1) {
                    out.println("<script>alert('Checkup Information Has Been Successfully Updated');document.location.href='manageCheckup.jsp';</script>");
                } else {
                    out.println("<script>alert('Checkup Information Failed To Be Updated');window.history.back();</script>");
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