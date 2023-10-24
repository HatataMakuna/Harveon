package org.apache.jsp.Backend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import java.math.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.*;
import java.util.*;

public final class ProductReport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../GetAllData", out, false);
      out.write('\n');
String user = (String) session.getAttribute("user");
      out.write('\n');
List<Product> productList = (List<Product>) session.getAttribute("productList");
      out.write('\n');
List<OrderDetails> orderDetailsList = (List<OrderDetails>) session.getAttribute("orderDetailsList");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\n");
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
      out.write("                height: 100vh;\n");
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
      out.write("            .info tbody{\n");
      out.write("                border: 1px solid rgba(0,0,0,.125);\n");
      out.write("            }\n");
      out.write("            .info tr:nth-child(odd){\n");
      out.write("                background-color: #CCCCCC;\n");
      out.write("            }\n");
      out.write("            th,td{\n");
      out.write("                padding-top: 1%;\n");
      out.write("                padding-bottom: 1%;\n");
      out.write("                padding-left: 1%;\n");
      out.write("            }\n");
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
      out.write("    </head>\n");
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
      out.write("            <h1>Product Report</h1>\n");
      out.write("            ");

                DecimalFormat df = new DecimalFormat("0.00");
                int[] productSales = new int[productList.size()];
                double[] productRevenue = new double[productList.size()];
                int[] salesSort = new int[productList.size()];
                double[] revenueSort = new double[productList.size()];
                int[] topSales = new int[productList.size()];
                int[] topQuantity = new int[productList.size()];

                for (int i = 0; i < productList.size(); i++) {
                    int count = 0;
                    for (int index = 0; index < orderDetailsList.size(); index++) {
                        if (orderDetailsList.get(index).getOrderDetailsPK().getProductId().equals(productList.get(i).getProdId())) {
                            count = count + orderDetailsList.get(index).getQuantity();
                        }
                    }
                    productSales[i] = count;
                    salesSort[i] = count;
                    double total = Double.valueOf(count) * productList.get(i).getPrice().doubleValue();
                    productRevenue[i] = Double.parseDouble(df.format(total));
                    revenueSort[i] = Double.parseDouble(df.format(total));
                }
                for (int i = 0; i < productList.size(); i++) {
                    double tmp = 0;
                    //Next greater than previous
                    for (int index = i + 0; index < productList.size(); index++) {
                        if (revenueSort[index] > revenueSort[i]) {
                            tmp = revenueSort[i];
                            revenueSort[i] = revenueSort[index];
                            revenueSort[index] = tmp;
                        }
                    }
                }
                int num = 0;
                for (int i = 0; i < productList.size(); i++) {
                    if (revenueSort[i] == 0) {
                        num = i;
                        break;
                    }
                }
                for (int i = 0; i < num; i++) {
                    for (int index = 0; index < productList.size(); index++) {
                        if (productRevenue[index] == revenueSort[i]) {
                            if (i > 0 && revenueSort[i - 1] == productRevenue[index]) {
                                topSales[i] = index;
                                break;
                            } else {
                                topSales[i] = index;
                            }
                        }
                    }
                }
                boolean tf = true;
                int in = num;
                for (int index = 0; index < productList.size(); index++) {
                    for (int loop = in; loop > productList.size(); loop--) {
                        if (index == topSales[loop - 1]) {
                            tf = false;
                            break;
                        }
                    }
                    if (tf = true) {
                        if (productRevenue[index] == 0) {
                            topSales[in] = index;
                            in++;
                        }
                    }
                }
                for (int i = 0; i < productList.size(); i++) {
                    int tmp = 0;
                    //Next greater than previous
                    for (int index = i + 1; index < productList.size(); index++) {
                        if (salesSort[index] > salesSort[i]) {
                            tmp = salesSort[i];
                            salesSort[i] = salesSort[index];
                            salesSort[index] = tmp;
                        }
                    }
                }
                num = 0;
                for (int i = 0; i < productList.size(); i++) {
                    if (salesSort[i] == 0) {
                        num = i;
                        break;
                    }
                }
                for (int i = 0; i < num; i++) {
                    for (int index = 0; index < productList.size(); index++) {
                        if (productSales[index] == salesSort[i]) {
                            if (i > 0 && salesSort[i - 1] == productSales[index]) {
                                topQuantity[i] = index;
                                break;
                            } else {
                                topQuantity[i] = index;
                            }
                        }
                    }
                }
                tf = true;
                in = num;
                for (int index = 0; index < productList.size(); index++) {
                    for (int loop = in; loop > productList.size(); loop--) {
                        if (index == topQuantity[loop - 1]) {
                            tf = false;
                            break;
                        }
                    }
                    if (tf = true) {
                        if (productSales[index] == 0) {
                            topQuantity[in] = index;
                            in++;
                        }
                    }
                }
            
      out.write("\n");
      out.write("            <script>\n");
      out.write("                google.charts.load('current', {'packages': ['corechart']});\n");
      out.write("                google.charts.setOnLoadCallback(salesChart);\n");
      out.write("\n");
      out.write("                function salesChart() {\n");
      out.write("                    var data = new google.visualization.DataTable();\n");
      out.write("                    data.addColumn('string', 'Product ID');\n");
      out.write("                    data.addColumn('number', 'RM');\n");
      out.write("                    data.addRows([\n");
      out.write("                        ['");
      out.print(productList.get(topSales[0]).getProdId());
      out.write("', ");
      out.print(productRevenue[topSales[0]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topSales[1]).getProdId());
      out.write("', ");
      out.print(productRevenue[topSales[1]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topSales[2]).getProdId());
      out.write("', ");
      out.print(productRevenue[topSales[2]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topSales[3]).getProdId());
      out.write("', ");
      out.print(productRevenue[topSales[3]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topSales[4]).getProdId());
      out.write("', ");
      out.print(productRevenue[topSales[4]]);
      out.write("]\n");
      out.write("                    ]);\n");
      out.write("\n");
      out.write("                    var options = {\n");
      out.write("                        title: 'BarChart of :     Top 5 Sales of Product'\n");
      out.write("                    };\n");
      out.write("\n");
      out.write("                    var chart = new google.visualization.BarChart(document.getElementById('salesChart'));\n");
      out.write("                    chart.draw(data, options);\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("            <div>Report generate by:  ");
      out.print( (new java.util.Date()).toLocaleString());
      out.write("</div>\n");
      out.write("            <br/>\n");
      out.write("            <p><b>Report Type 1:</b>  Product Sales</p>\n");
      out.write("            <div id=\"salesChart\" style=\"width:80%; min-width:400px; height:250px;\"></div>\n");
      out.write("            <br/>\n");
      out.write("            <table class=\"info\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Top </th>\n");
      out.write("                    <th>Product Name </th>\n");
      out.write("                    <th>Product ID </th>\n");
      out.write("                    <th>Unit Price </th>\n");
      out.write("                    <th>Quantity </th>\n");
      out.write("                    <th>Revenue </th>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                ");
for (int i = 0; i < productList.size(); i++) {
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i + 1);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topSales[i]).getProdName());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topSales[i]).getProdId());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topSales[i]).getPrice());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productSales[topSales[i]]);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productRevenue[topSales[i]]);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </table>\n");
      out.write("            <br/>\n");
      out.write("            <br/>\n");
      out.write("            <script>\n");
      out.write("                google.charts.load('current', {'packages': ['corechart']});\n");
      out.write("                google.charts.setOnLoadCallback(salesChart);\n");
      out.write("\n");
      out.write("                function salesChart() {\n");
      out.write("                    var data = new google.visualization.DataTable();\n");
      out.write("                    data.addColumn('string', 'Customer');\n");
      out.write("                    data.addColumn('number', 'Unit Sold');\n");
      out.write("                    data.addRows([\n");
      out.write("                        ['");
      out.print(productList.get(topQuantity[0]).getProdId());
      out.write("', ");
      out.print(productSales[topQuantity[0]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topQuantity[1]).getProdId());
      out.write("', ");
      out.print(productSales[topQuantity[1]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topQuantity[2]).getProdId());
      out.write("', ");
      out.print(productSales[topQuantity[2]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topQuantity[3]).getProdId());
      out.write("', ");
      out.print(productSales[topQuantity[3]]);
      out.write("],\n");
      out.write("                        ['");
      out.print(productList.get(topQuantity[4]).getProdId());
      out.write("', ");
      out.print(productSales[topQuantity[4]]);
      out.write("]\n");
      out.write("                    ]);\n");
      out.write("\n");
      out.write("                    var options = {\n");
      out.write("                        title: 'ColumnChart of :     Top 5 Quantity of Product'\n");
      out.write("                    };\n");
      out.write("\n");
      out.write("                    var chart = new google.visualization.ColumnChart(document.getElementById('quantityChart'));\n");
      out.write("                    chart.draw(data, options);\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("            <br/>\n");
      out.write("            <p><b>Report Type 2:</b>  Quantity of Product Sold</p>\n");
      out.write("            <div id=\"quantityChart\" style=\"width:80%; min-width:400px; height:250px;\"></div>\n");
      out.write("            <br/>\n");
      out.write("            <table class=\"info\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Top </th>\n");
      out.write("                    <th>Product Name </th>\n");
      out.write("                    <th>Product ID </th>\n");
      out.write("                    <th>Unit Price </th>\n");
      out.write("                    <th>Quantity </th>\n");
      out.write("                    <th>Revenue </th>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                ");
for (int i = 0; i < productList.size(); i++) {
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i + 1);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topQuantity[i]).getProdName());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topQuantity[i]).getProdId());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productList.get(topQuantity[i]).getPrice());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productSales[topQuantity[i]]);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(productRevenue[topQuantity[i]]);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </table>\n");
      out.write("            <br/>\n");
      out.write("            <br/>\n");
      out.write("        </div>\n");
      out.write("    </body> \n");
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
