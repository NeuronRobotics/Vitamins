package com.technocopia.webportal;

import java.io.IOException;

import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class TechnocopiaWebPortalServlet extends HttpServlet {
	static {
		 ObjectifyService.register(Car.class);
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Car f = new Car("11223344", 5);
		ofy().save().entity(f);
		
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
}
