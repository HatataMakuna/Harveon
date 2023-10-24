package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.AdminRatingComment;
import model.Customer;
import model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(RatingComment.class)
public class RatingComment_ { 

    public static volatile SingularAttribute<RatingComment, Product> productId;
    public static volatile ListAttribute<RatingComment, AdminRatingComment> adminRatingCommentList;
    public static volatile SingularAttribute<RatingComment, Integer> rating;
    public static volatile SingularAttribute<RatingComment, String> comment;
    public static volatile SingularAttribute<RatingComment, String> ratingCommentId;
    public static volatile SingularAttribute<RatingComment, Customer> username;

}