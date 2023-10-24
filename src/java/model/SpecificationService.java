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
public class SpecificationService {
    @PersistenceContext EntityManager mgr;
    @Resource Query query;
    
    public SpecificationService(EntityManager mgr){
        this.mgr = mgr;
    }
    
    public List<Specification> findAll(){
        List specList = mgr.createNamedQuery("Specification.findAll").getResultList();
        return specList;
    }
}
