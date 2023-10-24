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
import static java.lang.System.out;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author User
 */

public class deleteStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession();
            StaffService staffService = new StaffService(em);

            //Staff staff = (Staff) s.getAttribute("staff");
            String staffId = request.getParameter("staffId");
            // out.print(staff.getStaffId());
            out.print(staffId);
            utx.begin();
            // boolean output = staffService.deleteStaff(staff.getStaffId());
            boolean output = staffService.deleteStaff(staffId);
            utx.commit();
            if (output == true) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Success Delete \");");
                out.println("location=\'Backend/admin/AllStaff.jsp\';");
                out.println("</script>");
            }
        } catch (Exception ex) {
            out.print("error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
