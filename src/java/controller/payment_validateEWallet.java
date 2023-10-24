/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
public class payment_validateEWallet extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet validateEwallet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet validateEwallet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        int index;
        try {
            boolean valid = true;
            String phonenumber = request.getParameter("ewalletnumber");
            String pwd = request.getParameter("password");

            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Payment.findAll");
            List<Payment> paymentList = query.getResultList();
            session.setAttribute("paymentlist", paymentList);

            //get the last paymentid
            if(paymentList.size()!=0){
            String lastpayID = paymentList.get((paymentList.size()) - 1).getPaymentId();
            //get the last payment id index
             index = Integer.parseInt(lastpayID.substring(1, 2));
            }
            else{
             index= 00;
            }

            //assign payment id
            String id = "P" + String.valueOf(index + 1);
            if ((phonenumber.length() > 12)) {
                valid = false;
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Invalid phonenumber\");");
                out.println("location=\'Frontend/payment_ewallet.jsp\';");
                out.println("</script>");
                
            }

            if (pwd.length() == 6) {
                for (int i = 0; i < pwd.length(); i++) {
                    if (Character.isDigit(pwd.charAt(i))) {
                        valid = true;
                    } else {
                        valid = false;
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"Password only accept numeric value!! Please try again!!\");");
                        out.println("location=\'Frontend/payment_ewallet.jsp\';");
                        out.println("</script>");
                        break;
                    }
                }
            } else {
                valid = false;
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Password only accept 6 numeric value!! Please Try Again!!\");");
                out.println("location=\'Frontend/payment_ewallet.jsp\';");
                out.println("</script>");
            }

            if (valid == true) {
                  out.println("<script type=\"text/javascript\">");
                out.println("alert(\"credit card details entered is valid!\");");
                out.println("location=\'Frontend/payment_ewallet.jsp\';");
                out.println("</script>");
               
                Payment payments = new Payment(id, "EWALLET", null, phonenumber);
                session.setAttribute("payment", payments);
                response.sendRedirect("Frontend/payment_confirmpayment.jsp");
            }

        } catch (Exception ex) {
          out.println(ex.getMessage());
          ex.getStackTrace();
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
