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

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Template Name: Darkness
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>CMS - Sale Report</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <style>
            th {
                cursor: pointer;
            }
        </style>
    </head>
    <body onload="window.print();window.history.back();">
        <center><h1>Sale Report</h1></center>
        <table border="1" style="width:100%">
            <tr>
                <th align="center">Cow Tag</th>
                <th align="center">Buyer's Name</th>
                <th align="center">Contact No</th>
                <th align="center">Sale Date</th>
                <th align="center">Price</th>
            </tr>
            <%                            String cowTag = "";
                Connection connection = null;
                try {
                    Class.forName("org.gjt.mm.mysql.Driver");
                    String url = "jdbc:mysql://localhost/cms";
                    String user = "root";
                    String pwd = "";
                    connection = DriverManager.getConnection(url, user, pwd);
                    Statement statement = connection.createStatement();
                    String querySelect = "select * from sale";

                                ResultSet rows = statement.executeQuery(querySelect);
                                while (rows.next()) {
                                    cowTag = rows.getString("sale.cowTag");

                                    out.println("<tr><td align=center>" + rows.getString("sale.cowTag") + "</td>");
                                    out.println("<td align=center>" + rows.getString("sale.saleName") + "</td>");
                                    out.println("<td align=center>" + rows.getString("sale.noTel") + "</td>");
                                    out.println("<td align=center>" + rows.getString("sale.saleDate") + "</td>");
                                    out.println("<td align=center>RM " + rows.getString("sale.price") + "</td>");
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
        </table>
    </body>
</html>

