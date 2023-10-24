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
public class OrderProductService {
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderProductService(EntityManager mgr) {
        this.mgr = mgr;
    }
    
     public List<OrderProduct> findAll() {
        List orderList = mgr.createNamedQuery("OrderProduct.findAll").getResultList();
        return orderList;
    }
     
      public boolean addItem(OrderProduct orderProduct) {
        mgr.persist(orderProduct);
        return true;
    }
      
    public OrderProduct findByID(String orderID) {
        OrderProduct orderProduct = mgr.find(OrderProduct.class, orderID);
        return orderProduct;
    }
    
    public List<OrderProduct> findAllByID(String orderID) {
        List orderProduct = mgr.createNamedQuery("OrderProduct.findByOrderId").setParameter("orderId", orderID).getResultList();
        return orderProduct;
    }


   public List<OrderProduct> findAllByStatus(String status) {
        List orderProduct = mgr.createNamedQuery("OrderProduct.findByStatus").setParameter("status", status).getResultList();
        return orderProduct;
    }

    
    public boolean updateStatus(OrderProduct os) {
        OrderProduct tempCus = findByID(os.getOrderId());
        if (tempCus != null) {
            tempCus.setStatus(os.getStatus());
            mgr.merge(tempCus);
            return true;
        }
        return false;
    }
}
    

