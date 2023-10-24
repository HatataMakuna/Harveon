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
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.*;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.*;

/**
 *
 * @author User
 */

public class addStaff extends HttpServlet {

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

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession();
            StaffService staffService = new StaffService(em);
            Staff staff = new Staff(request.getParameter("staffId"),
                    request.getParameter("staffName"),
                    request.getParameter("staffIc"),
                    request.getParameter("staffContact"),
                    request.getParameter("staffGender").charAt(0));
            utx.begin();
            staffService.addStaff(staff);
            utx.commit();

            response.sendRedirect("Backend/admin/AllStaff.jsp");

        } catch (Exception ex) {

        }

    }
}
