package org.apache.jsp.Backend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import model.*;

public final class AdminRatingComment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
String user = (String) session.getAttribute("user");
      out.write('\n');

    List<RatingComment> RatingCommentList = (List) session.getAttribute("RatingCommentList");

      out.write("\n");
      out.write("<!--等staff pass value过来-->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head><meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            .sidebar {\n");
      out.write("                height: 100%;\n");
      out.write("                width: 200px;\n");
      out.write("                position: fixed;\n");
      out.write("                top: 0;\n");
      out.write("                left: 0;\n");
      out.write("                background-color: #143649; \n");
      out.write("            }\n");
      out.write("            .sidebar a{\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            li a:hover{\n");
      out.write("                color: black;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .searchfield{\n");
      out.write("                position: sticky;\n");
      out.write("                background-color: #E0E0E0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 10px 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=text], select {\n");
      out.write("                padding: 5px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                display: inline-block;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #submitS {\n");
      out.write("                background-color: #003366;\n");
      out.write("                color: white;\n");
      out.write("                padding: 5px 10px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #submitS:hover {\n");
      out.write("                background-color: #0066cc;\n");
      out.write("            }\n");
      out.write("             .main{\n");
      out.write("                margin-left: 200px;\n");
      out.write("                padding-bottom: 10px;\n");
      out.write("                padding-left: 20px;\n");
      out.write("                padding-right: 10px;\n");
      out.write("                padding-top: 20px;\n");
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
      out.write("            .info tr:nth-child(odd){\n");
      out.write("                background-color: #CCCCCC;\n");
      out.write("            }\n");
      out.write("            th,td{\n");
      out.write("                padding-top: 1%;\n");
      out.write("                padding-bottom: 1%;\n");
      out.write("                padding-left: 1%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            button{\n");
      out.write("                padding:10px;\n");
      out.write("            }\n");
      out.write("            button:hover{\n");
      out.write("                background-color: #555555;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            .dropdown:hover .dropdown-menu{\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-menu {\n");
      out.write("                margin: auto;\n");
      out.write("                color: white;\n");
      out.write("                background-color: #143649;\n");
      out.write("            }\n");
      out.write("            .dropdown-toggle {\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("            .navbar .dropdown-toggle,\n");
      out.write("            .nav-tabs .dropdown-toggle {\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("        <title>Rating and Comment</title>\n");
      out.write("\n");
      out.write("    </head> \n");
      out.write("    <body style=\"background-color: #EDEDEE\">\n");
      out.write("        <div class=\"sidebar w3-sidebar\" >\n");
      out.write("            <img src=\"../picture/harvenLogo.jfif\" alt=\"HARVEN\" width=\"100%\" height=\"200px\">\n");
      out.write("            \n");
      out.write("            <ul class=\"nav nav-pills flex-column\" >\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"ViewOrderStatus.jsp\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#home\"/></svg>\n");
      out.write("                        Order\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"ViewSalesRecords.jsp\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#speedometer2\"/></svg>\n");
      out.write("                        Sale\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"AllProduct_Backend.jsp\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#table\"/></svg>\n");
      out.write("                        Product\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"../AdminShowRatingComment\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#grid\"/></svg>\n");
      out.write("                        Rating & Comment\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"ViewCustomerRecords.jsp\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#people-circle\"/></svg>\n");
      out.write("                        Customer\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a href=\"../GetStaffDetails\" class=\"nav-link\">\n");
      out.write("                        <svg class=\"bi me-1\" width=\"16\" height=\"16\"><use xlink:href=\"#people-circle\"/></svg>\n");
      out.write("                        Staff\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"padding-left: 20px;\">\n");
      out.write("                    <a class=\"nav-link  dropdown-toggle\" data-toggle=\"dropdown\">  Report  \n");
      out.write("                        <b class=\"caret\"></b>\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"dropdown-menu\" style=\"padding-left: 20px;\">\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"SalesReport.jsp\"> Sales Report </a></li>\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"ProductReport.jsp\"> Product Report </a></li>\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"customerReport.jsp\"> Customer Report </a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <nav class=\"TopNavigation\" style=\"margin-left:200px\">\n");
      out.write("                <div class=\"searchfield\">\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><p style=\"padding-left: 1135px;padding-top: 15px;\">");
      out.print(user);
      out.write("</p></td>\n");
      out.write("                            <td><img src=\"../picture/people-outline.svg\" alt=\"userIcon.png\" style=\"margin-left: 20px; width: 30px ; height: 30px\" ></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main\">\n");
      out.write("             <h1>Rating and Comment - Customer</h1>\n");
      out.write("        </div>\n");
      out.write("        <ul id=\"docs-nav-pills\" class=\"nav nav-pills mb-4\" role=\"tablist\" style=\"margin-left: 350px; margin-top: 30px\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"btn btn-secondary\" href=\"../AdminShowRatingComment\">Customer</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"btn btn-light active\" href=\"../ShowAdminComment\">Staff</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <div>\n");
      out.write("            <table id=\"dtBasicExample\" class=\"table table-striped table-bordered table-sm\" style=\"margin-top: 50px; margin-left: 250px;width: 75%\">\n");
      out.write("                <tr>\n");
      out.write("                    <th style=\"width:60px\"><div style=\"margin-left: 9px\">ID</div></th>\n");
      out.write("                    <th style=\"width:110px;\">Prod ID</th>\n");
      out.write("                    <th style=\"width:160px;\">Username</th>\n");
      out.write("                    <th style=\"width:90px;\">Rating</th>\n");
      out.write("                    <th>Comment</th>\n");
      out.write("                    <th style=\"width:90px;\"></th>\n");
      out.write("                </tr>\n");
      out.write("                ");
 for (RatingComment ratingComment : RatingCommentList) {
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"width:90px;\">");
      out.print(ratingComment.getRatingCommentId());
      out.write("</td>\n");
      out.write("                    <td style=\"width:110px;\">");
      out.print(ratingComment.getProductId().getProdId());
      out.write("</td>\n");
      out.write("                    <td style=\"width:160px;\">");
      out.print(ratingComment.getUsername().getUsername());
      out.write("</td>\n");
      out.write("                    <td style=\"width:90px\"><div style=\"margin-left: 9px\">");
      out.print(ratingComment.getRating());
      out.write("</div></td>\n");
      out.write("                    <td><div style=\"margin-left: 12px\">");
      out.print(ratingComment.getComment());
      out.write("</div></td>\n");
      out.write("                    <th style=\"width:90px;\"><div style=\"margin-left: 9px\"><button type=\"button\" id=\"");
      out.print(ratingComment.getRatingCommentId());
      out.write("\" onclick=\"showDialog(this.id)\" class=\"btn btn-primary btn-sm\">Reply</button></div></th>\n");
      out.write("                </tr>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <div id=\"myModal\" class=\"modal fade\" tabindex=\"-1\">\n");
      out.write("                <div class=\"modal-dialog modal-dialog-centered\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h5 class=\"modal-title\">Comment</h5>\n");
      out.write("                            <button type=\"button\" style=\"border:none; background-color: white\" data-bs-dismiss=\"modal\">&times;</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <form action=\"../addAdminComment\">\n");
      out.write("                                <input type=\"hidden\" type=\"text\" id=\"rid\" name=\"rid\" value=\"a\">\n");
      out.write("                                <textarea class=\"form-control\" name=\"comment\" style=\"height:200px\"></textarea>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancel</button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Reply</button>\n");
      out.write("                        </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function showDialog(id) {\n");
      out.write("                $(document).ready(function () {\n");
      out.write("                    $(\"#myModal\").modal('show');\n");
      out.write("                });\n");
      out.write("                document.getElementById(\"rid\").value = id;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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