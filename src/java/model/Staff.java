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
@Table(name = "STAFF")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s")
    , @NamedQuery(name = "Staff.findByStaffId", query = "SELECT s FROM Staff s WHERE s.staffId = :staffId")
    , @NamedQuery(name = "Staff.findByStaffName", query = "SELECT s FROM Staff s WHERE s.staffName = :staffName")
    , @NamedQuery(name = "Staff.findByStaffIc", query = "SELECT s FROM Staff s WHERE s.staffIc = :staffIc")
    , @NamedQuery(name = "Staff.findByStaffContactNo", query = "SELECT s FROM Staff s WHERE s.staffContactNo = :staffContactNo")
    , @NamedQuery(name = "Staff.findByStaffGender", query = "SELECT s FROM Staff s WHERE s.staffGender = :staffGender")
    , @NamedQuery(name = "Staff.findAllByStaffName", query = "SELECT s FROM Staff s WHERE s.staffName LIKE :staffName")
    , @NamedQuery(name = "Staff.findAllByStaffIc", query = "SELECT s FROM Staff s WHERE s.staffIc LIKE :staffIc")
    , @NamedQuery(name = "Staff.findAllByStaffContactNo", query = "SELECT s FROM Staff s WHERE s.staffContactNo LIKE :staffContactNo")    
})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STAFF_ID")
    private String staffId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFF_NAME")
    private String staffName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "STAFF_IC")
    private String staffIc;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "STAFF_CONTACT_NO")
    private String staffContactNo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "STAFF_GENDER")
    private Character staffGender;

    public Staff() {
    }

    public Staff(String staffId) {
        this.staffId = staffId;
    }

    public Staff(String staffId, String staffName, String staffIc, String staffContactNo, Character staffGender) {
        this.staffId = staffId;
        this.staffName = staffName;
        this.staffIc = staffIc;
        this.staffContactNo = staffContactNo;
        this.staffGender = staffGender;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffIc() {
        return staffIc;
    }

    public void setStaffIc(String staffIc) {
        this.staffIc = staffIc;
    }

    public String getStaffContactNo() {
        return staffContactNo;
    }

    public void setStaffContactNo(String staffContactNo) {
        this.staffContactNo = staffContactNo;
    }

    public Character getStaffGender() {
        return staffGender;
    }

    public void setStaffGender(Character staffGender) {
        this.staffGender = staffGender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffId != null ? staffId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffId == null && other.staffId != null) || (this.staffId != null && !this.staffId.equals(other.staffId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Staff[ staffId=" + staffId + " ]";
    }
    
}
