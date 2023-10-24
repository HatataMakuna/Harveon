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
import model.*;

public class DeleteAdminComment extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    private AdminRatingCommentDA DA;

    @Override
    public void init() throws ServletException {
        DA = new AdminRatingCommentDA();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("deleteID");
        //Staff staff = new Staff();
        //RatingComment ratingComment = new RatingComment();
        //staff.setStaffId(request.getParameter("staff"));
        //staff.setStaffId("S0001");
        //ratingComment.setRatingCommentId(request.getParameter("rid"));
        //AdminRatingComment adminRatingComment = new AdminRatingComment(newid, comment, ratingComment, staff);
        HttpSession httpSession = request.getSession();

        httpSession.setAttribute("id", id);
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession httpSession = request.getSession();

        //AdminRatingComment adminRatingComment = (AdminRatingComment) (httpSession.getAttribute("AdminRatingComment"));
        String id = (String) httpSession.getAttribute("id");
        try {
            DA.deleteRecord(id);
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Delete Successful.\");");
            out.println("location=\'Backend/AdminRatingComment.jsp\';");
            out.println("</script>");
            //response.sendRedirect("Backend/AdminRatingComment.jsp");
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    }

}
