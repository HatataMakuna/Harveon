/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author tzeha
 */
public class StaffService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public StaffService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addStaff(Staff staff) {
        mgr.persist(staff);
        return true;
    }

    public boolean updateStaff(Staff staff) {
        Staff staffDetails = findStaffById(staff.getStaffId());
        if (staffDetails != null) {
            staffDetails.setStaffName(staff.getStaffName());
            staffDetails.setStaffIc(staff.getStaffIc());
            staffDetails.setStaffContactNo(staff.getStaffContactNo());
            staffDetails.setStaffGender(staff.getStaffGender());
            return true;
        }
        return false;
    }

    public boolean deleteStaff(String staffId) {
        Staff staff = findStaffById(staffId);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;

    }

    public List<Staff> findAll() {
        List staffList = mgr.createNamedQuery("Staff.findAll").getResultList();
        return staffList;
    }

    public Staff findStaffById(String staffId) {
        Staff staff = mgr.find(Staff.class, staffId);
        return staff;
    }
    
     public List<Staff> findAllByStaffId(String staffId) {
        List staffList = mgr.createNamedQuery("Staff.findByStaffId").setParameter("staffId",  staffId).getResultList();
        return staffList;
    }
    
      public List<Staff> findAllByStaffName(String staffName) {
        List staffList = mgr.createNamedQuery("Staff.findAllByStaffName").setParameter("staffName", "%" + staffName + "%").getResultList();
        return staffList;
    }
      
        public List<Staff> findAllByStaffIc(String staffIc) {
        List staffList = mgr.createNamedQuery("Staff.findAllByStaffIc").setParameter("staffIc", "%" + staffIc + "%").getResultList();
        return staffList;
    }
        
          public List<Staff> findAllByStaffContactNo(String staffContactNo) {
        List staffList = mgr.createNamedQuery("Staff.findAllByStaffContactNo").setParameter("staffContactNo", "%" + staffContactNo + "%").getResultList();
        return staffList;
    }
          
            public List<Staff> findAllByStaffGender(Character staffGender) {
        List staffList = mgr.createNamedQuery("Staff.findByStaffGender").setParameter("staffGender", staffGender).getResultList();
        return staffList;
    }

}
