/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author nocry
 */
@Entity
@Table(name = "ADMIN_RATING_COMMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AdminRatingComment.findAll", query = "SELECT a FROM AdminRatingComment a")
    , @NamedQuery(name = "AdminRatingComment.findById", query = "SELECT a FROM AdminRatingComment a WHERE a.id = :id")
    , @NamedQuery(name = "AdminRatingComment.findByComment", query = "SELECT a FROM AdminRatingComment a WHERE a.comment = :comment")})
public class AdminRatingComment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ID")
    private String id;
    @Size(max = 100)
    @Column(name = "COMMENT")
    private String comment;
    @JoinColumn(name = "RATING_COMMENT_ID", referencedColumnName = "RATING_COMMENT_ID")
    @ManyToOne(optional = false)
    private RatingComment ratingCommentId;

    public AdminRatingComment() {
    }
    
    public AdminRatingComment(String id, String comment, RatingComment ratingCommentId) {
        this.id = id;
        this.comment = comment;
        this.ratingCommentId = ratingCommentId;
    }    

    public AdminRatingComment(String id) {
        this.id = id;
    }




    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public RatingComment getRatingCommentId() {
        return ratingCommentId;
    }

    public void setRatingCommentId(RatingComment ratingCommentId) {
        this.ratingCommentId = ratingCommentId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AdminRatingComment)) {
            return false;
        }
        AdminRatingComment other = (AdminRatingComment) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.AdminRatingComment[ id=" + id + " ]";
    }
    
}
