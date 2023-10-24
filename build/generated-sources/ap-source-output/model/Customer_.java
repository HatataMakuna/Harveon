package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cart;
import model.OrderProduct;
import model.Product;
import model.RatingComment;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> gmail;
    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, Character> gender;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile SingularAttribute<Customer, String> ic;
    public static volatile ListAttribute<Customer, RatingComment> ratingCommentList;
    public static volatile ListAttribute<Customer, OrderProduct> orderProductList;
    public static volatile ListAttribute<Customer, Cart> cartList;
    public static volatile ListAttribute<Customer, Product> productList;
    public static volatile SingularAttribute<Customer, String> username;

}