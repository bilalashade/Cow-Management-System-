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
    Document   : deleteFeed
    Created on : Apr 6, 2018, 6:59:10 PM
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
        <title>Update Food</title>
    </head>
    <body>
        <%
            Connection connection = null;
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                String url = "jdbc:mysql://localhost/cms";
                String user = "root";
                String pwd = "";
                connection = DriverManager.getConnection(url,user,pwd);
                Statement statement = connection.createStatement();
                
                String barnID = request.getParameter("barnID");
                String timeFeed = request.getParameter("timeFeed");
                String dateFeed = request.getParameter("dateFeed");
                
                String delete= "delete from feedschedule WHERE barnID='" + barnID + "'&& dateFeed='" + dateFeed + "'&& timeFeed='" + timeFeed + "'";
                
                int i =statement.executeUpdate(delete);
                
                if (i==1)
                
                    out.println("<script>alert('Food Information Has Been Successfully Deleted');document.location.href='manageFeed.jsp';</script>");
                else
                    out.println("<script>alert('Food Information Failed To Be Deleted');window.history.back();</script>");
                
                } 
                catch(Exception e)
                            {
                                out.println("Error" +e);
                                System.out.println("Error" +e);
                            }
                            finally
                            {
                                if(null != connection)
                                {
                                    connection.close();
                                }           
                            }
                

        %>
    </body>
</html>