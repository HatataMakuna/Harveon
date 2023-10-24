package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Staff;
import java.util.*;

public final class AllStaff_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/GetAllStaffDetails", out, false);
      out.write('\n');
 List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head><meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\n");
      out.write("        <style>\n");
      out.write("            .sidebar {\n");
      out.write("                height: 100%;\n");
      out.write("                width: 20%;\n");
      out.write("                position: fixed;\n");
      out.write("                top: 0;\n");
      out.write("                left: 0;\n");
      out.write("                background-color: #143649; \n");
      out.write("            }\n");
      out.write("            .sidebar a{\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            li a:hover{\n");
      out.write("                color: black;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            .main{\n");
      out.write("                margin-left: 20%;\n");
      out.write("                height: 100vh;\n");
      out.write("                padding-bottom: 1%;\n");
      out.write("                padding-left: 2%;\n");
      out.write("                padding-right: 1%;\n");
      out.write("                padding-top: 2%;\n");
      out.write("                background-color: #EDEDEE;\n");
      out.write("            }\n");
      out.write("            button{\n");
      out.write("                padding:10px;\n");
      out.write("            }\n");
      out.write("            button:hover{\n");
      out.write("                background-color: #555555;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            table{\n");
      out.write("                width: 80%;\n");
      out.write("                padding-top: 2%;\n");
      out.write("                padding-left: 2%;\n");
      out.write("            }\n");
      out.write("            tr:nth-child(odd){\n");
      out.write("                background-color: #CCCCCC;\n");
      out.write("            }\n");
      out.write("            th,td{\n");
      out.write("                padding-top: 1%;\n");
      out.write("                padding-bottom: 1%;\n");
      out.write("                padding-left: 1%;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <title>Staff Maintanance</title>\n");
      out.write("\n");
      out.write("    </head> \n");
      out.write("    <body>\n");
      out.write("        <div class=\"sidebar w3-sidebar\" >\n");
      out.write("            <img src=\"../Assignment'/logo.png\" alt=\"HARVEN\" width=\"40\" height=\"32\">\n");
      out.write("\n");
      out.write("            <ul class=\"logo\"> </ul>\n");
      out.write("            <ul class=\"nav nav-pills flex-column\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"Staff.html\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#home\"/></svg>\n");
      out.write("                        Home\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"staff.jsp\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#speedometer2\"/></svg>\n");
      out.write("                        Staff\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#table\"/></svg>\n");
      out.write("                        Orders\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#grid\"/></svg>\n");
      out.write("                        Products\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"#\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#people-circle\"/></svg>\n");
      out.write("                        Customers\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <nav class=\"TopNavigation\" style=\"margin-left:20%\">Content for  class \"TopNavigation\" Goes Here</nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main\">\n");
      out.write("            <h1>Staff Maintanance</h1>\n");
      out.write("            <br/>\n");
      out.write("            <button onclick=\"document.location = 'createStaff.jsp'\"> Create New Staff </button><br/>\n");
      out.write("            <div style=\"margin:2%\">\n");
      out.write("                ");
if (staffList.size() == 0) {
      out.write("\n");
      out.write("                <div style=\"text-align:center;\">**No staff details in Database !!</div>\n");
      out.write("                ");
 } else {
      out.write("\n");
      out.write("                <table cellspacing=\"1\" cellpudding=\"1\">\n");
      out.write("\n");
      out.write("                    <tr  style = \"background-color: #BCBCBC;\">\n");
      out.write("                        <th width = \"10%\" > ID </th> \n");
      out.write("                        <th style = \"width: 30%\" > Name </th> \n");
      out.write("                        <th style = \"width: 20%\" > IC </th>\n");
      out.write("                        <th style = \"width: 15%\" > Contact No</th> \n");
      out.write("                        <th style = \"width: 8%\" > Gender </th>\n");
      out.write("                        <th style = \"width: 10%\" >    </th>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("                    ");

                        for (int i = 0; i < staffList.size(); ++i) {
                            Staff staff = staffList.get(i);
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td><a href=\"../GetStaffDetails?staffId=");
      out.print(staff.getStaffId());
      out.write(" \" >");
      out.print(staff.getStaffId());
      out.write("</a></td>\n");
      out.write("                        <td>");
      out.print(staff.getStaffName());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(staff.getStaffIc());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(staff.getStaffContactNo());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(staff.getStaffGender());
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <form action=\"../deleteStaff\" >\n");
      out.write("                                <input type=\"hidden\" name=\"staffId\" value=\"");
      out.print(staff.getStaffId());
      out.write("\">\n");
      out.write("                                <input type=\"submit\"  value=\"Delete\">\n");
      out.write("                            </form>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("                    ");
}
                        }
      out.write("\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
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
