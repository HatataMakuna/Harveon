package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Customer;

public final class MainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
Customer customer = (Customer)session.getAttribute("currentCus");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Harven</title>\n");
      out.write("        <!-- bootstrap 4.0 css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <!-- Themefisher Icon font -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"themefisherFont/style.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <style>\n");
      out.write("            .text-white{\n");
      out.write("                color:white;\n");
      out.write("            }\n");
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
      out.write("                width:26%;\n");
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
      out.write("                <a href=\"\">My Profile</a>\n");
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
      out.write("            <div class=\"col-lg-3 d-flex flex-row\" style=\"justify-content:center;\"><img src=\"images/harvenLogo.jfif\"></div>\n");
      out.write("            <div class=\"col-lg-6\">\n");
      out.write("                <form class=\"form-inline\" action=\"ProcessSearch\">\n");
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
      out.write("                <button class=\"cart-button\" style=\"background-color:var(--primary);color:white;padding:2% 1%;width:60%;\" onclick=\"window.location.href='findCart';\">Cart</button>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("            <div class=\"d-flex\" style=\"background-image:url('images/banner1.jpg');width:100%;height: 600px;background-repeat:no-repeat;background-size: cover;\">\n");
      out.write("                <div class=\"text-white\" style=\"width:40%;height:fit-content;margin:auto 0;padding:2%;\">\n");
      out.write("                    <h1>Lorem ipsum dolor sit amet, cum sapientem</h1>\n");
      out.write("                    <p>Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem Lorem Ipsum dolor sit amet, cum sapientem</p>\n");
      out.write("                    <button onclick=\"window.location.href='AllProduct.jsp'\" style=\"width:25%;padding:2% 0;background:white\">Shop</button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <section class=\"featured-product\">\n");
      out.write("                <h1 class=\"d-flex\" style=\"position:relative\">\n");
      out.write("                    <span class=\"text-white\" style=\"background:black;\">Featured&nbsp</span>\n");
      out.write("                    <span>Products</span></h1>\n");
      out.write("                \n");
      out.write("                <div class=\"col-lg-12 d-flex flex-row product-section\"style=\"flex-wrap: wrap;justify-content: space-around\">\n");
      out.write("\n");
      out.write("                <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("                    \n");
      out.write("                <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("                \n");
      out.write("                <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("                    \n");
      out.write("                 <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("                    \n");
      out.write("                <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"DisplayProductInfo?method=GET&prodId=P100\">\n");
      out.write("                <div class=\"product-box card\">\n");
      out.write("                    <div class=\"product-image\" style=\"background-image:url('images/test3.jfif')\"></div>\n");
      out.write("                    <div class=\"product-description card-body\">\n");
      out.write("                        <div class=\"product-name\">Huawei Tablet ui-2380213</div>\n");
      out.write("                        <div class=\"product-price\">M 1999.99</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            </section>\n");
      out.write("            <br>\n");
      out.write("            <section class=\"d-flex\" style=\"justify-content:flex-end\">\n");
      out.write("                <div class=\"d-flex flex-row\" style=\"height:250px;width:70%;background-color: #08020B;padding:1%;\">\n");
      out.write("                    <div class=\"m-20 col-lg-6 text-white d-flex flex-column\" style=\"justify-content :center\">\n");
      out.write("                        <h1>EXPLORE MORE OF OUR HOTTEST DEALS</h1>\n");
      out.write("                        <button onclick=\"window.location.href='AllProduct.jsp'\" style=\"width:25%;padding:2% 0;background:white\">Shop</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-6 m-50\" style=\"height:100%;background-image:url('images/banner3.jpg');background-repeat: no-repeat;background-size:contain;background-position-x:right\"></div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("            <br>\n");
      out.write("            <section>\n");
      out.write("                <h1 class=\"d-flex\" style=\"position:relative\">\n");
      out.write("                    <span class=\"text-white\" style=\"background:black;\">Shop By&nbsp</span>\n");
      out.write("                    <span>Categories</span></h1>\n");
      out.write("                <br>\n");
      out.write("                <div class=\"text-center\" style=\"background-color:#E5E5E5\">\n");
      out.write("                    <br>\n");
      out.write("                    <h1>OUR <b>TRUSTED</b> BRANDS</h1>\n");
      out.write("                    <p>Shop with ease with Harvey, providing quality products from these leading brands</p>\n");
      out.write("                    \n");
      out.write("                    <style>\n");
      out.write("                        .logo{\n");
      out.write("                            width:25%;\n");
      out.write("                            aspect-ratio:1/1;\n");
      out.write("                            background-repeat:no-repeat;\n");
      out.write("                            background-position:center;\n");
      out.write("                            background: contain;\n");
      out.write("                        }\n");
      out.write("                    </style>\n");
      out.write("                    <div class=\"d-flex flex-row\">\n");
      out.write("                        <div class=\"logo\" style=\"background-image: url('images/Dyson-Logo.png')\"></div>\n");
      out.write("                        <div class=\"logo\" style=\"background-image: url('images/HP-Logo.png')\"></div>\n");
      out.write("                        <div class=\"logo\" style=\"background-image: url('images/Samsung-Logo.png')\"></div>\n");
      out.write("                        <div class=\"logo\" style=\"background-image: url('images/Microsoft-Logo.png')\"></div>\n");
      out.write("                        <div class=\"logo\" style=\"background-image: url('images/HP-Logo.png')\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("            <br>\n");
      out.write("            <section class=\"d-flex\" style=\"justify-content:flex-start\">\n");
      out.write("                <div class=\"d-flex flex-row\" style=\"height:250px;width:70%;background-color: #08020B;padding:1%;\">\n");
      out.write("                    <div class=\"col-lg-6 m-50\" style=\"height:100%;background-image:url('images/banner4.jpg');background-repeat: no-repeat;background-size:contain;background-position-x:left\"></div>\n");
      out.write("                    <div class=\"m-20 col-lg-6 text-white d-flex flex-column text-right\" style=\"justify-content :center;align-items: flex-end\">\n");
      out.write("                        <h1>YOUR SATISFACTORY</h1>\n");
      out.write("                        <h1>OUR PRIORITY</h1>\n");
      out.write("                        <button onclick=\"window.location.href='AllProduct.jsp'\" style=\"width:25%;padding:2% 0;background:white\">Shop</button>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("            <br>\n");
      out.write("            \n");
      out.write("            <footer>\n");
      out.write("                \n");
      out.write("            </footer>\n");
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
