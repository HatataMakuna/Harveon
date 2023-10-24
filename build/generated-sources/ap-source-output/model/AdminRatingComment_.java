package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.RatingComment;
import model.Staff;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(AdminRatingComment.class)
public class AdminRatingComment_ { 

    public static volatile SingularAttribute<AdminRatingComment, String> comment;
    public static volatile SingularAttribute<AdminRatingComment, String> id;
    public static volatile SingularAttribute<AdminRatingComment, RatingComment> ratingCommentId;
    public static volatile SingularAttribute<AdminRatingComment, Staff> staffId;

}