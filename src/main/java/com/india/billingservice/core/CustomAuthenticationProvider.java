/*
package com.india.billingservice.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.persistence.NoResultException;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    CustomUserDetailService customUserDetailService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().matches("$2a$10$ncS7AEsPD9EPuV5fwfE6NuBQWp8Akj1GSW1Z1YHLBaB9qewKZJcsa", "$2a$10$ncS7AEsPD9EPuV5fwfE6NuBQWp8Akj1GSW1Z1YHLBaB9qewKZJcsa"));
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String checksum = authentication.getCredentials().toString();
        UserDetails user = customUserDetailService.loadUserByUsername(username);
        if (user == null) {
            throw new NoResultException("Authentication failed");
        }
        if (passwordEncoder.matches(checksum, user.getPassword())) {
            return new UsernamePasswordAuthenticationToken(user, checksum, user.getAuthorities());
        } else {
            throw new NoResultException("Authentication failed");
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}

*/
