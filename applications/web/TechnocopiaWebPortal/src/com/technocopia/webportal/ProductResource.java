package com.technocopia.webportal;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
 
@Path("products")
public class ProductResource {
 
    @GET
    @Produces("application/json")
    public Product getProduct() {
    Product product = new Product();
        product.setName("Nexus 7");
        product.setQuantity(999);
        return product;
    }
 
    @POST
    @Consumes("application/json")
    public Response createProduct(Product product) {
        String result = "Product created : " + product;
        return Response.status(201).entity(result).build();
    }
 
}