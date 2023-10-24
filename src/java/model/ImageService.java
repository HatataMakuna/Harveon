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
import javax.transaction.UserTransaction;

/**
 *
 * @author nocry
 */
public class ImageService {
    @PersistenceContext EntityManager mgr;
    @Resource UserTransaction utx;
    @Resource Query query;
    
    public ImageService(EntityManager mgr){
        this.mgr = mgr;
    }
    
    public boolean addImage(SubImage image) {
        mgr.persist(image);
        return true;
    }
    
    
    public boolean deleteImage(SubImage image){
        mgr.remove(image);
        return true;
    }
    
    public List<SubImage> findAll(){
        List  imageList = mgr.createNamedQuery("SubImage.findAll").getResultList();
        return imageList;
    }
    
    public List<SubImage> findTotal(){
        List  imageList = mgr.createNamedQuery("SubImage.findTotalImage").getResultList();
        return imageList;
    }
    
}
