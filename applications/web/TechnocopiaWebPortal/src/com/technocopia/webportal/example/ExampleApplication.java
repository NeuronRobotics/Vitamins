package com.technocopia.webportal.example;

import java.util.HashSet;
import java.util.Set;
 
import javax.ws.rs.core.Application;
 
public class ExampleApplication extends Application {
 
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<Class<?>>();
            classes.add(ProductResource.class);
            return classes;
    }
 
}