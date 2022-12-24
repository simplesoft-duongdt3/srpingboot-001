package com.tinyflutterteam.shorturlservice.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "Get Short Url Not Found")
public class GetShortUrlNotFound extends RuntimeException {
}
