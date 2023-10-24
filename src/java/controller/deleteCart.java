/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Thread.sleep;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartService;
import model.Product;
import model.ProductService;

/**
 *
 * @author tzeha
 */
@WebServlet(name = "deleteCart", urlPatterns = {"/deleteCart"})
public class deleteCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean success=false;
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession httpSession = request.getSession();
            CartService cartService = new CartService(em);
            List<Cart> cartList = (List<Cart>) httpSession.getAttribute("cartList");
            Cart cart = cartList.get(Integer.parseInt(request.getParameter("index")));
           
            out.println(cart.getCustomer().getUsername());
            utx.begin();
            if (!em.contains(cart)) {
                cart = em.merge(cart);
            }
              success=cartService.deleteItem(cart);
            utx.commit();
            
            if(success==true){
            response.sendRedirect("findCart");
        }
            else{
            out.println("Error,Please try again");
            sleep(5000);
            response.sendRedirect("Frontend/cartDisplay.jsp");
        }
            
            
            
            
        } catch (Exception ex) {
            out.println(ex.getMessage());
            out.close();
        }
        out.close();

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
