/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Staff;
import model.StaffService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class GetAllStaffDetails extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            List<Staff> staffList;
            StaffService staffService = new StaffService(em);

            HttpSession session = request.getSession();

            if (request.getParameterMap().containsKey("staffid")) {
                String search = request.getParameter("staffid");
                staffList = staffService.findAllByStaffId(search);
            } else if (request.getParameterMap().containsKey("staffname")) {
                String search = request.getParameter("staffname");
                staffList = staffService.findAllByStaffName(search);
            } else if (request.getParameterMap().containsKey("staffic")) {
                String search = request.getParameter("staffic");
                staffList = staffService.findAllByStaffIc(search);
            } else if (request.getParameterMap().containsKey("staffcontactno")) {
                String search = request.getParameter("staffcontactno");
                staffList = staffService.findAllByStaffContactNo(search);
            } else if (request.getParameterMap().containsKey("staffgender")) {
                Character search = request.getParameter("staffgender").charAt(0);
                staffList = staffService.findAllByStaffGender(search);
            } else {
                staffList = staffService.findAll();
            }

            session.setAttribute("staffList", staffList);

        } catch (Exception ex) {

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
