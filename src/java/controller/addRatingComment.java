package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Product;
import model.RatingComment;
import model.RatingCommentDA;

public class addRatingComment extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    private RatingCommentDA DA;

    @Override
    public void init() throws ServletException {
        DA = new RatingCommentDA();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int x = DA.getRecordLength()+1;
        Product product = new Product();
        Customer customer = new Customer();
        String id = "RID000";
        String newid = id +x;
        int ratingStar = Integer.parseInt(request.getParameter("rate"));
        String comment = request.getParameter("comment");
        customer.setUsername(request.getParameter("username"));
        product.setProdId(request.getParameter("PID"));

        RatingComment ratingComment = new RatingComment( newid, ratingStar, comment, customer, product);
        
        HttpSession httpSession = request.getSession();
        
        httpSession.setAttribute("RatingComment", ratingComment);
        doPost(request, response);
//        out.println("You entered the following data");
//        out.println("<p>ID: " + newid);
//        out.println("<br>Length: " + x);
//        out.println("<br>Rating Star: " + ratingStar);
//        out.println("<br>Comment: " + comment);
//        out.println("<br>Username: " + customer.getUsername());
//        out.println("<br>Prod_id: " + product.getProdId());
        
//        out.println("Star :" + Integer.parseInt(request.getParameter("rate")) + "<br/>");
//        out.println("Comment :" + request.getParameter("comment") + "<br/>");
//        out.println("username :" + request.getParameter("username") + "<br/>");
//        out.println("PID :" + request.getParameter("PID") + "<br/>");
//        out.println("<p><form method=\"post\" action=addRatingComment>");
//        out.println("<p><input type=\"submit\" value=\"Confirm\" >");
//        out.println("</form>");
//        out.close();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession httpSession = request.getSession();
        
//        Product product = new Product();
//        Customer customer = new Customer();
//        String id = "IDD1";
//        int ratingStar = Integer.parseInt(request.getParameter("rate"));
//        String comment = request.getParameter("comment");
//        customer.setUsername(request.getParameter("username"));
//        product.setProdId(request.getParameter("PID"));
//        String username1 = customer.getUsername();
//        String prod_id = request.getParameter("PID");

        RatingComment ratingComment = (RatingComment) (httpSession.getAttribute("RatingComment"));
        try {
            DA.addRecord(ratingComment);
            response.sendRedirect("DisplayOrderHistory.jsp");
//            out.println("Star " + ratingComment.getRating() + " Comment" + ratingComment.getComment() + " Customer "
//                    + ratingComment.getUsername().getUsername() + " Prod_id" + ratingComment.getProductId().getProdId());
        } catch (Exception ex) {
            out.println("ERROR: ");
        }
    }

}
