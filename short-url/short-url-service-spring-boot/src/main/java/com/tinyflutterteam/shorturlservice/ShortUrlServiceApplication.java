package com.tinyflutterteam.shorturlservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootApplication
public class ShortUrlServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShortUrlServiceApplication.class, args);
	}

	@Bean
	public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory connectionFactory) {
		RedisTemplate<String, String> template = new RedisTemplate<>();
		template.setConnectionFactory(connectionFactory);
		// Add some specific configuration here. Key serializers, etc.
		return template;
	}
	@Bean
	public HashUtil hashUtil() {
		return new HashUtil();
	}
}
