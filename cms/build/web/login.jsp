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
        <title>CMS - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="layout.css" type="text/css" />
    </head>
    <body id="top">
        <div class="wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="index.html">CMS</a></h1>
                    <p><font size=4>Cow Management System</font></p>
                </div>
                <jsp:include page="navibar.jsp" />
                <br class="clear" />
            </div>
        </div>
        <div class="wrapper">
            <div id="latest">
                <h2><a href="index.jsp">Home</a> > Login</h2>
                <center><h2>Login</h2></center>
                <center><table border="1">
                        <form name ="login" action="login2.jsp" method="POST">
                            <tr>
                                <td>Username</td>
                                <td><input type="text" name="userName" size="30"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="pswrd" size="30"></td>
                            </tr>
                    </table>
                    <input type="submit" value="Submit" onClick="return check()"> &nbsp &nbsp
                        <input type="reset" value="Cancel" ></center>
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