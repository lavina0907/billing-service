/*
package com.india.billingservice.core.jwt;

import io.jsonwebtoken.Jwts;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Date;

@Component
public class JwtTokenProvider {
    @Value("${jwt.secret}")
    private String secretKey; // Store the secret key in application.properties

    public String generateToken(String username) {
        Date now = new Date();
        Date expirationDate = new Date(now.getTime() + 36000000); // Token expiration in 1 hour
        Key key = new SecretKeySpec(secretKey.getBytes(), "HmacSHA512");
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(now)
                .setExpiration(expirationDate)
                .signWith(key)
                .compact();
    }
}

*/
