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

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>CMS - Manage Treatment</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="layout.css" type="text/css" />
        <style>
            th {
                cursor: pointer;
            }
        </style>
    </head>
    <body id="top">
        <div class="wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="index.jsp">CMS</a></h1>
                    <p><font size=4>Cow Management System</font></p>
                </div>
                <jsp:include page="navibar.jsp" />
                <br class="clear" />
            </div>
        </div>
        <div class="wrapper">
            <div id="latest">
                <h2><a href="index.jsp">Home</a> > <a href="menuHealthcare.jsp">Healthcare</a> > Manage Treatment</h2>
                <center><h2>Past Treatment</h2></center>
                <br></br>
                <input style="width:20%" type="text" id="myInput" onkeyup="myFunction2()" placeholder="Search..." title="Type in Cow Tag">
                    <br></br>
                    <div align="left"><a href="reportTreatment.jsp"><font color="CCA300">Print Report</font></a></div>

                    <br></br>
                    <table id="myTable" border="1" cellpadding="5" width="100%">
                        <tr id="tableHeader">
                            <th onclick="sortTable(0)" align="center">Cow Tag</th>
                            <th onclick="sortTable(1)" align="center">Treatment Date</th>
                            <th onclick="sortTable(2)" align="center">Treatment Time</th>
                            <th onclick="sortTable(3)" align="center">Checkup Date</th>
                            <th onclick="sortTable(4)" align="center">Checkup Time</th>
                            <th onclick="sortTable(5)" align="center">Staff ID</th>
                            <th onclick="sortTable(6)" align="center">Medicine Name</th>
                            <th onclick="sortTable(7)" align="center">Medicine Method</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <%                            String checkupDate = "";
                            String checkupTime = "";
                            String treatmentDate = "";
                            String treatmentTime = "";
                            String cowTag = "";

                            Connection connection = null;
                            try {
                                Class.forName("org.gjt.mm.mysql.Driver");
                                String url = "jdbc:mysql://localhost/cms";
                                String user = "root";
                                String pwd = "";
                                connection = DriverManager.getConnection(url, user, pwd);
                                Statement statement = connection.createStatement();
                                String querySelect = "select * from medicine, treatment, checkup where treatment.medicineID = medicine.medicineID && treatment.checkupDateTime = checkup.checkupDateTime";

                                ResultSet rows = statement.executeQuery(querySelect);
                                while (rows.next()) {

                                    Date dNow = new Date();
                                    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                                    SimpleDateFormat ft2 = new SimpleDateFormat("HH:mm");
                                    SimpleDateFormat ft3 = new SimpleDateFormat("yyyy-MM-dd HH:mm");

                                    Date dCheckupDateTime = ft3.parse(rows.getString("treatment.checkupDateTime"));
                                    Date dtreatmentDateTime = ft3.parse(rows.getString("treatment.treatmentDateTime"));

                                    checkupDate = ft.format(dCheckupDateTime);
                                    checkupTime = ft2.format(dCheckupDateTime);
                                    treatmentDate = ft.format(dtreatmentDateTime);
                                    treatmentTime = ft2.format(dtreatmentDateTime);
                                    cowTag = rows.getString("checkup.cowTag");

                                    out.println("<tr><td align=center>" + rows.getString("checkup.cowTag") + "</td>");
                                    out.println("<td align=center>" + treatmentDate + "</td>");
                                    out.println("<td align=center>" + treatmentTime + "</td>");
                                    out.println("<td align=center>" + checkupDate + "</td>");
                                    out.println("<td align=center>" + checkupTime + "</td>");
                                    out.println("<td align=center>" + rows.getString("treatment.staffID") + "</td>");
                                    out.println("<td align=center>" + rows.getString("medicine.medicineName") + "</td>");
                                    out.println("<td align=center>" + rows.getString("treatment.medicineMethod") + "</td>");
                                    out.println("<td width=5><a href = updateTreatment.jsp?checkupDate=" + checkupDate + "&checkupTime=" + checkupTime + "&treatmentDate=" + treatmentDate + "&treatmentTime=" + treatmentTime + ">" + "<img width=20 height=20 src=./img/update.png>" + "</a>" + "</td>");
                                    out.println("<td width=5><a onclick=myFunction(); >" + "<img width=20 height=20 src=./img/delete.png>" + "</a>" + "</td>");

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
            </div>
            <br class="clear" />
        </div>
        </div>

        <br></br>
        <div class="wrapper">
            <div id="footer">
                <div id="newsletter">
                    <h2>Mini Gallery</h2>
                    <table><center>
                            <tr>
                                <td><center><img src="images/burgerhome.jpg" alt="" style="width:67px;height:67px;" title=""/></center></td>
                                <td><center><img src="images/ultraman3.0.jpg" alt="" style="width:67px;height:67px;" title="" /></center></td>
                                <td><center><img src="images/dewa19.jpg" alt="" style="width:67px;height:67px;" title="" /></center></td>
                            </tr>
                            <tr>
                                <td><center><img src="images/dragonball7.jpg" alt="" style="width:70px;height:70px;" title=""/></center></td>
                                <td><center><img src="images/wagyu.jpg" alt="" style="width:70px;height:70px;" title="" /></center></td>
                                <td><center><img src="images/1.jpg" alt="" style="width:70px;height:70px;" title="" /></center></td>
                            </tr>
                            <tr>
                                <a href="menu.jsp">View our full cart &raquo;</a>
                            </tr>
                        </center>
                    </table>
                </div>

                <div class="footbox">
                    <h2>Special Promotions</h2>
                    <ul>
                        <li class="last"><a href="index.jsp">Eid Adha Sale!!!!</a></li>

                        <li>From <b>1 July to 31 Sept 2017</b>, 10% discount for every cow !!!</li>
                    </ul>
                </div>
                <div class="footbox">
                    <h2>Lost? Click Here</h2>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="menu.jsp">Cow</a></li>
                        <li><a href="about.jsp">Barn</a></li>
                        <li><a href="order.jsp">Food</a></li>
                        <li><a href="locate.jsp">Healthcare</a></li>
                        <li><a href="about.jsp">Sales</a></li>
                        <li class="last"><a href="login.jsp">Login</a></li>
                    </ul>
                </div>
                <div class="footbox">
                    <h2>Contact Us</h2>
                    <ul>
                        <li>Tel : 012-1116789</li>
                        <li>Fax : 012-3336789</li>
                        <li> Email : <a href="https://www.google.com/gmail/about/">contact@cms.com.my </a></li>
                        <br></br>
                        <li><a href="https://www.facebook.com/cms/">Facebook</a></li>
                        <li><a href="https://twitter.com/cms">Twitter</a></li>
                        <li class="last"><a href="https://www.instagram.com/cms/?hl=en">Instagram</a></li>
                    </ul>
                </div>


                <br class="clear" />
            </div>
            <div class="wrapper"
                 <div id="copyright">
                    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">CMS </a></p>
                    <p class="fl_right"><a target="_blank" href="http://localhost/cms/aboutdeveloper.jsp" title="About Developer">Version 0.11b</a></p>
                    <br class="clear" />
                </div>
            </div>
    </body>
</html>

<script>
    function myFunction() {
        var txt;
        if (confirm("Are you sure want to delete this data?")) {
            document.location.href = 'deleteTreatment.jsp?checkupDate=<%=checkupDate%>&&checkupTime=<%=checkupTime%>&&treatmentDate=<%=treatmentDate%>&&treatmentTime=<%=treatmentTime%>';
        } else {

        }
        document.getElementById("demo").innerHTML = txt;
    }
</script>

<script>
    function myFunction2() {
        var input, filter, found, table, tr, td, i, j;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
                if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                    found = true;
                }
            }
            if (found) {
                tr[i].style.display = "";
                found = false;
            } else if (!tr[i].id.match('^tableHeader')) {
                tr[i].style.display = "none";
            }
        }
    }
</script>

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("myTable");
        switching = true;
        //Set the sorting direction to ascending:
        dir = "asc";
        /*Make a loop that will continue until
         no switching has been done:*/
        while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.getElementsByTagName("TR");
            /*Loop through all table rows (except the
             first, which contains table headers):*/
            for (i = 1; i < (rows.length - 1); i++) {
                //start by saying there should be no switching:
                shouldSwitch = false;
                /*Get the two elements you want to compare,
                 one from current row and one from the next:*/
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /*check if the two rows should switch place,
                 based on the direction, asc or desc:*/
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /*If a switch has been marked, make the switch
                 and mark that a switch has been done:*/
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                //Each time a switch is done, increase this count by 1:
                switchcount++;
            } else {
                /*If no switching has been done AND the direction is "asc",
                 set the direction to "desc" and run the while loop again.*/
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>