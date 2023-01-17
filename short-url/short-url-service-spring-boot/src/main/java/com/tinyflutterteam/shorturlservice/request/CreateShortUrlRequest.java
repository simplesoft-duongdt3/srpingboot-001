package com.tinyflutterteam.shorturlservice.request;

import lombok.Data;

@Data
public class CreateShortUrlRequest {
    private String rawUrl;
}
