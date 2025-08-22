package com.example.payments;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class PaymentTests {
  @LocalServerPort int port;

  @Test
  void healthUp() {
    RestTemplate rt = new RestTemplate();
    var resp = rt.getForEntity("http://localhost:"+port+"/health", String.class);
    assertEquals(HttpStatus.OK, resp.getStatusCode());
    assertTrue(resp.getBody().contains("UP"));
  }
}
