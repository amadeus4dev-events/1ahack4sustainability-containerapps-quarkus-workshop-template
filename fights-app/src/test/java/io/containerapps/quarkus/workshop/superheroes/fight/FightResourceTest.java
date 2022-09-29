package io.containerapps.quarkus.workshop.superheroes.fight;

import io.quarkus.test.junit.QuarkusTest;
import org.hamcrest.CoreMatchers;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;

@QuarkusTest
public class FightResourceTest {

    @Test
    public void testGetAllFights() {
        given()
            .when().get("/api/fights")
            .then()
            .statusCode(200)
            .body(CoreMatchers.is("[]"));
    }
}
