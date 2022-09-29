package io.containerapps.quarkus.workshop.superheroes.fight.client;

import javax.validation.constraints.NotNull;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

/**
 * POJO representing a Hero response from the Hero service
 */
@Schema(description = "The hero fighting against the villain")
public class Hero {

    @NotNull
    public String name;

    @NotNull
    public int level;

    @NotNull
    public String picture;

    public String powers;

}
