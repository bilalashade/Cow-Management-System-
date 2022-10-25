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
<title>Add Cow</title>
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
           
           String cowTag = request.getParameter("cowTag");
           String gender = request.getParameter("gender");
           String breed = request.getParameter("breed");
           String CowStatus = ("Healthy");
           String EarlyAge = request.getParameter("EarlyAge");
           String EarlyWeight = request.getParameter("EarlyWeight");
           
           String queryInsert = "INSERT INTO cow"
                                  + "(cowTag, gender, breed ,cowStatus, earlyAge, earlyWeight)"
                                  + " VALUES "
                                  + "('"+cowTag+"', '"+gender+"','"+breed+"', '"+CowStatus+"', '"+EarlyAge+"', '"+EarlyWeight+"' )";
           
           int i = statement.executeUpdate(queryInsert);
           
           if(i==1)
               out.println("<script>alert('Cow Information Has Been Successfully Registered');document.location.href='manageCow.jsp';</script>");
           else
           out.println("<script>alert('Cow Information Failed To Be Registered');window.history.back();</script>");
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
        <center><a href=addCow.jsp>Add Cow</center></a> <br>
    </body>
    </html>
    
    