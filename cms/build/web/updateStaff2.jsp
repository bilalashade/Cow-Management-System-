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
                String staffName = request.getParameter("staffName");
                String address = request.getParameter("address");
                String noTel = request.getParameter("noTel");
                String email = request.getParameter("email");
                String jobTitle = request.getParameter("jobTitle");
                
                String queryh = "UPDATE staff SET staffName = '"+staffName+"', address = '"+address+"', noTel = '"+noTel+"', email = '"+email+"', jobTitle = '"+jobTitle+"'"
                        + "WHERE staffID='"+staffID+"'";
                int h = statement.executeUpdate(queryh);
                
                if (h==1)
                
                    out.println("<script>alert('Staff Information Has Been Successfully Updated');document.location.href='manageStaff.jsp';</script>");
                else
                    out.println("<script>alert('Staff Information Failed To Be Updated');window.history.back();</script>");
                
                
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