package com.teksystems22.wandermaps.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration 
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true) 
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http
			.csrf().disable()
	        .authorizeRequests()
	        	// URLs that do not need authentication to view
	        	.antMatchers("/pub/**", "/user/**", "/", "/index", "/search, /contact").permitAll()
	        	// this line of code tells spring security all URLs can only be accessed if the user
	        	// is authenticated.  
				.anyRequest().authenticated()
	        	.and()
	        .formLogin()
	        	// URL to the login page
	        	// request method for this is implemented login controller to display login.jsp
	            .loginPage("/user/login")
	            // login page will submit to this URL with a action="/user/loginpost" method="POST"
	            // method is implemented by spring security just set method=post and action=this URL
	            .loginProcessingUrl("/user/loginpost")
	            // URL is where user will be sent IF they have not requested a secure URL
	            // if they requested a secure URL spring security will ignore this and user will be sent to URL requested
	            .defaultSuccessUrl("/", true)
	            .and()
	        .logout()
	            .invalidateHttpSession(true)
	            // this is the URL to log a user out
	            .logoutUrl("/user/logout")
	            // this is the URL to send the browser to after the user has logged out
	            .logoutSuccessUrl("/index");
		

	}
	
	@Bean(name="passwordEncoder")
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	


}
