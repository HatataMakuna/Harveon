package controller;

import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ViewCustomerRecords", urlPatterns = {"/ViewCustomerRecords"})
public class ViewCustomerRecords extends HttpServlet {

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
        //ta de code
//        CustomerService cs = new CustomerService(em);
//        List<Customer> customerList = cs.findAll();
//        
//        HttpSession session = request.getSession();
//        session.setAttribute("customerList", customerList);
//        response.sendRedirect("ViewCustomerRecords.jsp");
        //my code
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
//            String optionSelected = request.getParameter("fieldselected");
//            String field = request.getParameter("details");
//            char gend = field.charAt(0);
            CustomerService cs = new CustomerService(em);
            List<Customer> customerList = cs.findAll();
            HttpSession session = request.getSession();
            if (request.getParameterMap().containsKey("username")) {
                String field = request.getParameter("username");

                customerList = cs.findAllByUsername(field);

            } else if (request.getParameterMap().containsKey("password")) {
                String field = request.getParameter("password");
                customerList = cs.findAllByPassword(field);

            } else if (request.getParameterMap().containsKey("name")) {
                String field = request.getParameter("name");
                customerList = cs.findAllByName(field);

            } else if (request.getParameterMap().containsKey("gender")) {
                String field = request.getParameter("gender");
                if (field.isEmpty()) {
                    customerList.clear();
                } else {
                    Character gender = request.getParameter("gender").charAt(0);
                    customerList = cs.findAllByGender(gender);
                }
            } else if (request.getParameterMap().containsKey("ic")) {
                String field = request.getParameter("ic");
                customerList = cs.findAllByIc(field);

            } else if (request.getParameterMap().containsKey("phone")) {
                String field = request.getParameter("phone");
                customerList = cs.findAllByPhone(field);

            } else if (request.getParameterMap().containsKey("gmail")) {
                String field = request.getParameter("gmail");
                customerList = cs.findAllByGmail(field);

            } else if (request.getParameterMap().containsKey("address")) {
                String field = request.getParameter("address");
                customerList = cs.findAllByAddress(field);

            } else {
                customerList = cs.findAll();
            }
            session.setAttribute("customerList", customerList);

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
