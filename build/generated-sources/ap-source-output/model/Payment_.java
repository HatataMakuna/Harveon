package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OrderProduct;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, String> paymentId;
    public static volatile SingularAttribute<Payment, String> ewalletNumber;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile ListAttribute<Payment, OrderProduct> orderProductList;
    public static volatile SingularAttribute<Payment, String> cardNumber;

}