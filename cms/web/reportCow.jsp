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
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Template Name: Darkness
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->

<%

    int cowMale = 0;
    int cowFemale = 0;
    
    Connection connection = null;
    try {
        Class.forName("org.gjt.mm.mysql.Driver");
        String url = "jdbc:mysql://localhost/cms";
        String user = "root";
        String pwd = "";
        connection = DriverManager.getConnection(url, user, pwd);
        Statement statement = connection.createStatement();
        String querySelect = "select * from cow";

        ResultSet rows = statement.executeQuery(querySelect);
        while (rows.next()) {
            if(rows.getString("gender").equals("M")) {
                cowMale++;
            }
            else if(rows.getString("gender").equals("F")) {
                cowFemale++;
            }
        }
    } catch (Exception e) {
        out.println("Error" + e);
        System.out.println("Error" + e);
    } finally {
        if (null != connection) {
            connection.close();
        }
    }

    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    map = new HashMap<Object, Object>();
    map.put("label", "Male");
    map.put("y", cowMale);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Female");
    map.put("y", cowFemale);
    list.add(map);

    String dataPoints = gsonObj.toJson(list);
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>CMS - Cow Report</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <style>
            th {
                cursor: pointer;
            }
        </style>
        
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    title: {
                        text: "Total Cows Based On Gender"
                    },
                    axisX: {
                        title: "Cow Gender"
                    },
                    axisY: {
                        title: "Count"
                    },
                    data: [{
                            type: "column",
                            yValueFormatString: "0",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();
                printpage();
            }
        </script>
    </head>
    <body>
                <div align="right"><input id="printpagebutton" type="hidden" value="Print this page" onclick="printpage()"/></div>

        <center><h1>Cow Report</h1></center>
        <table border="1" style="width:100%">
            <tr>
                <th align=center>CowTag</th>
                <th align=center>Gender</th>
                <th align=center>Breed</th>
                <th align=center>Cow Status</th>
            </tr>
            <%                            String cowTag = "";

                try {
                    Class.forName("org.gjt.mm.mysql.Driver");
                    String url = "jdbc:mysql://localhost/cms";
                    String user = "root";
                    String pwd = "";
                    connection = DriverManager.getConnection(url, user, pwd);
                    Statement statement = connection.createStatement();
                    String querySelect = "select * from cow";

                    ResultSet rows = statement.executeQuery(querySelect);
                    while (rows.next()) {
                        cowTag = rows.getString("cow.cowTag");

                        out.println("<tr><td align=center>" + rows.getString("cow.cowTag") + "</td>");
                        out.println("<td align=center>" + rows.getString("cow.gender") + "</td>");
                        out.println("<td align=center>" + rows.getString("cow.breed") + "</td>");
                        out.println("<td align=center>" + rows.getString("cow.cowStatus") + "</td>");

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
        
        <br></br>
        <div id="chartContainer" style="height: 370px; width: 40%;"></div>
            <script src="./js/canvasjs.min.js"></script>

    </body>
</html>

        <script type="text/javascript">
    function printpage() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("printpagebutton");
        //Set the print button visibility to 'hidden' 
        printButton.style.visibility = 'hidden';
        //Print the page content
        window.print()
        //Set the print button to 'visible' again 
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
        window.history.back();
    }
</script>
