/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import model.Email;
import model.SendEmail;

/**
 *
 * @author tzeha
 */
public class emailFind extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String gmail = request.getParameter("email");
        CustomerService cusService = new CustomerService(em);
        List<Customer> customerList = cusService.findAll();
        for (int x = 0; x < customerList.size(); x++) {
            if (gmail.equals(customerList.get(x).getGmail()) == true) {
                
                Customer cus = new Customer(customerList.get(x).getUsername(),customerList.get(x).getPassword(),customerList.get(x).getName(),customerList.get(x).getGender(),customerList.get(x).getIc(),customerList.get(x).getPhone(),customerList.get(x).getGmail(),customerList.get(x).getAddress());
                
                HttpSession session = request.getSession();

                SendEmail se = new SendEmail();
                String code = se.getRandom();

                Email email = new Email(customerList.get(x).getUsername(), customerList.get(x).getGmail(), code);
                session.setAttribute("customer", cus);
                boolean test = se.sendEmail(email);
                if (test) {
                    session.setAttribute("authcode", email);
                    response.sendRedirect("Frontend/validEmail.jsp");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\" Failed to send verification email \");");
                    out.println("location=\'Frontend/CustomerLogin.html\';");
                    out.println("</script>");

                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" thst email cannot be find !!! \");");
                out.println("location=\'Frontend/ForgotPassword.html\';");
                out.println("</script>");
            }
        }
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
        processRequest(request, response);
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

}
