
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class ShowOrderHistoryService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ShowOrderHistoryService(EntityManager mgr) {
        this.mgr = mgr;
    }
    
    public List<OrderProduct> findAllOrderProduct() {
        List OrderProductList = mgr.createNamedQuery("OrderProduct.findAll").getResultList();
        return OrderProductList;
    }

    public List<Payment> findAllPayment() {
        List PaymentList = mgr.createNamedQuery("Payment.findAll").getResultList();
        return PaymentList;
    }
    
    public List<Product> findAllProduct() {
        List ProductList = mgr.createNamedQuery("Product.findAll").getResultList();
        return ProductList;
    }
    
    public List<OrderDetails> findAllOrderDetails() {
        List OrderDetailsList = mgr.createNamedQuery("OrderDetails.findAll").getResultList();
        return OrderDetailsList;
    }
    
    public List<Customer> findAllCustomer() {
        List CustomerList = mgr.createNamedQuery("Customer.findAll").getResultList();
        return CustomerList;
    }
    
}
