/*
package com.india.billingservice.core;

import com.india.billingservice.model.User;
import com.india.billingservice.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import java.util.Collections;

@Service
@Slf4j
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("Inside loadUserByUsername with username: {}", username);
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new NoResultException();
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getChecksum(),
                Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")));
    }
}
*/
