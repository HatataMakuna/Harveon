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
public class CartService {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    
    public CartService(EntityManager mgr) {
        this.mgr = mgr;
    }
    
     public boolean addItem(Cart cart) {
     mgr.persist(cart);
     return true;
    }
     
    public boolean updateItem(Cart cart) {
            mgr.merge(cart);
            return true;
    }
     
     public boolean deleteItem(Cart cart) {
     mgr.remove(cart);
     return true;
    }
     
     
     
   public List<Cart> findByUsername(String username) {
        List cartList = mgr.createNamedQuery("Cart.findByUsername").setParameter("username", username).getResultList();
        return cartList;
    }
   
public List<Cart> findAll() {
        List cartList = mgr.createNamedQuery("Cart.findAll").getResultList();
        return cartList;
    }

public List<Cart> findByUsernameAndProdID(String username,String prodID) {
        List cartList = mgr.createNamedQuery("Cart.findByUsernameAndProductID").setParameter("username",username).setParameter("productId", prodID).getResultList();
        return cartList;
    }

public List<Cart> findWithUsernameAndProdID(String username,String prodID) {
        List cartList =mgr.createNamedQuery("Cart.findByUsernameAndProductID").setParameter("username",username).setParameter("productId", prodID).getResultList();
        return cartList;
    }

}
