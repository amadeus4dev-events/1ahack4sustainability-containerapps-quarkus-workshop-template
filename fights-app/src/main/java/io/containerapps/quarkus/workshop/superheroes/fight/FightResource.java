package io.containerapps.quarkus.workshop.superheroes.fight;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;
import org.jboss.logging.Logger;

import java.util.List;

@Path("/api/fights")
@Tag(name = "fight")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
public class FightResource {
    Logger logger;

    FightService service;

    @Inject
    public FightResource(FightService service, Logger logger) {
        this.service = service;
        this.logger = logger;
    }

    @GET
    @Path("/fighters")
    public Response getRandomFighters() {
        logger.info("Get two random fighters");
        Fighters fighters = service.findRandomFighters();
        logger.debug("Found two random fighters : " + fighters);
        return Response.ok(fighters).build();
    }

    @GET
    public Response getAllFights() {
        logger.info("Get all the fights");
        List<Fight> fights = service.findAllFights();
        logger.debug("Total number of fights : " + fights.size());
        return Response.ok(fights).build();
    }

    @POST
    public Fight fight(@Valid Fighters fighters) {
        logger.info("Fight");
        logger.debug("Fight between : " + fighters);
        return service.fight(fighters);
    }
}
