package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Payment;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(OrderProduct.class)
public class OrderProduct_ { 

    public static volatile SingularAttribute<OrderProduct, String> orderId;
    public static volatile SingularAttribute<OrderProduct, Double> totalPrice;
    public static volatile SingularAttribute<OrderProduct, Payment> paymentId;
    public static volatile SingularAttribute<OrderProduct, Date> orderDate;
    public static volatile SingularAttribute<OrderProduct, String> status;
    public static volatile SingularAttribute<OrderProduct, Customer> username;

}