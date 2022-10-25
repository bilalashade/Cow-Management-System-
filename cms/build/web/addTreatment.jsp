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
        <title>CMS - Add Treatment</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="layout.css" type="text/css" />
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
                <h2><a href="index.jsp">Home</a> > <a href="menuHealthcare.jsp">Healthcare</a> > <a href="manageTreatment.jsp">Manage Treatment</a> > Add Treatment</h2>
                <br></br>
                <center><h2>Cow Information</h2></center>
                <center><table border="1" cellpadding="5" width="100%">
                            <%                                String cowTag = request.getParameter("cowTag");
                                String checkupDate = request.getParameter("checkupDate");
                                String checkupTime = request.getParameter("checkupTime");
                                
                                String checkupDateTime = checkupDate + " " + checkupTime;

                                Connection connection = null;
                                try {
                                    Class.forName("org.gjt.mm.mysql.Driver");
                                    String url = "jdbc:mysql://localhost/cms";
                                    String user = "root";
                                    String pwd = "";
                                    connection = DriverManager.getConnection(url, user, pwd);
                                    Statement statement = connection.createStatement();
                                    String querySelect = "select * from checkup, cow, disease where checkup.diseaseID = disease.diseaseID && checkup.cowTag = cow.cowTag && checkup.cowTag = '" + cowTag + "' && checkupDateTime = '" + checkupDateTime + "'";
                                    ResultSet rows = statement.executeQuery(querySelect);
                                    while (rows.next()) {
                                        out.println("<tr><td>Cow Tag</td>");
                                        out.println("<td>" + rows.getString("cowTag") + "</td></tr>");
                                        out.println("<tr><td>Gender</td>");
                                        out.println("<td>" + rows.getString("gender") + "</td></tr>");
                                        out.println("<tr><td>Breed</td>");
                                        out.println("<td>" + rows.getString("breed") + "</td></tr>");
                                        out.println("<tr><td>Barn ID</td>");
                                        out.println("<td>" + rows.getString("barnID") + "</td></tr>");
                                        out.println("</tr>");

                            %>
                            <tr>
                                <td>Checkup Date</td>
                                <td><%=checkupDate%></td>
                            </tr>

                            <tr>
                                <td>Checkup Time</td>
                                <td><%=checkupTime%></td>
                            </tr>

                            <tr>
                                <td>Disease ID</td>
                                <td><%=rows.getString("diseaseName")%></td>
                            </tr>

                            <tr>
                                <td>Notes</td>
                                <td><%=rows.getString("notes")%></td>
                            </tr>
                            <%
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


                    </table></center>
                    <p></p>
                    <h2>Treatment</h2>
                    <form name ="addTreatment" action="addTreatment2.jsp" method="GET">
                    <center><table border="1" cellpadding="5" width="100%">
                        <tr>
                            <td>Treatment Date</td>

                            <%
                                Date dNow = new Date();
                                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                                SimpleDateFormat ft2 = new SimpleDateFormat("HH:mm");
                            %>

                            <td><input type="date" name="treatmentDate" value="<%=ft.format(dNow)%>"</td>
                        </tr>
                        <tr>
                            <td>Treatment Time</td>
                            <td><input type="time" name="treatmentTime" value="<%=ft2.format(dNow)%>"</td>
                        </tr>
                        <tr>
                            <td>Treatment Medicine</td>
                            <td><select name="medicineID">
                                        <option>Choose Medicine</option>
                                        <%                                            
                                            
                                            try {
                                                Class.forName("org.gjt.mm.mysql.Driver");
                                                String url = "jdbc:mysql://localhost/cms";
                                                String user = "root";
                                                String pwd = "";
                                                connection = DriverManager.getConnection(url, user, pwd);
                                                Statement statement = connection.createStatement();
                                                String querySelect2 = "select medicineID, medicineName from medicine";

                                                ResultSet rows2 = statement.executeQuery(querySelect2);
                                                while (rows2.next()) {
                                        %>
                                        <option value="<%=rows2.getString("medicine.medicineID")%>"><%=rows2.getString("medicine.medicineName")%></option>
                                        <%

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
                                    </select>
                                </td>
                        </tr>
                                    <tr>
                                        <td>Treatment Notes</td>
                                        <td><input type="text" name="medicineMethod" size="60"</td>
                                    </tr>
                    </table></center>
                        <input type="hidden" name="staffID" value="<%=userID%>">
                            <input type="hidden" name="checkupDate" value="<%=checkupDate%>">
                                <input type="hidden" name="checkupTime" value="<%=checkupTime%>">
                                    <input type="hidden" name="cowTag" value="<%=cowTag%>">
                                        <center><input type="submit" value="Submit" onClick="return confirm('Are you sure to add treatment?');"> &nbsp &nbsp
                                <input type="reset" value="Reset" ></center>
                                    </form>
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