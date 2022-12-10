package com.duongdt.demo001.controllers;

import org.springframework.web.bind.annotation.*;


@RestController()
public class DemoController {

    @GetMapping("${demo.base_path}")
    public String helloGet() {
        return "Hello GET";
    }

    @PostMapping("${demo.base_path}")
    public String helloPost() {
        return "Hello POST";
    }

    @PutMapping("${demo.base_path}")
    public String helloPut() {
        return "Hello PUT";
    }

    @DeleteMapping("${demo.base_path}")
    public String helloDelete() {
        return "Hello DELETE";
    }

    @PatchMapping("${demo.base_path}")
    public String helloPatch() {
        return "Hello PATCH";
    }
}
