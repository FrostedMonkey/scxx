package com.yizu.scgcxx.controller.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoView {

    @RequestMapping("color_to")
    public String toColor() {
        return "info/color_to";
    }

    @RequestMapping("/standard_to")
    public String toStandard() {
        return "/info/standard";
    }

    @RequestMapping("/customer_to")
    public String tocustomer() {
        return "/info/customer_to2";
    }
}
