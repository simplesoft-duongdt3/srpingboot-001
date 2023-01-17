package com.tinyflutterteam.shorturlservice.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CreateShortUrlResponse {
    private String shortenUrl;
}
