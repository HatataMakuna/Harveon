package model;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CustomerService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CustomerService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Customer cus) {
        mgr.persist(cus);
        return true;
    }

    public Customer findItemByCode(String username) {
        Customer cus = mgr.find(Customer.class, username);
        return cus;
    }
    
    public Customer findByGmail(String gmail){
        Customer cus =mgr.find(Customer.class, gmail);
        return cus;
    }

    public boolean deleteItem(String username) {
        Customer cus = findItemByCode(username);
        if (cus != null) {
            mgr.remove(cus);
            return true;
        }
        return false;
    }

    public List<Customer> findAll() {
        List customerList = mgr.createNamedQuery("Customer.findAll").getResultList();
        return customerList;
    }
    
    public List<Customer> findAllByUsername(String username) {
        List customerList = mgr.createNamedQuery("Customer.findByUsername").setParameter("username", username ).getResultList();
        return customerList;
    }

    public List<Customer> findAllByPassword(String password) {
        List customerList = mgr.createNamedQuery("Customer.findByPassword").setParameter("password",  password ).getResultList();
        return customerList;
    }

    public List<Customer> findAllByName(String name) {
        List customerList = mgr.createNamedQuery("Customer.findByName").setParameter("name",  name ).getResultList();
        return customerList;
    }

    public List<Customer> findAllByGender(Character gender) {
        List customerList = mgr.createNamedQuery("Customer.findByGender").setParameter("gender", gender).getResultList();
        return customerList;
    }

    public List<Customer> findAllByIc(String ic) {
        List customerList = mgr.createNamedQuery("Customer.findByIc").setParameter("ic", ic ).getResultList();
        return customerList;
    }

    public List<Customer> findAllByPhone(String phone) {
        List customerList = mgr.createNamedQuery("Customer.findByPhone").setParameter("phone", phone).getResultList();
        return customerList;
    }

    public List<Customer> findAllByGmail(String gmail) {
        List customerList = mgr.createNamedQuery("Customer.findByGmail").setParameter("gmail", gmail).getResultList();
        return customerList;
    }

    public List<Customer> findAllByAddress(String address) {
        List customerList = mgr.createNamedQuery("Customer.findByAddress").setParameter("address", address ).getResultList();
        return customerList;
    }
    
    public boolean updateItem(Customer cus) {
            mgr.merge(cus);
            return true;
    }


    /*
    public boolean updateItem(Customer cus) {
        Customer tempCus = findItemByCode(cus.getCode());
        if (tempCus != null) {
            tempCus.setDescription(item.getDescription());
            tempCus.setPrice(item.getPrice());
            return true;
        }
        return false;
    }
*/
    
    public boolean updatePassword(Customer cus) {
            mgr.merge(cus);
            return true;
    }

}
