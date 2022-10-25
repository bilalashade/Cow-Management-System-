<%-- 
    Document   : loginValidation
    Created on : Apr 28, 2017, 9:42:01 PM
    Author     : Sam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
    Connection connection = null;
    try {
        boolean checkLogin = false;
        String group = "";
        String name = "";

        //get parameter from login.jsp
        String userName = request.getParameter("userName");
        String pswrd = request.getParameter("pswrd");

        //open database connection
        Class.forName("org.gjt.mm.mysql.Driver");
        String url = "jdbc:mysql://localhost/cms";
        String user = "root";
        String pwd = "";
        connection = DriverManager.getConnection(url, user, pwd);
        Statement statement = connection.createStatement();

        String querySelect = "select * from login, staff where login.UserName = staff.staffID";

        ResultSet rows = statement.executeQuery(querySelect);

        while (rows.next()) {
            if ((rows.getString("login.UserName").equals(userName)) && (rows.getString("login.pswrd").equals(pswrd))) {
                checkLogin = true;
                name = rows.getString("staff.staffName");
                group = rows.getString("login.userType");
            }
        }
        
        if (checkLogin == true) {
            session.setAttribute("userID", userName);
            session.setAttribute("name", name);
            session.setAttribute("group", group);
            
            out.println("<script>alert('Login successful. Redirecting to Homepage.');document.location.href='index.jsp';</script>");
        }
        else
            out.println("<script>alert('Login credentials does not match. Please try again.');window.history.back();</script>");

    } catch (Exception e) {
        out.println("Error" + e);
        System.out.println("Error" + e);
        //It is a good practice to use System.out.println()
        //for printing the error messages in the server console
    } finally {
        if (null != connection) {
            connection.close();
        }
    }

%>