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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author User
 */
public class updateStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
            boolean output = staffService.updateStaff(staff);
            utx.commit();

            String userId = request.getUserPrincipal().getName();
            Staff username = (Staff) em.find(Staff.class, userId);

            if (output == true && username == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Update success !!! \");");
                out.println("location=\'Backend/admin/AllStaff.jsp\';");
                out.println("</script>");
            } else if (output == true && username != null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Update success !!! \");");
                out.println("location=\'GetStaffDetails\';");
                out.println("</script>");
            }

        } catch (Exception ex) {

        }

    }

}
