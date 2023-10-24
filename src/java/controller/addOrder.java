/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
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
import model.OrderDetails;
import model.OrderDetailsService;
import model.OrderProduct;
import model.OrderProductService;
import model.Payment;

public class addOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("currentCus");
        List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
        int index;
        double totalPrice = (Double) session.getAttribute("totalPrice");
        try {
            
        
            OrderProductService orderService = new OrderProductService(em);
            OrderDetailsService orderDetailsService = new OrderDetailsService(em);
            CartService cartService = new CartService(em);
            String orderID="";
            List <OrderProduct> orderList = orderService.findAll();
            
            if(orderList.size()==0){
                orderID="OR1";
            }
            
            else{
                 String lastOrderID = orderList.get(orderList.size()-1) .getOrderId();
                  index = Integer.parseInt(lastOrderID.substring(2,3));
                  orderID="OR" + String.valueOf(index+1);
            }
            
            
            Payment payment =(Payment) session.getAttribute("payment");
            LocalDate localDate = LocalDate.now();
            Date date = java.sql.Date.valueOf(localDate);
            OrderProduct order = new OrderProduct(orderID, cus, payment, totalPrice, (Date) date, "Packaging");
            out.println(orderID + "\n");
            out.println(cus.getUsername() + "\n");
            out.println(payment.getPaymentId() + "\n");
            out.println(totalPrice + "\n");
            out.println(date + "\n");

           
            utx.begin();
            boolean success = orderService.addItem(order);
            boolean success1 = false, success2 = false;
            utx.commit();
            for (int x = 0; x < cartList.size(); x++) {
                OrderDetails orderDetails = new OrderDetails(cartList.get(x).getProduct().getProdId(), orderID, cartList.get(x).getQuantity());
                orderDetails.setProduct(cartList.get(x).getProduct());
                Cart cart = cartList.get(x);

                utx.begin();
                success1 = orderDetailsService.addItem(orderDetails);
                utx.commit();

                utx.begin();
                if (!em.contains(cart)) {
                    cart = em.merge(cart); 
                }
                success2 = cartService.deleteItem(cart);
                utx.commit();
            }

            if (success == true && success1 == true && success2 == true) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Succesful Add Order \");");
                out.println("location=\'Frontend/MainPage.jsp\';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\" Invalid to Add Order \");");
                out.println("location=\'Frontend/MainPage.jsp\';");
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
