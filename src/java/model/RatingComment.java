/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author nocry
 */
@Entity
@Table(name = "RATING_COMMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RatingComment.findAll", query = "SELECT r FROM RatingComment r")
    , @NamedQuery(name = "RatingComment.findByRatingCommentId", query = "SELECT r FROM RatingComment r WHERE r.ratingCommentId = :ratingCommentId")
    , @NamedQuery(name = "RatingComment.findByRating", query = "SELECT r FROM RatingComment r WHERE r.rating = :rating")
    , @NamedQuery(name = "RatingComment.findByComment", query = "SELECT r FROM RatingComment r WHERE r.comment = :comment")})
public class RatingComment implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ratingCommentId")
    private List<AdminRatingComment> adminRatingCommentList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "RATING_COMMENT_ID")
    private String ratingCommentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "RATING")
    private int rating;
    @Size(max = 100)
    @Column(name = "COMMENT")
    private String comment;
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    @ManyToOne(optional = false)
    private Customer username;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PROD_ID")
    @ManyToOne(optional = false)
    private Product productId;

    public RatingComment() {
    }
    
    public RatingComment(String ratingCommentId, int rating, String comment, Customer username, Product productId) {
        this.ratingCommentId = ratingCommentId;
        this.rating = rating;
        this.comment = comment;
        this.username = username;
        this.productId = productId;
    }


    public RatingComment(String ratingCommentId) {
        this.ratingCommentId = ratingCommentId;
    }

    public RatingComment(String ratingCommentId, int rating) {
        this.ratingCommentId = ratingCommentId;
        this.rating = rating;
    }

    public String getRatingCommentId() {
        return ratingCommentId;
    }

    public void setRatingCommentId(String ratingCommentId) {
        this.ratingCommentId = ratingCommentId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Customer getUsername() {
        return username;
    }

    public void setUsername(Customer username) {
        this.username = username;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ratingCommentId != null ? ratingCommentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RatingComment)) {
            return false;
        }
        RatingComment other = (RatingComment) object;
        if ((this.ratingCommentId == null && other.ratingCommentId != null) || (this.ratingCommentId != null && !this.ratingCommentId.equals(other.ratingCommentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.RatingComment[ ratingCommentId=" + ratingCommentId + " ]";
    }

    @XmlTransient
    public List<AdminRatingComment> getAdminRatingCommentList() {
        return adminRatingCommentList;
    }

    public void setAdminRatingCommentList(List<AdminRatingComment> adminRatingCommentList) {
        this.adminRatingCommentList = adminRatingCommentList;
    }
    
}
