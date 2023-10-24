/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.annotation.Resource;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author USER
 */
public class payment_validateCreditCard extends HttpServlet {

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
    @Resource
    UserTransaction utx;

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//      
//    }
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
//        processRequest(request, response);
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {

            long creditcardnum = Long.parseLong(request.getParameter("cardnumber"));
            int expmonth = Integer.parseInt(request.getParameter("expirymonth"));
            int expyear = Integer.parseInt(request.getParameter("expiryyear"));
            int cvv = Integer.parseInt(request.getParameter("cvv"));
            String cardnumber = request.getParameter("cardnumber");
            boolean valid = true;

            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Payment.findAll");
            List<Payment> paymentList = query.getResultList();
            session.setAttribute("paymentlist", paymentList);

            //get the last paymentid
            String lastpayID = paymentList.get((paymentList.size()) - 1).getPaymentId();
            //get the last payment id index
            int index = Integer.parseInt(lastpayID.substring(1, 2));
//            out.println(index);
            //assign payment id
            String id = "P" + String.valueOf(index + 1);
//            out.println(id);
            //length of card
            int cardlength = String.valueOf(creditcardnum).length();
            //get the first index of card number entered
            long firstindex = Long.parseLong(Long.toString(creditcardnum).substring(0, 1));

            if ((cardlength != 16 || firstindex != 4) && (cardlength != 16 || firstindex != 5)) {
                valid = false;
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Invalid Card ! Please Try Again!! Only accept visa/mastercard!!\");");
                out.println("location=\'Frontend/payment_creditcard.jsp\';");
                out.println("</script>");

            }

            LocalDate date = LocalDate.now();
            //current month and year
            int month = date.getMonthValue();
            int year = date.getYear();

            if ((expyear == year && expmonth < month) || (expyear < year)) {
                valid = false;
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"credit card has been expired! Please try a new card\");");
                out.println("location=\'Frontend/payment_creditcard.jsp\';");
                out.println("</script>");

            }

            //length of cvv
            int cvv2 = String.valueOf(cvv).length();
            if (cvv2 != 3) {
                valid = false;
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Invalid cvv value\");");
                out.println("location=\'Frontend/payment_creditcard.jsp\';");
                out.println("</script>");

            }

            if (valid == true) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"credit card details entered is valid!\");");
                out.println("location=\'Frontend/payment_creditcard.jsp\';");
                out.println("</script>");
               
                Payment payments = new Payment(id, "CREDITCARD", cardnumber, null);
              
                session.setAttribute("payment", payments);
                response.sendRedirect("Frontend/payment_confirmpayment.jsp");
            }

        } catch (Exception ex) {

        }
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
