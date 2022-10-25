<%-- 
    Document   : birthday
    Created on : Apr 16, 2018, 3:58:54 AM
    Author     : Sam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Birthday!</h1>
        <form action="birthday.jsp" method="get">
            Birth Date <input type="date" name="birthdate">
            <br></br>
            <input type="submit" value="Calculate">
        </form>

        <%
            
            //get birthdate from form
            String birthdate = "2018-01-01";
            
            if (((String) request.getParameter("birthdate")) != null) {
                birthdate = request.getParameter("birthdate");
            }
            
            //set format for parsing date
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            SimpleDateFormat ft2 = new SimpleDateFormat("MM");
            SimpleDateFormat ft3 = new SimpleDateFormat("dd");
            SimpleDateFormat ft4 = new SimpleDateFormat("yyyy-MM-dd");
            
            
            //convert birthdate into date format
            Date dBirthdate = ft4.parse(birthdate);
            
            //convert birthdate into string based on format
            String birthYearS = ft.format(dBirthdate);
            String birthMonthS = ft2.format(dBirthdate);
            String birthDayS = ft3.format(dBirthdate);
            
            //convert current date into string based on format
            String currentYearS = ft.format(new Date());
            String currentMonthS = ft2.format(new Date());
            String currentDayS = ft3.format(new Date());

            //parse string into int for calculation
            int birthYearI = Integer.parseInt(birthYearS);
            int birthMonthI = Integer.parseInt(birthMonthS);
            int birthDayI = Integer.parseInt(birthDayS);
            int currentYearI = Integer.parseInt(currentYearS);
            int currentMonthI = Integer.parseInt(currentMonthS);
            int currentDayI = Integer.parseInt(currentDayS);

            //formulas for converting year into month
            int birthMonth = (currentYearI - birthYearI) * 12;
            int month = currentMonthI - birthMonthI;
            
            //make integer positive if negative
            int monthPositive = Math.abs(month);
            
            //sum month and year converted into month
            int totalMonth = month + monthPositive;
            
            
            int day = (currentDayI- birthDayI);
            
            //make integer positive if negative
            int dayPositive = Math.abs(day);

            out.println("<h2>" + month + " month old and " + dayPositive + " days</h2>");


        %> 
    </body>
</html>
