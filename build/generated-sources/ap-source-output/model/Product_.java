package model;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cart;
import model.Customer;
import model.ProductSpecification;
import model.RatingComment;
import model.SubImage;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> mainImage;
    public static volatile SingularAttribute<Product, BigDecimal> price;
    public static volatile SingularAttribute<Product, String> prodName;
    public static volatile ListAttribute<Product, ProductSpecification> productSpecificationList;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile ListAttribute<Product, Customer> customerList;
    public static volatile ListAttribute<Product, RatingComment> ratingCommentList;
    public static volatile SingularAttribute<Product, String> prodId;
    public static volatile SingularAttribute<Product, Integer> stock;
    public static volatile ListAttribute<Product, SubImage> subImageList;
    public static volatile ListAttribute<Product, Cart> cartList;

}