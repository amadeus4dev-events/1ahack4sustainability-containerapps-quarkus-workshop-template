package io.containerapps.quarkus.workshop.superheroes.villain;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class VillainResourceTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("/api/villains/hello")
          .then()
             .statusCode(200)
             .body(is("Hello from the Villains App !\n"));
    }

}
