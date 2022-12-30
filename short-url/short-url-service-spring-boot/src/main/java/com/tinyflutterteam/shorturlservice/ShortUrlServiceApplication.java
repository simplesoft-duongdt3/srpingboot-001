package com.tinyflutterteam.shorturlservice;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@EnableConfigurationProperties -> check it
public class ShortUrlServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShortUrlServiceApplication.class, args);
	}

	@Bean
	public HashUtil hashUtil() {
		return new HashUtil();
	}
}
