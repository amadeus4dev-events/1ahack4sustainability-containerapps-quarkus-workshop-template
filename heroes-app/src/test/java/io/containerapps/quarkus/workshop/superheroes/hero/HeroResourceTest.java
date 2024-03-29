package io.containerapps.quarkus.workshop.superheroes.hero;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class HeroResourceTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("/api/heroes/hello")
          .then()
             .statusCode(200)
             .body(is("Hello from the Heroes App !\n"));
    }

}
