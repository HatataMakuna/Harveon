/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Staff;
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

/**
 *
 * @author User
 */
public class GetStaffDetails extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url;
            String userId = request.getUserPrincipal().getName();
            Staff username = (Staff) em.find(Staff.class, userId);
            String staffId = request.getParameter("staffId");
            if (username == null && staffId == null) {
                url = "Backend/admin/AllStaff.jsp";
            } else {
                if(staffId==null){
                    staffId=userId;
                }
                HttpSession session = request.getSession();
                Staff staff = (Staff) em.find(Staff.class, staffId);

                session.setAttribute("staff", staff);
                url = "Backend/staff/StaffDetails.jsp";
            }
            response.sendRedirect(url);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
