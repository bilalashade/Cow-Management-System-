<%-- 
    Document   : addStaff2
    Created on : Apr 2, 2018, 3:19:45 PM
    Author     : Syafiq
--%>

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
           
           Connection connection=null;
           try
           {
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
           String password = request.getParameter("password");
           String userType = ("staff");
           
           String queryInsert = "INSERT INTO staff"
                                  + "(staffID, staffName, address ,noTel, email, jobTitle)"
                                  + " VALUES "
                                  + "('"+staffID+"', '"+staffName+"','"+address+"', '"+noTel+"', '"+email+"', '"+jobTitle+"' )";
           
           int i = statement.executeUpdate(queryInsert);
           
           String queryInsert2 = "INSERT INTO login "
                        + "(userName, pswrd, userType )"
                        + "VALUES "
                        + "('" + staffID + "', '"+password+"', '"+userType+"')";
           
           int j = statement.executeUpdate(queryInsert2);
           
           if(i==1)
               out.println("<script>alert('New Staff Has Been Successfully Registered');document.location.href='manageStaff.jsp';</script>");
           else
           out.println("<script>alert('New Staff Failed To Be Registered');window.history.back();</script>");
           if(connection !=null)
               connection.close();
           }
           catch(Exception e){
                out.println("Error" +e);
                System.out.println("Error" +e);
           }
           finally
           {
               if(null!= connection)
               {
                   connection.close();
                   
               }
           }
        %>
    <br></br>
        <center><a href=addStaff.jsp>Add New Employee</center></a> <br>
        <center><a href="updateStaff.jsp">List Of Employee</center></a><br>
    </body>
    </html>
    
    