<%-- 
    Document   : addBarn2
    Created on : Apr 10, 2018, 6:37:49 AM
    Author     : Syafiq
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>    
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.Statement"%>

<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
<title>Add Barn</title>
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
           
           String barnID = request.getParameter("barnID");
           String barnType = request.getParameter("barnType");
           String width = request.getParameter("width");
           String height = request.getParameter("height");
           String length = request.getParameter("length");
           String yearBuilt = request.getParameter("yearBuilt");
           
           String queryInsert = "INSERT INTO barn"
                                  + "(barnID, barnType ,width, height, length, yearBuilt)"
                                  + " VALUES "
                                  + "('"+barnID+"', '"+barnType+"', '"+width+"', '"+height+"', '"+length+"', '"+yearBuilt+"' )";
           
           int i = statement.executeUpdate(queryInsert);
           
           if(i==1)
               out.println("<script>alert('New Barn Successfully Registered');document.location.href='barnList.jsp';</script>");
           else
           out.println("<script>alert('New Barn Failed To Be Registered');document.location.href='addBarn.jsp';</script>");
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
    </body>
    </html>
    
