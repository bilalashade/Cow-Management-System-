package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public final class chartline_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');


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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("window.onload = function() { \n");
      out.write(" \n");
      out.write("var chart = new CanvasJS.Chart(\"chartContainer\", {\n");
      out.write("\ttheme: \"light2\",\n");
      out.write("\ttitle: {\n");
      out.write("\t\ttext: \"Internet Use in United States\"\n");
      out.write("\t},\n");
      out.write("\tsubtitles: [{\n");
      out.write("\t\ttext: \"2000 to 2015\"\n");
      out.write("\t}],\n");
      out.write("\taxisY:{\n");
      out.write("\t\ttitle: \"Percent of Population\",\n");
      out.write("\t\tsuffix: \"%\",\n");
      out.write("\t\tincludeZero: false\n");
      out.write("\t},\n");
      out.write("\tdata: [{\n");
      out.write("\t\ttype: \"spline\",\n");
      out.write("\t\ttoolTipContent: \"<b>{label}</b>: {y}%\",\n");
      out.write("\t\tdataPoints: ");
out.print(dataPoints);
      out.write("\n");
      out.write("\t}]\n");
      out.write("});\n");
      out.write("chart.render();\n");
      out.write(" \n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("\n");
      out.write("        <div id=\"chartContainer\" style=\"height: 370px; width: 100%;\"></div>\n");
      out.write("        <script src=\"./js/canvasjs.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
