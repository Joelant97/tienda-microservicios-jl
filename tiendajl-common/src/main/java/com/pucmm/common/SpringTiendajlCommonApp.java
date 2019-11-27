package com.eureka.common;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;


@SpringBootApplication
@EnableEurekaClient
public class SpringTiendajlCommonApp {

	public static void main(String[] args) {
		SpringApplication.run(SpringTiendajlCommonApp.class, args);
	}
}
