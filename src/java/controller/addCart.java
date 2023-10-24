/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.Cart;
import model.CartService;
import model.Customer;
import model.Product;

/**
 *
 * @author tzeha
 */
public class addCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean success;
        HttpSession session = request.getSession();
        Product product = (Product) session.getAttribute("selectedProduct");
        Customer customer = (Customer) session.getAttribute("currentCus");
        try {
          
            String quantityString = request.getParameter("quantity");
            int quantity = Integer.parseInt(quantityString);
            int test = 0;
            Cart cart = new Cart(customer.getUsername(), product.getProdId(), quantity);
            CartService cartService = new CartService(em);
            List<Cart> confirmCart = cartService.findWithUsernameAndProdID(customer.getUsername(), product.getProdId());
            if (!confirmCart.isEmpty()) {
                for (int index = 0; index < confirmCart.size(); index++) {
                    if (confirmCart.get(index).getCustomer().getUsername().equals(customer.getUsername()) && confirmCart.get(index).getProduct().getProdId().equals(product.getProdId())) {
                        confirmCart.get(index).setCustomer(customer);
                        confirmCart.get(index).setQuantity(confirmCart.get(index).getQuantity() + quantity);
                        confirmCart.get(index).setProduct(product);
                        utx.begin();
                        success = cartService.updateItem(confirmCart.get(index));
                        utx.commit();
                    }
                }
            } else {
                cart.setCustomer(customer);
                cart.setProduct(product);
                utx.begin();
                success = cartService.addItem(cart);
                utx.commit();
            }

            if (success = true) {
                session.setAttribute("currentCus", customer);
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Add successful \");");
                out.println("location=\'Frontend/SingleProduct.jsp\'");
                out.println("</script>");
            } else {
                session.setAttribute("currentCus", customer);
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Failed to add into cart \");");
                out.println("location=\'Frontend/SingleProduct.jsp\'");
                out.println("</script>");
            }
        } catch (Exception e) {
           out.println(e.getMessage());
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
