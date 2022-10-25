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
            String staffID = request.getParameter("staffID");
            String cowTag = request.getParameter("cowTag");
            String checkupDate = request.getParameter("checkupDate");
            String checkupTime = request.getParameter("checkupTime");
            String diseaseID = request.getParameter("diseaseID");
            String notes = request.getParameter("notes");
            
            String checkupDateTime = checkupDate + " " + checkupTime;
            
            String status = "untreated";

            Connection connection = null;
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                String url = "jdbc:mysql://localhost/cms";
                String user = "root";
                String pwd = "";
                connection = DriverManager.getConnection(url, user, pwd);
                Statement statement = connection.createStatement();

                String queryInsert = "INSERT INTO checkup"
                        + "(checkupDateTime, cowTag ,diseaseID, staffID, notes, status)"
                        + " VALUES "
                        + "('" + checkupDateTime + "','" + cowTag + "', '" + diseaseID + "', '" + staffID + "', '" + notes + "', '" + status + "')";

                int i = statement.executeUpdate(queryInsert);

                if (i == 1) {
                    out.println("<script>alert('New Checkup Has Been Successfully Inserted');document.location.href='manageCheckup.jsp';</script>");
                } else {
                    out.println("<script>alert('New Checkup Failed To Be Inserted');window.history.back();</script>");
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
    <center><a href=addStaff.jsp>Add New Employee</center></a> <br>
<center><a href="updateStaff.jsp">List Of Employee</center></a><br>
</body>
</html>

