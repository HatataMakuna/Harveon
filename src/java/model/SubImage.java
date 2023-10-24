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
@Table(name = "SUB_IMAGE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SubImage.findAll", query = "SELECT s FROM SubImage s")
    , @NamedQuery(name = "SubImage.findBySubImageId", query = "SELECT s FROM SubImage s WHERE s.subImageId = :subImageId")
    , @NamedQuery(name = "SubImage.findByImageUrl", query = "SELECT s FROM SubImage s WHERE s.imageUrl = :imageUrl")})
public class SubImage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SUB_IMAGE_ID")
    private String subImageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "IMAGE_URL")
    private String imageUrl;
    @JoinColumn(name = "PROD_ID", referencedColumnName = "PROD_ID")
    @ManyToOne(optional = false)
    private Product prodId;

    public SubImage() {
    }

    public SubImage(String subImageId) {
        this.subImageId = subImageId;
    }

    public SubImage(String subImageId, String imageUrl) {
        this.subImageId = subImageId;
        this.imageUrl = imageUrl;
    }

    public String getSubImageId() {
        return subImageId;
    }

    public void setSubImageId(String subImageId) {
        this.subImageId = subImageId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Product getProdId() {
        return prodId;
    }

    public void setProdId(Product prodId) {
        this.prodId = prodId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (subImageId != null ? subImageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SubImage)) {
            return false;
        }
        SubImage other = (SubImage) object;
        if ((this.subImageId == null && other.subImageId != null) || (this.subImageId != null && !this.subImageId.equals(other.subImageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.SubImage[ subImageId=" + subImageId + " ]";
    }
    
}
