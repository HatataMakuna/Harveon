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
import javax.transaction.Transactional;
import javax.transaction.UserTransaction;

/**
 *
 * @author nocry
 */

public class ProductService {
    @PersistenceContext EntityManager mgr;
    @Resource UserTransaction utx;
    @Resource Query query;
    
    public ProductService(EntityManager mgr){
        this.mgr = mgr;
    }
    
    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }
    
    public boolean updateProduct(Product product) {
        mgr.merge(product);
        return true;
    }
    
    public boolean deleteProduct(Product product){
        mgr.remove(product);
        return true;
    }
    
    public List<Product> findAll(){
        List productList = mgr.createNamedQuery("Product.findAll").getResultList();
        return productList;
    }
    
    public List<Product> filter(String query){
        List productList = mgr.createNamedQuery(query).getResultList();
        return productList;
    }
    
    public Product findProductById(String id){
        
        Product product = mgr.find(Product.class, id);
        return product;
    }
    
    public List<Product> findAllByKeyword(String keyword){
        
        List productList = mgr.createNamedQuery("Product.findAllByKeyword").setParameter("keyword", "%" + keyword + "%").getResultList();
        return productList;
    }
    
    public List<Product> findAllByProductName(String prodName) {

        List productList = mgr.createNamedQuery("Product.findByProdName").setParameter("prodName", prodName).getResultList();
        return productList;
    }

    public List<Product> findAllByProductId(String prodId) {

        List productList = mgr.createNamedQuery("Product.findByProdId").setParameter("prodId", prodId).getResultList();
        return productList;
    }

    public List<Product> findAllByProductPrice(Double price) {

        List productList = mgr.createNamedQuery("Product.findByPrice").setParameter("price", price).getResultList();
        return productList;
    }

    public List<Product> findAllByProductStock(Integer stock) {

        List productList = mgr.createNamedQuery("Product.findByStock").setParameter("stock", stock).getResultList();
        return productList;
    }
    
    
    
}
