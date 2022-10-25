package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public final class piechart_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');
      out.write('\n');

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "FY11"); map.put("y", 146.65); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "FY12"); map.put("y", 201.46); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "FY13"); map.put("y", 202.69); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "FY14"); map.put("y", 201.7); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "FY15"); map.put("y", 175.51); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "FY16"); map.put("y", 132.03); list.add(map);
 
String dataPoints = gsonObj.toJson(list);

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("window.onload = function() { \n");
      out.write(" \n");
      out.write("var chart = new CanvasJS.Chart(\"chartContainer\", {\n");
      out.write("\ttitle: {\n");
      out.write("\t\ttext: \"Imports of Ore and Minerals in India\"\n");
      out.write("\t},\n");
      out.write("\taxisX: {\n");
      out.write("\t\ttitle: \"Fiscal Year\"\n");
      out.write("\t},\n");
      out.write("\taxisY: {\n");
      out.write("\t\ttitle: \"Imports (in billion USD)\"\n");
      out.write("\t},\n");
      out.write("\tdata: [{\n");
      out.write("\t\ttype: \"column\",\n");
      out.write("\t\tyValueFormatString: \"$#,##0.0# billion\",\n");
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
      out.write("        \n");
      out.write("        <div id=\"chartContainer\" style=\"height: 370px; width: 100%;\"></div>\n");
      out.write("<script src=\"https://canvasjs.com/assets/script/canvasjs.min.js\"></script>\n");
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
