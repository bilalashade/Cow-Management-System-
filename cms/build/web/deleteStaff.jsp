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
    Document   : deleteStaff
    Created on : Apr 3, 2018, 4:34:26 AM
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
                connection = DriverManager.getConnection(url,user,pwd);
                Statement statement = connection.createStatement();
                
                String staffID = request.getParameter("staffID");
                
                String delete= "delete from login where userName='"+staffID+"'";
                
                int h =statement.executeUpdate(delete);
                
                String delete2= "delete from staff where staffID='"+staffID+"'";
                
                int i =statement.executeUpdate(delete2);
                
                if (i==1)
                
                    out.println("<script>alert('Staff Information Has Been Successfully Deleted');document.location.href='manageStaff.jsp';</script>");
                else
                    out.println("<script>alert('Staff Information Failed To Be Deleted');window.history.back();</script>");
                
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