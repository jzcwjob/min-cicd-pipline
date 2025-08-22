package com.example.payments;

import jakarta.validation.constraints.*;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;

import java.util.Map;

@RestController
@Validated
@RequestMapping("/payments")
public class PaymentController {
  private static final Logger log = LoggerFactory.getLogger(PaymentController.class);

  public static record PaymentRequest(
      @NotNull @Positive Double amount,
      @NotBlank String currency,
      @NotBlank @Size(min=12, max=19) String cardNumber,
      @NotBlank @Size(min=3, max=4) String cvv) {}

  @PostMapping
  public Map<String, Object> pay(@RequestBody @Validated PaymentRequest req) {
    // 脱敏日志（仅保留后4位）
    String masked = "**** **** **** " + req.cardNumber().substring(Math.max(0, req.cardNumber().length()-4));
    log.info("Processing payment {} {} with card {}", req.amount(), req.currency(), masked);

    // 这里仅演示：真实支付不会在日志或响应中返回敏感信息
    return Map.of("status", "ACCEPTED", "last4", masked.substring(masked.length()-4));
  }
}
