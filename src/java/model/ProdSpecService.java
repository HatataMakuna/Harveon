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
 * @author nocry
 */
public class ProdSpecService {
    @PersistenceContext EntityManager mgr;
    @Resource Query query;
    
    public ProdSpecService(EntityManager mgr){
        this.mgr = mgr;
    }
    
    public List<ProductSpecification> findAll(){
        List prodSpecList = mgr.createNamedQuery("ProductSpecification.findAll").getResultList();
        return prodSpecList;
    }
   
}
