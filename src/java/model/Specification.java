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
@Table(name = "SPECIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Specification.findAll", query = "SELECT s FROM Specification s")
    , @NamedQuery(name = "Specification.findBySpecId", query = "SELECT s FROM Specification s WHERE s.specId = :specId")
    , @NamedQuery(name = "Specification.findBySpecName", query = "SELECT s FROM Specification s WHERE s.specName = :specName")})
public class Specification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SPEC_ID")
    private String specId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "SPEC_NAME")
    private String specName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "specification")
    private List<ProductSpecification> productSpecificationList;

    public Specification() {
    }

    public Specification(String specId) {
        this.specId = specId;
    }

    public Specification(String specId, String specName) {
        this.specId = specId;
        this.specName = specName;
    }

    public String getSpecId() {
        return specId;
    }

    public void setSpecId(String specId) {
        this.specId = specId;
    }

    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName;
    }

    @XmlTransient
    public List<ProductSpecification> getProductSpecificationList() {
        return productSpecificationList;
    }

    public void setProductSpecificationList(List<ProductSpecification> productSpecificationList) {
        this.productSpecificationList = productSpecificationList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (specId != null ? specId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Specification)) {
            return false;
        }
        Specification other = (Specification) object;
        if ((this.specId == null && other.specId != null) || (this.specId != null && !this.specId.equals(other.specId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Specification[ specId=" + specId + " ]";
    }
    
}
