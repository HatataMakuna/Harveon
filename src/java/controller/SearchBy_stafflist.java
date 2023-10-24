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
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author USER
 */
public class SearchBy_stafflist extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String field = "";
      // char gend = 0;
        HttpSession session = request.getSession();
        List<Staff> staffList = (List<Staff>) session.getAttribute("staffList");
        try {
            /* TODO output your page here. You may use following sample code. */
            String optionSelected = request.getParameter("fieldselected");
            field = request.getParameter("details");
       //     gend = field.charAt(0);

            if (field.isEmpty()) {
                staffList.clear();
                response.sendRedirect("Backend/admin/AllStaff.jsp?staffid=" + field);
            } else {
                if (optionSelected.equals("staff_id")) {
                    response.sendRedirect("Backend/admin/AllStaff.jsp?staffid=" + field);
                } else if (optionSelected.equals("staff_name")) {
                    response.sendRedirect("Backend/admin/AllStaff.jsp?staffname=" + field);
                } else if (optionSelected.equals("staff_ic")) {
                    response.sendRedirect("Backend/admin/AllStaff.jsp?staffic=" + field);
                } else if (optionSelected.equals("staff_contact_no")) {
                    response.sendRedirect("Backend/admin/AllStaff.jsp?staffcontactno=" + field);
                } else if (optionSelected.equals("staff_gender")) {
                    response.sendRedirect("Backend/admin/AllStaff.jsp?staffgender=" + field);
                }
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
            out.print(field);
          //  out.print(gend);
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
