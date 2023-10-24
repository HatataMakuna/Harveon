/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerService;

/**
 *
 * @author USER
 */
public class SearchBy_customerlist extends HttpServlet {

    @PersistenceContext
    EntityManager em;

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String optionSelected = request.getParameter("fieldselected");
            String field = request.getParameter("details");

            if (optionSelected.equals("username")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?username=" + field);
            } else if (optionSelected.equals("password")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?password=" + field);
            } else if (optionSelected.equals("name")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?name=" + field);
            } else if (optionSelected.equals("gender")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?gender=" + field);
            } else if (optionSelected.equals("ic")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?ic=" + field);
            } else if (optionSelected.equals("phone")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?phone=" + field);
            } else if (optionSelected.equals("gmail")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?gmail=" + field);
            } else if (optionSelected.equals("address")) {
                response.sendRedirect("Backend/ViewCustomerRecords.jsp?address=" + field);
            } 
                
        } catch (Exception ex) {
         
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

}
