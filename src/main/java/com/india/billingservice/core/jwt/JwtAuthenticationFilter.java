/*
package com.india.billingservice.core.jwt;

import com.india.billingservice.model.User;
import com.india.billingservice.repository.UserRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.SignatureException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Value("${jwt.secret}")
    private String secretKey;

    @Autowired
    UserRepository userRepository;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            String jwt = extractJwtFromRequest(request);
            if (jwt != null) {
                Claims claims =
                        Jwts.parserBuilder()
                                .setSigningKey(secretKey).build()
                                .parseClaimsJws(jwt)
                                .getBody();
                if (validateToken(claims.getSubject())) {
                    Authentication authentication = new JwtAuthenticationToken(claims.getSubject());
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                } else {
                    filterChain.doFilter(request, response);
                    return;
                }
            }
        } catch (SignatureException e) {
            // Handle invalid token
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        filterChain.doFilter(request, response);
    }

    private String extractJwtFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    private boolean validateToken(String username) {
        User user = userRepository.findByUsername(username);
        return user != null;
    }
}
*/
