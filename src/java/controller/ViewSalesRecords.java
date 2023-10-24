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

@WebServlet(name = "ViewSalesRecords", urlPatterns = {"/ViewSalesRecords"})
public class ViewSalesRecords extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            ProductService ps = new ProductService(em);
            List<Product> productList;
            OrderDetailsService ods = new OrderDetailsService(em);
            List<OrderDetails> salesList = ods.findAll();
            OrderDetails od = new OrderDetails();
            salesList.add(od);

            String id = "";
            HttpSession session = request.getSession();
            if (request.getParameterMap().containsKey("productname")) {
                String field = request.getParameter("productname");
                if (field.isEmpty()) {
                    salesList.clear();
                } else {
                    productList = ps.findAllByProductName(field);
                    id = productList.get(0).getProdId();
                    salesList.clear();
                    salesList = ods.findByProduct(id);
                }
            } else if (request.getParameterMap().containsKey("orderid")) {
                String field = request.getParameter("orderid");
                salesList = ods.findByOrder(field);
            } else if (request.getParameterMap().containsKey("quantity")) {
                String field = request.getParameter("quantity");
                if (field.isEmpty()) {
                    salesList.clear();
                } else {
                    Integer quantity = Integer.parseInt(request.getParameter("quantity"));
                    salesList = ods.findAllByQuantity(quantity);
                }

            } else {
                salesList = ods.findAll();
            }
            session.setAttribute("salesList", salesList);

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
