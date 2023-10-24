package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Product;
import model.ProductSpecificationPK;
import model.Specification;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-10T11:56:07")
@StaticMetamodel(ProductSpecification.class)
public class ProductSpecification_ { 

    public static volatile SingularAttribute<ProductSpecification, ProductSpecificationPK> productSpecificationPK;
    public static volatile SingularAttribute<ProductSpecification, Product> product;
    public static volatile SingularAttribute<ProductSpecification, String> specValue;
    public static volatile SingularAttribute<ProductSpecification, Specification> specification;

}