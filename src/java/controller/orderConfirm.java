/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Customer;
import model.Product;
import model.ProductService;

/**
 *
 * @author tzeha
 */
public class orderConfirm extends HttpServlet {

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
    EntityManager mgr;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String[] prodID = request.getParameterValues("cart-check");
        String[] quantity = request.getParameterValues("quantity");
        List<Cart> cartList = new ArrayList<>();
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("currentCus");
        ProductService prodService = new ProductService(mgr);
        if (prodID==null||prodID.length==0 ||prodID[0].isEmpty()||prodID[0]==null) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\" No any item will be selected \");");
            out.println("location=\'Frontend/cartDisplay.jsp\';");
            out.println("</script>");

        }
        else{
        for (int index = 0; index < prodID.length; index++) {
            Cart cart = new Cart(cus.getUsername(), prodID[index], Integer.parseInt(quantity[index]));
            cart.setCustomer(cus);
            Product prod = prodService.findProductById(prodID[index]);
            cart.setProduct(prod);
            cartList.add(index, cart);
        }
        session.setAttribute("cartList", cartList);
        response.sendRedirect("Frontend/checkOut.jsp");
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
