package org.apache.jsp.Frontend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Specification;
import model.Customer;
import model.ProductSpecification;
import java.util.List;
import model.Product;

public final class AllProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../LoadAllProduct", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../LoadAllSpec", out, false);
      out.write('\n');
      out.write('\n');
Customer customer = (Customer)session.getAttribute("currentCus");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <!-- bootstrap 4.0 css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <!-- Themefisher Icon font -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../themefisherFont/style.css\">\n");
      out.write("        <link\n");
      out.write("            rel=\"stylesheet\"\n");
      out.write("            href=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css\"\n");
      out.write("            />\n");
      out.write("        <script src=\"../jquery/dist/jquery.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
List<Product> productList = (List<Product>)session.getAttribute("productList");
      out.write("\n");
      out.write("        ");
List<Specification> specList= (List<Specification>)session.getAttribute("specList");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .product-box{\n");
      out.write("                display:flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("            }\n");
      out.write("         \n");
      out.write("            \n");
      out.write("            .product-image{\n");
      out.write("                aspect-ratio:1/1;\n");
      out.write("                background-size: contain;\n");
      out.write("                background-position: center;\n");
      out.write("                background-repeat:no-repeat;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .container-custom{\n");
      out.write("                padding:10px;\n");
      out.write("            }\n");
      out.write("            button{\n");
      out.write("                cursor:pointer;\n");
      out.write("            }\n");
      out.write("            .product-section a{\n");
      out.write("                width:24%;\n");
      out.write("                margin:0.5%; \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .product-section a:hover{\n");
      out.write("                text-decoration: none; \n");
      out.write("            }\n");
      out.write("            .product-description{\n");
      out.write("                aspect-ratio:2/1;\n");
      out.write("                position:relative;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .product-name{\n");
      out.write("                font-weight:600;\n");
      out.write("                color:#0062BD;\n");
      out.write("                min-height: 8 0px;\n");
      out.write("            }\n");
      out.write("            .product-price{\n");
      out.write("                color:black!important;\n");
      out.write("                font-size:18px;\n");
      out.write("            }\n");
      out.write("            .row{\n");
      out.write("                padding:2%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .form-inline{\n");
      out.write("                width:100%;\n");
      out.write("                height:100%;\n");
      out.write("            }\n");
      out.write("            .input-group{\n");
      out.write("                width:100%!important;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <header style=\"background-color:#0A0A0A;\">\n");
      out.write("            ");
if(customer!=null){
      out.write("\n");
      out.write("            <div class=\"col-lg-12\" style=\"color:white\">\n");
      out.write("                Welcome ");
      out.print(customer.getName());
      out.write("\n");
      out.write("                <a href=\"viewProfile.jsp\">My Profile</a>\n");
      out.write("                <a href=\"../ShowOrderHistory\">My Order</a>\n");
      out.write("            </div>\n");
      out.write("            ");
 }
            else{ 
      out.write("\n");
      out.write("            <div class=\"col-lg-12\" style=\"color:white\"><a href=\"CustomerLogin.html\">Login</a></div>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("            <div class =\"d-flex flex-row\" style=\"background-color:#0A0A0A;justify-content: center;\">\n");
      out.write("            <div onclick=\"window.location.href='MainPage.jsp'\" class=\"col-lg-3 d-flex flex-row\" style=\"justify-content:center;cursor:pointer;\"><img src=\"../picture/harvenLogo.jfif\"></div>\n");
      out.write("            <div class=\"col-lg-6\">\n");
      out.write("                <form class=\"form-inline\" action=\"../ProcessSearch\">\n");
      out.write("                    <div class=\"input-group\">\n");
      out.write("                        <input name=\"search\" class=\"form-control form-control-navbar\" type=\"search\" placeholder=\"Enter product name or id\">\n");
      out.write("                        <div class=\"input-group-append\">\n");
      out.write("                            <button class=\"btn btn-navbar\" type=\"submit\">\n");
      out.write("                                <i class=\"tf-ion-android-search\"></i>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-2\" style=\"margin:auto 0;\">\n");
      out.write("                <button class=\"cart-button\" style=\"background-color:var(--primary);color:white;padding:2% 1%;width:60%;\" onclick=\"window.location.href='../findCart';\">Cart</button>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <h1>All Products</h1>\n");
      out.write("        <section class=\"container-custom d-flex flex-row\">\n");
      out.write("            <div class=\"col-lg-9 d-flex flex-row product-section\"style=\"flex-wrap: wrap\">\n");
      out.write("                ");

                    Product product;
                    for(int i = 0;i<productList.size();i++){ 
                        product = productList.get(i);
                
      out.write("\n");
      out.write("                <a href=\"../DisplayProductInfo?method=GET&prodId=");
      out.print(product.getProdId());
      out.write("\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('");
      out.print(product.getMainImage());
      out.write("')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">");
      out.print(product.getProdName());
      out.write("</div>\n");
      out.write("                        <div class=\"product-price\">RM ");
      out.print(product.getPrice());
      out.write("</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"col-lg-3 d-flex flex-column p-0\">\n");
      out.write("               ");

                    Specification spec;
                    for(int i = 0;i<specList.size();i++){ 
                        spec = specList.get(i);
                
      out.write("\n");
      out.write("                <div class=\"w-100\">\n");
      out.write("                    <div class=\"w-100 row\" style=\"background-color: var(--primary);color:white;\">");
      out.print(spec.getSpecName());
      out.write("</div>\n");
      out.write("                    <div class=\"w-100 row d-flex flex-column p-0\" style=\"background:#F5F5F5;\">\n");
      out.write("                       ");

                           List<ProductSpecification> prodSpecList = spec.getProductSpecificationList();
                        ProductSpecification prodSpec;
                        for(int j = 0;j<prodSpecList.size();j++){ 
                            prodSpec = prodSpecList.get(j);
                        
      out.write("\n");
      out.write("                        <div><input type=\"checkbox\" name=\"filterValue\" value=\"");
      out.print(prodSpec.getSpecValue());
      out.write("\"/>&nbsp;&nbsp;");
      out.print(prodSpec.getSpecValue());
      out.write("</div>\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("                </div>\n");
      out.write("                 ");
 } 
      out.write("\n");
      out.write("                 <script>\n");
      out.write("                     function filterGenerate(){\n");
      out.write("                         var condition =\"\";\n");
      out.write("                         var starting =\"SELECT p FROM Product p WHERE p.prodId IN (SELECT prodId FROM ProductSpecification WHERE \"\n");
      out.write("                         var ending=\");\"\n");
      out.write("                         var checkboxes = document.getElementsByName('filterValue');\n");
      out.write("                         var n = checkboxes.length;\n");
      out.write("                         var totalCondition= 0 ;\n");
      out.write("                         for(var i = 0;i<n;i++){\n");
      out.write("                             \n");
      out.write("                             if($(checkboxes[i]).is(\":checked\")){\n");
      out.write("                                 \n");
      out.write("                                 if(totalCondition !=0){\n");
      out.write("                                 condition += \" AND \"\n");
      out.write("                             }\n");
      out.write("                                 condition += \"specValue='\" + checkboxes[i].value + \"'\";\n");
      out.write("                                 totalCondition++;\n");
      out.write("                             }\n");
      out.write("                         }\n");
      out.write("                         var query = starting + condition + ending;\n");
      out.write("                         \n");
      out.write("//                         $.ajax({\n");
      out.write("//                            url: \"AllProduct.jsp\",\n");
      out.write("//                            data: {\n");
      out.write("//                              sortQuery: query\n");
      out.write("//                            },\n");
      out.write("//                            success: function(data) {\n");
      out.write("//                              alert(\"lol\")\n");
      out.write("//                            }\n");
      out.write("//                        });\n");
      out.write("alert(query)\n");
      out.write("window.location.href=\"AllProduct.jsp?sortQuery=\"+ query;\n");
      out.write("                         \n");
      out.write("                     }\n");
      out.write("                 </script>\n");
      out.write("                 <div class=\"row\"><button onclick=\"filterGenerate();\" class=\"btn-primary\">Submit</button></div>\n");
      out.write("            </div>\n");
      out.write("                \n");
      out.write("        </section>\n");
      out.write("                 \n");
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
