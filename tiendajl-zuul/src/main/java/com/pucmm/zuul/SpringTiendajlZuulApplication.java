package com.pucmm.zuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableEurekaClient 	// Enable eureka client
@EnableZuulProxy		// Enable Zuul
public class SpringTiendajlZuulApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringTiendajlZuulApplication.class, args);
	}
}