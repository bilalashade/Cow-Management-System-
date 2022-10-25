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
            if (rows.getString("gender").equals("M")) {
                cowMale++;
            } else if (rows.getString("gender").equals("F")) {
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
    map.put("label", "2000");
    map.put("y", 43);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2001");
    map.put("y", 49);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2002");
    map.put("y", 59);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2003");
    map.put("y", 62);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2004");
    map.put("y", 65);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2005");
    map.put("y", 68);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2006");
    map.put("y", 69);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2007");
    map.put("y", 75);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2008");
    map.put("y", 74);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2009");
    map.put("y", 71);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2010");
    map.put("y", 72);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2011");
    map.put("y", 70);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2012");
    map.put("y", 75);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2013");
    map.put("y", 72);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2014");
    map.put("y", 73);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2015");
    map.put("y", 75);
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
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Internet Use in United States"
	},
	subtitles: [{
		text: "2000 to 2015"
	}],
	axisY:{
		title: "Percent of Population",
		suffix: "%",
		includeZero: false
	},
	data: [{
		type: "spline",
		toolTipContent: "<b>{label}</b>: {y}%",
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
