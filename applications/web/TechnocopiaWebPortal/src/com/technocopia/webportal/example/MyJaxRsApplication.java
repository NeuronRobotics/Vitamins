package com.technocopia.webportal.example;



import org.restlet.Context;
import org.restlet.ext.jaxrs.JaxRsApplication;

public class MyJaxRsApplication extends JaxRsApplication {

   public MyJaxRsApplication(Context context) {
       super(context);
       this.add(new ExampleApplication());
   }

}
