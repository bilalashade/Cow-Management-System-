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

    if ((!group.equals("admin"))) {
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
        <title>CMS - Staff</title>
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
                <h2><a href="index.jsp">Home</a> > Staff</h2>
                <br></br>
                This is the main menu of Staff
                <br></br>
                <li><a href=addStaff.jsp>Add Staff</a></li>
                <li><a href=manageStaff.jsp>Manage Staff</a></li>


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