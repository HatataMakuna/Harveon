/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author nocry
 */
@Embeddable
public class ProductSpecificationPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "PROD_ID")
    private String prodId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SPEC_ID")
    private String specId;

    public ProductSpecificationPK() {
    }

    public ProductSpecificationPK(String prodId, String specId) {
        this.prodId = prodId;
        this.specId = specId;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public String getSpecId() {
        return specId;
    }

    public void setSpecId(String specId) {
        this.specId = specId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (prodId != null ? prodId.hashCode() : 0);
        hash += (specId != null ? specId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductSpecificationPK)) {
            return false;
        }
        ProductSpecificationPK other = (ProductSpecificationPK) object;
        if ((this.prodId == null && other.prodId != null) || (this.prodId != null && !this.prodId.equals(other.prodId))) {
            return false;
        }
        if ((this.specId == null && other.specId != null) || (this.specId != null && !this.specId.equals(other.specId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProductSpecificationPK[ prodId=" + prodId + ", specId=" + specId + " ]";
    }
    
}
