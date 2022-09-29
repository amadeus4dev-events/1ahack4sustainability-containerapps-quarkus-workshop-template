package io.containerapps.quarkus.workshop.superheroes.fight;

import io.containerapps.quarkus.workshop.superheroes.fight.client.Hero;
import io.containerapps.quarkus.workshop.superheroes.fight.client.Villain;
import io.smallrye.common.constraint.NotNull;
import javax.validation.Valid;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

/**
 * Entity class representing Fighters
 */
@Schema(description = "A pair of a Hero and a Villain")
public class Fighters {

    @NotNull
    @Valid
    public Hero hero;

    @NotNull
    @Valid
    public Villain villain;

}
