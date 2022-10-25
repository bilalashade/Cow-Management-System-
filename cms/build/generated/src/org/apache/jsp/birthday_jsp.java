package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class birthday_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello Birthday!</h1>\n");
      out.write("        <form action=\"birthday.jsp\" method=\"get\">\n");
      out.write("            Birth Date <input type=\"date\" name=\"birthdate\">\n");
      out.write("            <br></br>\n");
      out.write("            <input type=\"submit\" value=\"Calculate\">\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        ");

            
            //get birthdate from form
            String birthdate = "2018-01-01";
            
            if (((String) request.getParameter("birthdate")) != null) {
                birthdate = request.getParameter("birthdate");
            }
            
            //set format for parsing date
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            SimpleDateFormat ft2 = new SimpleDateFormat("MM");
            SimpleDateFormat ft3 = new SimpleDateFormat("dd");
            SimpleDateFormat ft4 = new SimpleDateFormat("yyyy-MM-dd");
            
            
            //convert birthdate into date format
            Date dBirthdate = ft4.parse(birthdate);
            
            //convert birthdate into string based on format
            String birthYearS = ft.format(dBirthdate);
            String birthMonthS = ft2.format(dBirthdate);
            String birthDayS = ft3.format(dBirthdate);
            
            //convert current date into string based on format
            String currentYearS = ft.format(new Date());
            String currentMonthS = ft2.format(new Date());
            String currentDayS = ft3.format(new Date());

            //parse string into int for calculation
            int birthYearI = Integer.parseInt(birthYearS);
            int birthMonthI = Integer.parseInt(birthMonthS);
            int birthDayI = Integer.parseInt(birthDayS);
            int currentYearI = Integer.parseInt(currentYearS);
            int currentMonthI = Integer.parseInt(currentMonthS);
            int currentDayI = Integer.parseInt(currentDayS);

            //formulas for converting year into month
            int birthMonth = (currentYearI - birthYearI) * 12;
            int month = currentMonthI - birthMonthI;
            
            //make integer positive if negative
            int monthPositive = Math.abs(month);
            
            //sum month and year converted into month
            int totalMonth = month + monthPositive;
            
            
            int day = (currentDayI- birthDayI);
            
            //make integer positive if negative
            int dayPositive = Math.abs(day);

            out.println("<h2>" + month + " month old and " + dayPositive + " days</h2>");


        
      out.write(" \n");
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
