package io.containerapps.quarkus.workshop.superheroes.villain;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/")
public class HomeResource {

    public final static String TEST_MSG = "App is running";

    @GET
    @Path("/")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return TEST_MSG;
    }
}
