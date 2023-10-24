package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import model.*;

/**
 *
 * @author User
 */
public class GetAllData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            HttpSession session = request.getSession();

            //Customer
            List<Customer> customerList;
            CustomerService customerService = new CustomerService(em);
            customerList = (List<Customer>) customerService.findAll();
            session.setAttribute("customerList", customerList);

            //Staff
            List<Staff> staffList;
            StaffService staffService = new StaffService(em);
            staffList = (List<Staff>) staffService.findAll();
            session.setAttribute("staffList", staffList);

            //Product
            List<Product> productList;
            ProductService productService = new ProductService(em);
            productList = productService.findAll();
            session.setAttribute("productList", productList);

            //Order details 
            List<OrderDetails> orderDetailsList;
            OrderDetailsService orderDetailsService = new OrderDetailsService(em);
            orderDetailsList = orderDetailsService.findAll();
            session.setAttribute("orderDetailsList", orderDetailsList);

            //OrderProduct
            List<OrderProduct> orderProductList;
            OrderProductService orderProductService = new OrderProductService(em);
            orderProductList = orderProductService.findAll();
            session.setAttribute("orderProductList", orderProductList);

            //Product Specification
            List<ProductSpecification> prodspecList;
            ProdSpecService prodSpecService = new ProdSpecService(em);
            prodspecList = prodSpecService.findAll();
            session.setAttribute("prodspecList", prodspecList);
            
            String userId = request.getUserPrincipal().getName();
            session.setAttribute("user", userId);

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
