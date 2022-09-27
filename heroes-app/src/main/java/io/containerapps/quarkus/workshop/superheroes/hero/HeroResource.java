package io.containerapps.quarkus.workshop.superheroes.hero;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/heroes")
public class HeroResource {

    @GET
    @Path("/hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from the Heroes App !\n";
    }

    @GET
    @Path("/random")
    public Response getRandomHero() {
        Hero hero = Hero.findRandom();
        return Response.ok(hero).build();
    }
}
