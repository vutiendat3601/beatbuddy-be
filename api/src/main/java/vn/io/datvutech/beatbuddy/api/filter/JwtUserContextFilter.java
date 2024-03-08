package vn.io.datvutech.beatbuddy.api.filter;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.io.datvutech.beatbuddy.api.util.UserContext;

public class JwtUserContextFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        Authentication authN = SecurityContextHolder.getContext().getAuthentication();
        if (authN != null && authN.isAuthenticated() && JwtAuthenticationToken.class.isInstance(authN)) {
            JwtAuthenticationToken jwtAuthenticationToken = (JwtAuthenticationToken) authN;
            Jwt jwt = jwtAuthenticationToken.getToken();
            String userId = jwt.getSubject();
            String email = jwt.getClaimAsString("email");
            String username = jwt.getClaimAsString("preferred_username");

            UserContext.setJwt(jwt);
            UserContext.setUserId(userId);
            UserContext.setEmail(email);
            UserContext.setUsername(username);
        }
        filterChain.doFilter(request, response);
    }

}
