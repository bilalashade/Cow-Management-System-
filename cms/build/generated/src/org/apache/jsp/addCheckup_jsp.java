package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class addCheckup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");



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

    if ((!group.equals("staff"))) {
        out.println("<script>alert('You do not have permission to use this module. Redirecting to Login.');document.location.href='login.jsp';</script>");
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<!--\n");
      out.write("Template Name: Darkness\n");
      out.write("Author: <a href=\"http://www.os-templates.com/\">OS Templates</a>\n");
      out.write("Author URI: http://www.os-templates.com/\n");
      out.write("Licence: Free to use under our free template licence terms\n");
      out.write("Licence URI: http://www.os-templates.com/template-terms\n");
      out.write("-->\n");
      out.write("\n");
      out.write("\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <title>CMS - Add Checkup</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"layout.css\" type=\"text/css\" />\n");
      out.write("    </head>\n");
      out.write("    <body id=\"top\">\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <div id=\"logo\">\n");
      out.write("                    <h1><a href=\"index.jsp\">CMS</a></h1>\n");
      out.write("                    <p><font size=4>Cow Management System</font></p>\n");
      out.write("                </div>\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navibar.jsp", out, false);
      out.write("\n");
      out.write("                <br class=\"clear\" />\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div id=\"latest\">\n");
      out.write("                <h2><a href=\"index.jsp\">Home</a> > <a href=\"menuHealthcare.jsp\">Healthcare</a> > Add Checkup</h2>\n");
      out.write("                <center><h2>Add Checkup</h2></center>\n");
      out.write("                <center><table border=\"1\" cellpadding=\"5\" width=\"100%\">\n");
      out.write("                        <form name =\"addCheckup\" action=\"addCheckup2.jsp\" method=\"GET\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Cow Tag :</td>\n");
      out.write("                                <td><select name=\"cowTag\">\n");
      out.write("                                        <option>Choose Cow Tag</option>\n");
      out.write("                                        ");
                                            Connection connection = null;
                                            try {
                                                Class.forName("org.gjt.mm.mysql.Driver");
                                                String url = "jdbc:mysql://localhost/cms";
                                                String user = "root";
                                                String pwd = "";
                                                connection = DriverManager.getConnection(url, user, pwd);
                                                Statement statement = connection.createStatement();
                                                String querySelect = "select cowTag from cow";

                                                ResultSet rows = statement.executeQuery(querySelect);
                                                while (rows.next()) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print(rows.getString("cow.cowTag"));
      out.write('"');
      out.write('>');
      out.print(rows.getString("cow.cowTag"));
      out.write("</option>\n");
      out.write("                                        ");


                                                }
                                            } catch (Exception e) {
                                                out.println("Error" + e);
                                                System.out.println("Error" + e);
                                            } finally {
                                                if (null != connection) {
                                                    connection.close();
                                                }
                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                Date dNow = new Date();
                                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                                SimpleDateFormat ft2 = new SimpleDateFormat("HH:mm");
                            
      out.write(" \n");
      out.write("                            <tr>\n");
      out.write("                                <td>Checkup Date :</td>\n");
      out.write("                                <td><input type=\"datetime-local\" name=\"checkupDate\" value=\"");
      out.print(ft.format(dNow));
      out.write("\" size=\"30\"></td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Checkup Time :</td>\n");
      out.write("                                <td><input type=\"time\" name=\"checkupTime\" value=\"");
      out.print(ft2.format(dNow));
      out.write("\" size=\"30\"></td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Disease ID :</td>\n");
      out.write("                                <td><select name=\"diseaseID\">\n");
      out.write("                                        <option>Choose Disease</option>\n");
      out.write("                                        ");

                                            try {
                                                Class.forName("org.gjt.mm.mysql.Driver");
                                                String url = "jdbc:mysql://localhost/cms";
                                                String user = "root";
                                                String pwd = "";
                                                connection = DriverManager.getConnection(url, user, pwd);
                                                Statement statement = connection.createStatement();
                                                String querySelect2 = "select diseaseID, diseaseName from disease";

                                                ResultSet rows2 = statement.executeQuery(querySelect2);
                                                while (rows2.next()) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print(rows2.getString("disease.diseaseID"));
      out.write('"');
      out.write('>');
      out.print(rows2.getString("disease.diseaseName"));
      out.write("</option>\n");
      out.write("                                        ");


                                                }
                                            } catch (Exception e) {
                                                out.println("Error" + e);
                                                System.out.println("Error" + e);
                                            } finally {
                                                if (null != connection) {
                                                    connection.close();
                                                }
                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Notes :</td>\n");
      out.write("                                <td><input type=\"text\" name=\"notes\" size=\"60\"></td>\n");
      out.write("                            </tr>\n");
      out.write("                    </table>\n");
      out.write("                    <input type=\"hidden\" name=\"staffID\" value=\"");
      out.print(userID);
      out.write("\">\n");
      out.write("                        <input type=\"submit\" value=\"Submit\" onClick=\"return check()\"> &nbsp &nbsp\n");
      out.write("                            <input type=\"reset\" value=\"Reset\" ></center>\n");
      out.write("                                </form>\n");
      out.write("                                </div>\n");
      out.write("                                <br class=\"clear\" />\n");
      out.write("                                </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <br></br>\n");
      out.write("                                <div class=\"wrapper\">\n");
      out.write("                                    <div id=\"footer\">\n");
      out.write("                                        <div id=\"newsletter\">\n");
      out.write("                                            <h2>Mini Gallery</h2>\n");
      out.write("                                            <table><center>\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <td><center><img src=\"images/burgerhome.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\"/></center></td>\n");
      out.write("                                                        <td><center><img src=\"images/ultraman3.0.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\" /></center></td>\n");
      out.write("                                                        <td><center><img src=\"images/dewa19.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\" /></center></td>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <td><center><img src=\"images/dragonball7.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\"/></center></td>\n");
      out.write("                                                        <td><center><img src=\"images/wagyu.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\" /></center></td>\n");
      out.write("                                                        <td><center><img src=\"images/1.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\" /></center></td>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <a href=\"menu.jsp\">View our full cart &raquo;</a>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                </center>\n");
      out.write("                                            </table>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"footbox\">\n");
      out.write("                                            <h2>Special Promotions</h2>\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li class=\"last\"><a href=\"index.jsp\">Eid Adha Sale!!!!</a></li>\n");
      out.write("\n");
      out.write("                                                <li>From <b>1 July to 31 Sept 2017</b>, 10% discount for every cow !!!</li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"footbox\">\n");
      out.write("                                            <h2>Lost? Click Here</h2>\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                                                <li><a href=\"menu.jsp\">Cow</a></li>\n");
      out.write("                                                <li><a href=\"about.jsp\">Barn</a></li>\n");
      out.write("                                                <li><a href=\"order.jsp\">Food</a></li>\n");
      out.write("                                                <li><a href=\"locate.jsp\">Healthcare</a></li>\n");
      out.write("                                                <li><a href=\"about.jsp\">Sales</a></li>\n");
      out.write("                                                <li class=\"last\"><a href=\"login.jsp\">Login</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"footbox\">\n");
      out.write("                                            <h2>Contact Us</h2>\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li>Tel : 012-1116789</li>\n");
      out.write("                                                <li>Fax : 012-3336789</li>\n");
      out.write("                                                <li> Email : <a href=\"https://www.google.com/gmail/about/\">contact@cms.com.my </a></li>\n");
      out.write("                                                <br></br>\n");
      out.write("                                                <li><a href=\"https://www.facebook.com/cms/\">Facebook</a></li>\n");
      out.write("                                                <li><a href=\"https://twitter.com/cms\">Twitter</a></li>\n");
      out.write("                                                <li class=\"last\"><a href=\"https://www.instagram.com/cms/?hl=en\">Instagram</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <br class=\"clear\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"wrapper\"\n");
      out.write("                                         <div id=\"copyright\">\n");
      out.write("                                            <p class=\"fl_left\">Copyright &copy; 2018 - All Rights Reserved - <a href=\"#\">CMS </a></p>\n");
      out.write("                                            <p class=\"fl_right\"><a target=\"_blank\" href=\"http://localhost/cms/aboutdeveloper.jsp\" title=\"About Developer\">Version 0.11b</a></p>\n");
      out.write("                                            <br class=\"clear\" />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </body>\n");
      out.write("                                    </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
