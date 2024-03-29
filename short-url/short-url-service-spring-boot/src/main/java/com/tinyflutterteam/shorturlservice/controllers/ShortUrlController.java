package com.tinyflutterteam.shorturlservice.controllers;

import com.tinyflutterteam.shorturlservice.HashUtil;
import com.tinyflutterteam.shorturlservice.exception.CreateShortUrlNotFound;
import com.tinyflutterteam.shorturlservice.exception.GetShortUrlNotFound;
import com.tinyflutterteam.shorturlservice.request.CreateShortUrlRequest;
import com.tinyflutterteam.shorturlservice.response.CreateShortUrlResponse;
import com.tinyflutterteam.shorturlservice.response.GetShortUrlResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

@RestController
//@RequestMapping("/api/short-url")
public class ShortUrlController {

     @Autowired
     private RedisTemplate<String, String> redisTemplate;

     @Autowired
     private HashUtil hashUtil;

    @PostMapping("/api/short-url/create")
    CreateShortUrlResponse createShortUrl(@RequestBody CreateShortUrlRequest request) {
         String rawUrl = request.getRawUrl();
         if (rawUrl != null && !rawUrl.isBlank()) {
             System.out.println("createShortUrl rawUrl = " + rawUrl);
             String shortenUrl = hashUtil.getMd5Hash(rawUrl);
             // TODO add timeout here
             redisTemplate.opsForValue().set(shortenUrl, rawUrl);
             return new CreateShortUrlResponse(shortenUrl);
         }

        throw new CreateShortUrlNotFound();
    }

    @GetMapping("/api/short-url/get-short-url")
    GetShortUrlResponse createShortUrl(@RequestParam("shorten-url") String shortenUrl) {
         if (shortenUrl != null && !shortenUrl.isBlank()) {
             String rawUrl = redisTemplate.opsForValue().get(shortenUrl);
             if (rawUrl != null && !rawUrl.isBlank()) {
                 return new GetShortUrlResponse(rawUrl);
             }
         }
        throw new GetShortUrlNotFound();
    }
}
