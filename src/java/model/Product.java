/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author nocry
 */
@Entity
@Table(name = "PRODUCT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findAllByKeyword", query = "SELECT p FROM Product p WHERE p.prodName LIKE :keyword")
    , @NamedQuery(name = "Product.findByProdId", query = "SELECT p FROM Product p WHERE p.prodId = :prodId")
    , @NamedQuery(name = "Product.findByProdName", query = "SELECT p FROM Product p WHERE p.prodName = :prodName")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByDescription", query = "SELECT p FROM Product p WHERE p.description = :description")
    , @NamedQuery(name = "Product.findByMainImage", query = "SELECT p FROM Product p WHERE p.mainImage = :mainImage")
    , @NamedQuery(name = "Product.findByStock", query = "SELECT p FROM Product p WHERE p.stock = :stock")})
public class Product implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "prodId")
    private List<SubImage> subImageList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private List<RatingComment> ratingCommentList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<Cart> cartList;

    @ManyToMany(mappedBy = "productList")
    private List<Customer> customerList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "PROD_ID")
    private String prodId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PROD_NAME")
    private String prodName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private BigDecimal price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "MAIN_IMAGE")
    private String mainImage;
    @Basic(optional = false)
    @NotNull
    @Column(name = "STOCK")
    private int stock;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<ProductSpecification> productSpecificationList;

    public Product() {
    }

    public Product(String prodId) {
        this.prodId = prodId;
    }

    public Product(String prodId, String prodName, BigDecimal price, String description, String mainImage, int stock) {
        this.prodId = prodId;
        this.prodName = prodName;
        this.price = price;
        this.description = description;
        this.mainImage = mainImage;
        this.stock = stock;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @XmlTransient
    public List<ProductSpecification> getProductSpecificationList() {
        return productSpecificationList;
    }

    public void setProductSpecificationList(List<ProductSpecification> productSpecificationList) {
        this.productSpecificationList = productSpecificationList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (prodId != null ? prodId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.prodId == null && other.prodId != null) || (this.prodId != null && !this.prodId.equals(other.prodId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Product[ prodId=" + prodId + " ]";
    }

    @XmlTransient
    public List<Customer> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }

    @XmlTransient
    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

    @XmlTransient
    public List<RatingComment> getRatingCommentList() {
        return ratingCommentList;
    }

    public void setRatingCommentList(List<RatingComment> ratingCommentList) {
        this.ratingCommentList = ratingCommentList;
    }

    @XmlTransient
    public List<SubImage> getSubImageList() {
        return subImageList;
    }

    public void setSubImageList(List<SubImage> subImageList) {
        this.subImageList = subImageList;
    }
    
}
