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

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    String pageType = "home";
    
        String home = "";
if(pageType.equals("home"))
    home = " class='active'";

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


      out.write("\n");
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
      out.write("        <title>CMS - Home</title>\n");
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
      out.write("                <h2><a href=\"index.jsp\">Home</a></h2>\n");
      out.write("                Welcome, \n");
      out.write("                ");
 if (group.equals("")) {
                        out.println("Guest");
                        out.println("<a href='login.jsp'>Login</a>");
                        out.println("<br></br>");
                                
                    } else {
                        out.println(name);
                        out.println("<br></br>");
                        out.println("<a href='logout.jsp'>Logout</a>");
                    }
                
      out.write("\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <br></br>\n");
      out.write("                <img src=\"img/cow2.jpg\" width=\"100%\"></img>\n");
      out.write("            </div>\n");
      out.write("            <br class=\"clear\" />\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <br></br>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div id=\"footer\">\n");
      out.write("                <div id=\"newsletter\">\n");
      out.write("                    <h2>Mini Gallery</h2>\n");
      out.write("                    <table><center>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><center><img src=\"images/burgerhome.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\"/></center></td>\n");
      out.write("                                <td><center><img src=\"images/ultraman3.0.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\" /></center></td>\n");
      out.write("                                <td><center><img src=\"images/dewa19.jpg\" alt=\"\" style=\"width:67px;height:67px;\" title=\"\" /></center></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><center><img src=\"images/dragonball7.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\"/></center></td>\n");
      out.write("                                <td><center><img src=\"images/wagyu.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\" /></center></td>\n");
      out.write("                                <td><center><img src=\"images/1.jpg\" alt=\"\" style=\"width:70px;height:70px;\" title=\"\" /></center></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <a href=\"menu.jsp\">View our full cart &raquo;</a>\n");
      out.write("                            </tr>\n");
      out.write("                        </center>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"footbox\">\n");
      out.write("                    <h2>Special Promotions</h2>\n");
      out.write("                    <ul>\n");
      out.write("                        <li class=\"last\"><a href=\"index.jsp\">Eid Adha Sale!!!!</a></li>\n");
      out.write("\n");
      out.write("                        <li>From <b>1 July to 31 Sept 2017</b>, 10% discount for every cow !!!</li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footbox\">\n");
      out.write("                    <h2>Lost? Click Here</h2>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"menu.jsp\">Cow</a></li>\n");
      out.write("                        <li><a href=\"about.jsp\">Barn</a></li>\n");
      out.write("                        <li><a href=\"order.jsp\">Food</a></li>\n");
      out.write("                        <li><a href=\"locate.jsp\">Healthcare</a></li>\n");
      out.write("                        <li><a href=\"about.jsp\">Sales</a></li>\n");
      out.write("                        <li class=\"last\"><a href=\"login.jsp\">Login</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footbox\">\n");
      out.write("                    <h2>Contact Us</h2>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>Tel : 012-1116789</li>\n");
      out.write("                        <li>Fax : 012-3336789</li>\n");
      out.write("                        <li> Email : <a href=\"https://www.google.com/gmail/about/\">contact@cms.com.my </a></li>\n");
      out.write("                        <br></br>\n");
      out.write("                        <li><a href=\"https://www.facebook.com/cms/\">Facebook</a></li>\n");
      out.write("                        <li><a href=\"https://twitter.com/cms\">Twitter</a></li>\n");
      out.write("                        <li class=\"last\"><a href=\"https://www.instagram.com/cms/?hl=en\">Instagram</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <br class=\"clear\" />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"wrapper\"\n");
      out.write("                 <div id=\"copyright\">\n");
      out.write("                    <p class=\"fl_left\">Copyright &copy; 2018 - All Rights Reserved - <a href=\"#\">CMS </a></p>\n");
      out.write("                    <p class=\"fl_right\"><a target=\"_blank\" href=\"http://localhost/cms/aboutdeveloper.jsp\" title=\"About Developer\">Version 0.11b</a></p>\n");
      out.write("                    <br class=\"clear\" />\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
