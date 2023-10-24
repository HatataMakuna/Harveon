
package model;

import java.sql.*;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.swing.*;

public class RatingCommentDA {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    private String host = "jdbc:derby://localhost:1527/HarvenDB";
    private String user = "HarvenDB";
    private String password = "HarvenDB";
    private String tableName = "RATING_COMMENT";
    private Connection conn;
    private PreparedStatement stmt;

    public RatingCommentDA() {
        createConnection();
    }
    
    public RatingCommentDA(EntityManager mgr){
        this.mgr = mgr;
    }

    public List<RatingComment> getRatingComment() {
        List RatingCommentList = mgr.createNamedQuery("RatingComment.findAll").getResultList();
        return RatingCommentList;
    }
    
    public void addRecord(RatingComment ratingComment) {
        String insertStr = "INSERT INTO " + tableName + " VALUES(?, ?, ?, ?, ?)";
        try {
            stmt = conn.prepareStatement(insertStr);
            stmt.setString(1, ratingComment.getRatingCommentId());
            stmt.setString(2, ratingComment.getUsername().getUsername());
            stmt.setString(3, ratingComment.getProductId().getProdId());
            stmt.setInt(4, ratingComment.getRating());
            stmt.setString(5, ratingComment.getComment());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public int getRecordLength() {
        String queryStr = "SELECT * FROM " + tableName;
        int x = 0;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.executeQuery();
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                x++;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return x;
    }

//    public Programme getRecord(String code) {
//        String queryStr = "SELECT * FROM " + tableName + " WHERE Code = ?";
//        Programme programme = null;
//        try {
//            stmt = conn.prepareStatement(queryStr);
//            stmt.setString(1, code);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                programme = new Programme(code, rs.getString("Name"), rs.getString("Faculty"));
//            }
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
//        }
//        return programme;
//    }
//
//    public void updateRecord(Programme programme) {
//        try {
//            String updateStr = "UPDATE " + tableName + " SET Name = ?, Faculty = ? " + " WHERE Code = ?";
//            stmt = conn.prepareStatement(updateStr);
//            stmt.setString(1, programme.getName());
//            stmt.setString(2, programme.getFaculty());
//            stmt.setString(3, programme.getCode());
//            stmt.executeUpdate();
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
//        }
//    }
//
//    public void deleteRecord(String code) {
//        try {
//            String deleteStr = "DELETE FROM " + tableName + " WHERE Code = ?";
//            stmt = conn.prepareStatement(deleteStr);
//            stmt.setString(1, code);
//            stmt.executeUpdate();
//
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
//        }
//    }

    private void createConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
//
//    public static void main(String[] args) {
//        ProgrammeDA da = new ProgrammeDA();
//        Programme programme = da.getRecord("IA");
//        System.out.println(programme);
//    }
}
