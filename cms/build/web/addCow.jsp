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
        <title>CMS - Add Cow</title>
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
                <h2><a href="index.jsp">Home</a> > <a href="menuCow.jsp">Cow</a> > Add Cow</h2>
                <center><h2>Cow Information</h2></center>
                <center><table border="1" cellpadding="5" width="100%">
                        <form name ="addCow" action="addCow2.jsp" method="GET">
                            <tr>
                                <td>CowTag</td>
                                <td><input type="text" name="cowTag" size="30"></td>
                            </tr>

                            <tr>
                                <td>Gender</td>
                                <td>
                                    <input type="radio" name="gender" value="M"> Male
                                        <br> <input type="radio" name="gender" checked="1" value="F"> Female
                                 </td>
                            </tr>

                            <tr>
                                <td>Breed</td>
                                <td><select name="breed">
                                        <option>Choose Breed</option>
                                        <option value="Adaptaur">Adaptaur</option>
                                        <option value="Braford">Australian Braford</option>
                                        <option value="Abondance (cattle)">Abondance (cattle)</option>
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>Early Age</td>
                                <td><input type="text" name="EarlyAge" size="30"> Months</td> 
                            </tr>

                            <tr>
                                <td>Early Weight</td>
                                <td><input type="text" name="EarlyWeight" size="30"> Kg</td> 
                            </tr>

                    </table>
                    <input type="submit" value="Submit" onClick="return confirm('Are you sure to insert data?');"> &nbsp &nbsp
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