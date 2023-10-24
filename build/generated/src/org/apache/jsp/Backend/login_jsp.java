package org.apache.jsp.Backend;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html style=\"height:100%;\">\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <style>\n");
      out.write("            ._content{\n");
      out.write("                background-image:url('../picture/loginBackground.jpg');\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-size:cover;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            ._picture{\n");
      out.write("                display: block;\n");
      out.write("                margin-left: auto;\n");
      out.write("                margin-right: auto;\n");
      out.write("                width: auto;\n");
      out.write("            }\n");
      out.write("            ._form{\n");
      out.write("                margin-left: auto;\n");
      out.write("                margin-right: auto;\n");
      out.write("                text-align: center;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            ._form input{\n");
      out.write("                width:100%;\n");
      out.write("                padding:2%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            ._SubmitBtn{\n");
      out.write("                color: white;\n");
      out.write("                background-color:rgb(0,48,143);\n");
      out.write("            }\n");
      out.write("            ._RegisterBtn{\n");
      out.write("                color: white;\n");
      out.write("                margin-left:10%;\n");
      out.write("                background-color:rgb(0,48,143);\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <title>Customer Login</title>\n");
      out.write("\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"_content\" style=\"height:100%;padding:5%;\">\n");
      out.write("        <div class=\"d-flex\" style=\"justify-content:flex-end\">\n");
      out.write("            <div style=\"background-color:#0A0A0A;width:30%;padding:2%;border-radius:10px;border:1px solid #0A0A0A;\">\n");
      out.write("                <header><img class=\"_picture\" src=\"../picture/harvenLogo.jfif\" alt=\"Login\"></header>\n");
      out.write("                <form class=\"_form\">\n");
      out.write("                    <div>\n");
      out.write("                        <input id=\"username\" type=\"text\" placeholder=\"Enter Staff ID / Admin\" name=\"j_username\"><br><br>\n");
      out.write("                        <input id=\"password\" type=\"password\" placeholder=\"Enter Password\" name=\"j_password\"><br>\n");
      out.write("                    </div><br>\n");
      out.write("                    <b><button onclick=\"login();\" type=\"submit\" name=\"submit\" value=\"Login\" class=\"_SubmitBtn\"></button></b>\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function login(){\n");
      out.write("                var username = document.getElementById(\"username\").value\n");
      out.write("                var password = document.getElementById(\"password\").value\n");
      out.write("                window.location.href='j_security_check';\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("    \n");
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
