/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.ProdSpecService;
import model.Product;
import model.ProductService;
import model.ProductSpecification;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
 * @author nocry
 */
public class LoadAllProduct extends HttpServlet {

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

            ProductService productService = new ProductService(em);
            List<Product> productList = productService.findAll();
            HttpSession httpSession = request.getSession();

            if (request.getParameterMap().containsKey("keyword")) {
                String searchInput = request.getParameter("keyword");

                productList = productService.findAllByKeyword(searchInput);
            } else if (request.getParameterMap().containsKey("productid")) {
                String searchInput = request.getParameter("productid");
                productList = productService.findAllByProductId(searchInput);
            } else if (request.getParameterMap().containsKey("productname")) {
                String searchInput = request.getParameter("productname");
                productList = productService.findAllByProductName(searchInput);
            } else if (request.getParameterMap().containsKey("productprice")) {
                String searchInput = request.getParameter("productprice");
                if (searchInput.isEmpty()) {
                    productList.clear();
                } else {
                    Double price = Double.parseDouble((request.getParameter("productprice")));
                    productList = productService.findAllByProductPrice(price);
                }
            } else if (request.getParameterMap().containsKey("productstock")) {
                String searchInput = request.getParameter("productstock");
                if (searchInput.isEmpty()) {
                    productList.clear();
                } else {
                    Integer field = Integer.parseInt(request.getParameter("productstock"));
                    productList = productService.findAllByProductStock(field);
                }

            } 
            else if(request.getParameterMap().containsKey("sortQuery")){
                String query = request.getParameter("sortQuery");

                productList = productService.filter(query);
            }
            else {

                productList = productService.findAll();
            }

            httpSession.setAttribute("productList", productList);
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
