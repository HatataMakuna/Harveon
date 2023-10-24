package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.ProductSpecification;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(Specification.class)
public class Specification_ { 

    public static volatile SingularAttribute<Specification, String> specId;
    public static volatile SingularAttribute<Specification, String> specName;
    public static volatile ListAttribute<Specification, ProductSpecification> productSpecificationList;

}