<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%-- 
    Document   : piechart
    Created on : Apr 15, 2018, 2:58:50 AM
    Author     : Sam
--%>

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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

            }
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>

        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <script src="./js/canvasjs.min.js"></script>
    </body>
</html>
