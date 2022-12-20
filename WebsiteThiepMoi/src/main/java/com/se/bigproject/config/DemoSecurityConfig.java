package com.se.bigproject.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    // add a reference to our security data source
    @Autowired
    private DataSource securityDataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        // use jdbc authentication ... oh yeah!!!
        auth.jdbcAuthentication().dataSource(securityDataSource);

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.addFilterBefore(new EncodingFilter(), ChannelProcessingFilter.class);
        http.authorizeRequests()
        .antMatchers("/resources/css/**").permitAll()
        .antMatchers("/resources/bootstrap/**").permitAll()
        .antMatchers("/resources/jquery/**").permitAll()
        .antMatchers("/resources/fonts/**").permitAll()
        .antMatchers("/resources/img/**").permitAll()
        .antMatchers("/register/showMyRegisterPage*").permitAll()
        .antMatchers("/product/showPageProductManage").hasRole("NV")
        .antMatchers("/product/showFormForAdd").hasRole("NV")
        .antMatchers("/product/showFormForUpdate").hasRole("NV")
        .antMatchers("//product/showPayment*").hasAnyRole("NV","KH")
        .antMatchers("/invoice/showPageInvoiceManage").hasRole("NV")
        .antMatchers("/invoice/showPageInvoiceCustomer*").hasAnyRole("NV","KH")
        .antMatchers("/resources/**").permitAll()
        .antMatchers("/").permitAll()
        //.anyRequest().authenticated()
        .and()
        .formLogin()
        .loginPage("/showMyLoginPage")
        .loginProcessingUrl("/authenticateTheUser")
        .permitAll()
        .and()
        .logout().permitAll()
        .and()
        .exceptionHandling().accessDeniedPage("/access-denied");
    }

    @Bean
    public UserDetailsManager userDetailsManager() {

        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();

        jdbcUserDetailsManager.setDataSource(securityDataSource);

        return jdbcUserDetailsManager;
    }

}
