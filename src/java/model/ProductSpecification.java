/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author nocry
 */
@Entity
@Table(name = "PRODUCT_SPECIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductSpecification.findAll", query = "SELECT p FROM ProductSpecification p")
    , @NamedQuery(name = "ProductSpecification.findByProdId", query = "SELECT p FROM ProductSpecification p WHERE p.productSpecificationPK.prodId = :prodId")
    , @NamedQuery(name = "ProductSpecification.findBySpecId", query = "SELECT p FROM ProductSpecification p WHERE p.productSpecificationPK.specId = :specId")
    , @NamedQuery(name = "ProductSpecification.findBySpecValue", query = "SELECT p FROM ProductSpecification p WHERE p.specValue = :specValue")})
public class ProductSpecification implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProductSpecificationPK productSpecificationPK;
    @Size(max = 100)
    @Column(name = "SPEC_VALUE")
    private String specValue;
    @JoinColumn(name = "PROD_ID", referencedColumnName = "PROD_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    @JoinColumn(name = "SPEC_ID", referencedColumnName = "SPEC_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Specification specification;

    public ProductSpecification() {
    }

    public ProductSpecification(ProductSpecificationPK productSpecificationPK) {
        this.productSpecificationPK = productSpecificationPK;
    }

    public ProductSpecification(String prodId, String specId) {
        this.productSpecificationPK = new ProductSpecificationPK(prodId, specId);
    }

    public ProductSpecificationPK getProductSpecificationPK() {
        return productSpecificationPK;
    }

    public void setProductSpecificationPK(ProductSpecificationPK productSpecificationPK) {
        this.productSpecificationPK = productSpecificationPK;
    }

    public String getSpecValue() {
        return specValue;
    }

    public void setSpecValue(String specValue) {
        this.specValue = specValue;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productSpecificationPK != null ? productSpecificationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductSpecification)) {
            return false;
        }
        ProductSpecification other = (ProductSpecification) object;
        if ((this.productSpecificationPK == null && other.productSpecificationPK != null) || (this.productSpecificationPK != null && !this.productSpecificationPK.equals(other.productSpecificationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProductSpecification[ productSpecificationPK=" + productSpecificationPK + " ]";
    }
    
}
