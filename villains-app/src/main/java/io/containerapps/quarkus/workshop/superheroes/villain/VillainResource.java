package io.containerapps.quarkus.workshop.superheroes.villain;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/villains")
public class VillainResource {

    @GET
    @Path("/hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from the Villains App !\n";
    }

    @GET
    @Path("/random")
    public Response getRandomVillain() {
        Villain villain = Villain.findRandom();
        return Response.ok(villain).build();
    }
}
