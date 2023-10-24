/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.CustomerService;
import javax.swing.*;
import model.Email;
import model.SendEmail;

/**
 *
 * @author tzeha
 */
public class registerValidationServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            // Obtain the HttpSession
            HttpSession httpSession = request.getSession();
            // Get the Programame object in the HttpSession
            Customer cus = (Customer) httpSession.getAttribute("customer");

            boolean usernameValidation = false;
            boolean gmailValidation = false;
            boolean icValidation = false;
            boolean phoneValidation = false;
            CustomerService cusService = new CustomerService(em);
            List<Customer> customerList = cusService.findAll();
            out.println(cus.getUsername());
            out.println(cus.getGmail());

            usernameValidation = usernamevalidation(cus.getUsername(), customerList);
            if (usernameValidation == true) {
                gmailValidation = gmailValidation(cus.getGmail(), customerList);
                if (gmailValidation == true) {
                    icValidation = icValidation(cus.getIc());
                    if (icValidation == true) {
                        phoneValidation = phoneValidation(cus.getPhone());
                        if (phoneValidation == true) {
                            SendEmail se = new SendEmail();
                            String code = se.getRandom();
                            Email email = new Email(cus.getUsername(), cus.getGmail(), code);
                            boolean emailValidation = se.sendEmail(email);
                            if (emailValidation) {
                                httpSession.setAttribute("authcode", email);
                                response.sendRedirect("Frontend/vertifyEmail.jsp");
                            } else {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert(\" Failed to send verification email \");");
                                out.println("location=\'Frontend/CustomerRegister.html\';");
                                out.println("</script>");
                            }
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert(\" Invalid Phone Format,Please Try Again\");");
                            out.println("location=\'Frontend/CustomerRegister.html\';");
                            out.println("</script>");
                        }
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\" Invalid IC Format,Please Try Again\");");
                        out.println("location=\'Frontend/CustomerRegister.html\';");
                        out.println("</script>");

                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\" The Gmail already  axist.Ply try again \");");
                    out.println("location=\'Frontend/CustomerRegister.html\';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" The Username already  axist.Ply try again \");");
                out.println("location=\'Frontend/CustomerRegister.html\';");
                out.println("</script>");
            }

        } catch (Exception ex) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"" + ex.getMessage() + "\");");
            out.println("location=\'Frontend/CustomerRegister.html\';");
            out.println("</script>");
        }
    }

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

    public boolean usernamevalidation(String username, List<Customer> customerList) {
        for (int x = 0; x < customerList.size(); x++) {
            if (username.equals(customerList.get(x).getUsername())) {
                return false;
            }
        }
        return true;
    }

    public boolean gmailValidation(String gmail, List<Customer> customerList) {
        for (int x = 0; x < customerList.size(); x++) {
            if (gmail.equals(customerList.get(x).getGmail())) {
                return false;
            }
        }
        return true;
    }
}
