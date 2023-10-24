package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;

public class updateProfile extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String ic = request.getParameter("ic");
        String phone = request.getParameter("phone");
        char gender = request.getParameter("gender").charAt(0);
        String address = request.getParameter("address");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        boolean success = false;
        boolean icValidation = false;
        boolean phoneValidation = false;
        boolean genderValidation = false;
        int scenerio;

        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("currentCus");
        CustomerService cusService = new CustomerService(em);

        try {

            icValidation = icValidation(ic);
            if (icValidation == true) {
                phoneValidation = phoneValidation(phone);
                if (phoneValidation == true) {
                    genderValidation = genderValidation(gender);
                    if (genderValidation == true) {
                        if (currentPassword.isEmpty() && newPassword.isEmpty() && confirmPassword.isEmpty()) {
                            cus = new Customer(cus.getUsername(), cus.getPassword(), name, gender, ic, phone, cus.getGmail(), address);
                            utx.begin();
                            success = cusService.updateItem(cus);
                            utx.commit();
                        } else {

                            if (currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert(\" ALL password data field must be have data !!\");");
                                out.println("location=\'Frontend/viewProfile.jsp\';");
                                out.println("</script>");
                            } else {
                                if (currentPassword.equals(cus.getPassword())) {
                                    if (newPassword.equals(confirmPassword)) {
                                        int digit = 0, letter = 0, special = 0;
                                        for (int index = 0; index < newPassword.length(); index++) {
                                            if (Character.isDigit(newPassword.charAt(index))) {
                                                digit++;
                                            } else if (Character.isLetter(newPassword.charAt(index))) {
                                                letter++;
                                            } else {
                                                special++;
                                            }
                                        }
                                        if (digit != 0 && letter != 0) {
                                            cus = new Customer(cus.getUsername(), newPassword, name, gender, ic, phone, cus.getGmail(), address);
                                            utx.begin();
                                            success = cusService.updateItem(cus);
                                            utx.commit();
                                        } else {
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert(\" The password must be combination between digit and letter!!!\");");
                                            out.println("location=\'Frontend/viewProfile.jsp\';");
                                            out.println("</script>");
                                        }

                                    } else {
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert(\" The password is not consistence!!!\");");
                                        out.println("location=\'Frontend/viewProfile.jsp\';");
                                        out.println("</script>");
                                    }
                                } else {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert(\" The current password is not correct!!!\");");
                                    out.println("location=\'Frontend/viewProfile.jsp\';");
                                    out.println("</script>");

                                }
                            }

                        }
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\" Invalid Gender !!\");");
                        out.println("location=\'Frontend/viewProfile.jsp\';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\" Invalid Phone Format !!\");");
                    out.println("location=\'Frontend/viewProfile.jsp\';");
                    out.println("</script>");
                }

            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Invalid IC Format !!\");");
                out.println("location=\'Frontend/viewProfile.jsp\';");
                out.println("</script>");
            }

            if (success == true) {
                session.setAttribute("currentCus", cus);
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Mofidy Successful !! try to reload\");");
                out.println("location=\'Frontend/viewProfile.jsp\';");
                out.println("</script>");
            }

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean phoneValidation(String phone) {
        if (phone.length() == 12) {
            phone.matches("\\(\\d{3}\\)-\\d{4}-\\d{3}");
            return true;
        } else if (phone.length() == 13) {
            phone.matches("\\(\\d{3}\\)-\\d{4}-\\d{4}");
            return true;
        } else {
            return false;
        }
    }

    public boolean icValidation(String ic) {
        if (ic.length() == 14) {
            ic.matches("\\(\\d{6}\\)-\\d{2}-\\d{4}");
            return true;
        } else {
            return false;
        }
    }

    public boolean genderValidation(char gender) {
        if (gender == 'm' || gender == 'M' || gender == 'f' || gender == 'F') {
            return true;
        } else {
            return false;
        }
    }

}
