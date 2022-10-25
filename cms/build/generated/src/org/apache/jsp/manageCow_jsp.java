package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class manageCow_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if ((group.equals(""))) {
        out.println("<script>alert('You do not have permission to use this module. Redirecting to Login.');document.location.href='login.jsp';</script>");
    }


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
      out.write("        <title>CMS - Cow Report</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"layout.css\" type=\"text/css\" />\n");
      out.write("        <style>\n");
      out.write("            th {\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
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
      out.write("                <h2><a href=\"index.jsp\">Home</a> > <a href=\"menuCow.jsp\">Cow</a> > Cow Report</h2>\n");
      out.write("\n");
      out.write("                <br></br>\n");
      out.write("                <input style=\"width:20%\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction2()\" placeholder=\"Search Cow ID...\" title=\"Type in Cow ID\">\n");
      out.write("                    <div align=\"right\"><a href=\"addCow.jsp\"><font color=\"CCA300\">Add New Cow</font></a></div>\n");
      out.write("                    <br></br>\n");
      out.write("                    <table id=\"myTable\" border=\"1\" style=\"width:100%\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th onclick=\"sortTable(0)\" align=center>CowTag</th>\n");
      out.write("                            <th onclick=\"sortTable(1)\" align=center>Gender</th>\n");
      out.write("                            <th onclick=\"sortTable(2)\" align=center>Breed</th>\n");
      out.write("                            <th onclick=\"sortTable(3)\" align=center>Cow Status</th>\n");
      out.write("                            <th align=center></th>\n");
      out.write("                            <th align=center></th>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
                            String cowTag = "";
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
                                    cowTag = rows.getString("cow.cowTag");

                                    out.println("<tr><td align=center>" + rows.getString("cow.cowTag") + "</td>");
                                    out.println("<td align=center>" + rows.getString("cow.gender") + "</td>");
                                    out.println("<td align=center>" + rows.getString("cow.breed") + "</td>");
                                    out.println("<td align=center>" + rows.getString("cow.cowStatus") + "</td>");
                                    out.println("<td width=5><a href = updateCow.jsp?cowTag=" + rows.getString("cow.cowTag") + ">" + "<img width=20 height=20 src=./img/update.png>" + "</a>" + "</td>");
                                    out.println("<td width=5><a onclick=myFunction(); >" + "<img width=20 height=20 src=./img/delete.png>" + "</a>" + "</td>");

                        
      out.write("\n");
      out.write("                        <script>\n");
      out.write("                            function myFunction() {\n");
      out.write("                                var txt;\n");
      out.write("                                if (confirm(\"Are you sure want to delete this data?\")) {\n");
      out.write("                                    document.location.href = 'deleteCow.jsp?cowTag=");
      out.print(cowTag);
      out.write("';\n");
      out.write("                                } else {\n");
      out.write("\n");
      out.write("                                }\n");
      out.write("                                document.getElementById(\"demo\").innerHTML = txt;\n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                        ");

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
      out.write("                    </table>\n");
      out.write("\n");
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
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function myFunction2() {\n");
      out.write("        var input, filter, table, tr, td, i;\n");
      out.write("        input = document.getElementById(\"myInput\");\n");
      out.write("        filter = input.value.toUpperCase();\n");
      out.write("        table = document.getElementById(\"myTable\");\n");
      out.write("        tr = table.getElementsByTagName(\"tr\");\n");
      out.write("        for (i = 0; i < tr.length; i++) {\n");
      out.write("            td = tr[i].getElementsByTagName(\"td\")[0];\n");
      out.write("            if (td) {\n");
      out.write("                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n");
      out.write("                    tr[i].style.display = \"\";\n");
      out.write("                } else {\n");
      out.write("                    tr[i].style.display = \"none\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function sortTable(n) {\n");
      out.write("        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;\n");
      out.write("        table = document.getElementById(\"myTable\");\n");
      out.write("        switching = true;\n");
      out.write("        //Set the sorting direction to ascending:\n");
      out.write("        dir = \"asc\";\n");
      out.write("        /*Make a loop that will continue until\n");
      out.write("         no switching has been done:*/\n");
      out.write("        while (switching) {\n");
      out.write("            //start by saying: no switching is done:\n");
      out.write("            switching = false;\n");
      out.write("            rows = table.getElementsByTagName(\"TR\");\n");
      out.write("            /*Loop through all table rows (except the\n");
      out.write("             first, which contains table headers):*/\n");
      out.write("            for (i = 1; i < (rows.length - 1); i++) {\n");
      out.write("                //start by saying there should be no switching:\n");
      out.write("                shouldSwitch = false;\n");
      out.write("                /*Get the two elements you want to compare,\n");
      out.write("                 one from current row and one from the next:*/\n");
      out.write("                x = rows[i].getElementsByTagName(\"TD\")[n];\n");
      out.write("                y = rows[i + 1].getElementsByTagName(\"TD\")[n];\n");
      out.write("                /*check if the two rows should switch place,\n");
      out.write("                 based on the direction, asc or desc:*/\n");
      out.write("                if (dir == \"asc\") {\n");
      out.write("                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {\n");
      out.write("                        //if so, mark as a switch and break the loop:\n");
      out.write("                        shouldSwitch = true;\n");
      out.write("                        break;\n");
      out.write("                    }\n");
      out.write("                } else if (dir == \"desc\") {\n");
      out.write("                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {\n");
      out.write("                        //if so, mark as a switch and break the loop:\n");
      out.write("                        shouldSwitch = true;\n");
      out.write("                        break;\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            if (shouldSwitch) {\n");
      out.write("                /*If a switch has been marked, make the switch\n");
      out.write("                 and mark that a switch has been done:*/\n");
      out.write("                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);\n");
      out.write("                switching = true;\n");
      out.write("                //Each time a switch is done, increase this count by 1:\n");
      out.write("                switchcount++;\n");
      out.write("            } else {\n");
      out.write("                /*If no switching has been done AND the direction is \"asc\",\n");
      out.write("                 set the direction to \"desc\" and run the while loop again.*/\n");
      out.write("                if (switchcount == 0 && dir == \"asc\") {\n");
      out.write("                    dir = \"desc\";\n");
      out.write("                    switching = true;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>");
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
