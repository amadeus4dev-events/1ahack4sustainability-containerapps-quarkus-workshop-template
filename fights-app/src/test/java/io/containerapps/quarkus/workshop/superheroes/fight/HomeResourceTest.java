package io.containerapps.quarkus.workshop.superheroes.fight;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class HomeResourceTest {

    @Test
    public void testHomeEndpoint() {
        given()
          .when().get("/")
          .then()
             .statusCode(200)
             .body(is( HomeResource.TEST_MSG   ));
    }

}