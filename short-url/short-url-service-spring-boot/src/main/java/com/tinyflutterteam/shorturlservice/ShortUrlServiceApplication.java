package com.tinyflutterteam.shorturlservice;

import org.springframework.context.annotation.Bean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ShortUrlServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShortUrlServiceApplication.class, args);
	}

	@Bean
	public HashUtil hashUtil() {
		return new HashUtil();
	}
}
