<%-- 
    Document   : updateSale2
    Created on : Apr 17, 2018, 4:27:13 AM
    Author     : Syafiq
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                String cowTag = request.getParameter("cowTag");
                String saleName = request.getParameter("saleName");
                String noTel = request.getParameter("noTel");
                String saleDate = request.getParameter("saleDate");
                String price = request.getParameter("price");

                String queryh = "UPDATE sale SET saleName = '" + saleName + "', noTel = '" + noTel + "', saleDate = '" + saleDate + "', price = '" + price + "'"
                        + "WHERE cowTag='"+cowTag+"'";
                int h = statement.executeUpdate(queryh);

                if (h == 1) {
                    out.println("<script>alert('Sale Information Has Been Successfully Updated');document.location.href='manageSale.jsp';</script>");
                } else {
                    out.println("<script>alert('Sale Information Failed To Be Updated');window.history.back();</script>");
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
