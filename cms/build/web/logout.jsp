<%-- 
    Document   : logout
    Created on : Apr 28, 2017, 9:38:18 PM
    Author     : Sam
--%>

<%
    session.invalidate(); 
    response.sendRedirect("index.jsp");
%>

