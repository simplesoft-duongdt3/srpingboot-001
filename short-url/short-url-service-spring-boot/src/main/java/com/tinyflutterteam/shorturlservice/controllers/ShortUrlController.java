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
public class ShortUrlController {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Autowired
    private HashUtil hashUtil;

    @PostMapping("/create-short-url")
    CreateShortUrlResponse createShortUrl(@RequestBody CreateShortUrlRequest request) {
        String rawUrl = request.getRawUrl();
        if (rawUrl != null && !rawUrl.isBlank()) {
            String md5Hash = hashUtil.getMd5Hash(rawUrl);
            // TODO add timeout here
            redisTemplate.opsForValue().set(md5Hash, rawUrl);
        }

        throw new CreateShortUrlNotFound();
    }

    @GetMapping("/get-short-url")
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
