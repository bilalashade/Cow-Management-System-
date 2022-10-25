<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
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
    Document   : deleteBarn
    Created on : Apr 10, 2018, 6:46:31 AM
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
        <title>Delete Barn</title>
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
                
                String delete= "delete from barn where barnID='"+barnID+"'";
                
                try {
                    int h = statement.executeUpdate(delete);
                
                if (h==1)
                    out.println("<script>alert('Barn Information Has Been Successfully Deleted');document.location.href='barnList.jsp';</script>");
                else
                    out.println("<script>alert('Barn Information Failed To Be Deleted');document.location.href='barnList.jsp';</script>");
                
                
                throw new MySQLIntegrityConstraintViolationException();

                } catch (SQLException e) {
                    out.println("<script>alert('Error. Barn information is used in cow, checkin and food.');document.location.href='barnList.jsp';</script>");

                } finally {
                }
                
                } catch(Exception e)
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