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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;

/**
 *
 * @author tzeha
 */
public class loginServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.length() == 0 || password.length() == 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\" The username and password is required !!! , please try again \");");
            out.println("location=\'Frontend/CustomerLogin.html\';");
            out.println("</script>");
        }

        CustomerService cusService = new CustomerService(em);
        List<Customer> customerList = cusService.findAll();
        for (int x = 0; x <customerList.size(); x++) {
            if (username.equals(customerList.get(x).getUsername()) == true && password.equals(customerList.get(x).getPassword()) == true)
            {
                Customer cus = new Customer(customerList.get(x).getUsername(),customerList.get(x).getPassword(),customerList.get(x).getName(),customerList.get(x).getGender(),customerList.get(x).getIc(),customerList.get(x).getPhone(),customerList.get(x).getGmail(),customerList.get(x).getAddress());
                HttpSession session = request.getSession();
                session.setAttribute("currentCus",cus);
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Login Successful. Welcome " + customerList.get(x).getName() + "\");");
                out.println("location=\'Frontend/MainPage.jsp\';");
                out.println("</script>");
            }
        }
        out.println("<script type=\"text/javascript\">");
        out.println("alert(\" The username or password is wrong , please try again \");");
        out.println("location=\'Frontend/CustomerLogin.html\';");
        out.println("</script>");
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
