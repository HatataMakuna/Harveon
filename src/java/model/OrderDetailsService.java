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
public class OrderDetailsService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderDetailsService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(OrderDetails orderDetails) {
        mgr.persist(orderDetails);
        return true;
    }

    public List<OrderDetails> findAll() {
        List orderList = mgr.createNamedQuery("OrderDetails.findAll").getResultList();
        return orderList;
    }

    public List<OrderDetails> findByProduct(String prodID) {
        List orderList = mgr.createNamedQuery("OrderDetails.findByProductId").setParameter("productId", prodID).getResultList();
        return orderList;
    }
    
        public List<OrderDetails> findByOrder(String orderID) {
        List orderList = mgr.createNamedQuery("OrderDetails.findByOrderId").setParameter("orderId", orderID).getResultList();
        return orderList;
    }
         public OrderDetails findByQuantity(String quantity) {
        OrderDetails od = mgr.find(OrderDetails.class, quantity);
        return od;
    }
    
      public List<OrderDetails> findAllByQuantity(Integer quantity) {
        List orderList = mgr.createNamedQuery("OrderDetails.findByQuantity").setParameter("quantity",  quantity ).getResultList();
        return orderList;
    }
      
      
    

}
