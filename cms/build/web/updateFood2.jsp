<%-- 
    Document   : updateFood2
    Created on : Apr 6, 2018, 6:50:26 PM
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
                    connection = DriverManager.getConnection(url, user, pwd);
                    Statement statement = connection.createStatement();

                    String foodID = request.getParameter("foodID");
                    String foodName = request.getParameter("foodName");
                    String foodType = request.getParameter("foodType");
                    String quantity = request.getParameter("quantity");
                    
                    String queryk = "UPDATE food SET foodName = '" + foodName + "', foodType = '" + foodType + "', quantity = '" + quantity + "'"
                           + "WHERE foodID='" + foodID + "'";
                    int k = statement.executeUpdate(queryk);

                    if (k == 1) {
                        out.println("<script>alert('Food Information Has Been Successfully Updated');document.location.href='manageFood.jsp';</script>");
                    } else {
                        out.println("<script>alert('Food Information Failed To Be Updated');window.history.back();</script>");
                    }

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
