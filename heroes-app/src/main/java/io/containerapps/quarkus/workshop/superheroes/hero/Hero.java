package io.containerapps.quarkus.workshop.superheroes.hero;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

@Schema(description = "The hero fighting against the villain")
public class Hero {

    public String name;

    public String otherName;

    public int level;

    public String picture;

    public String powers;
}
