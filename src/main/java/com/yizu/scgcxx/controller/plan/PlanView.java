package com.yizu.scgcxx.controller.plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yizu.scgcxx.model.Color;
import com.yizu.scgcxx.model.Customer;
import com.yizu.scgcxx.model.Plan;
import com.yizu.scgcxx.model.Standard;
import com.yizu.scgcxx.service.info.ColorService;
import com.yizu.scgcxx.service.info.CustomerService;
import com.yizu.scgcxx.service.info.StandardService;
import com.yizu.scgcxx.service.plan.ManagerService;

@Controller
@RequestMapping("/plan")
public class PlanView {
    @Autowired
    private StandardService standardService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/manager_to")
    public String toPlan(Model model) {
        List<Standard> standards = standardService.standardQuery();
        List<Color> colors = colorService.colorQuery();
        List<Customer> customers = customerService.customerQuery();
        model.addAttribute("standard", standards);
        model.addAttribute("color", colors);
        model.addAttribute("customer", customers);
        return "/plan/manager";
    }

    @RequestMapping("/manager_add")
    public String getManagerAdd(Model model) {
        List<Standard> standards = standardService.standardQuery();
        List<Color> colors = colorService.colorQuery();
        List<Customer> customers = customerService.customerQuery();
        model.addAttribute("standard", standards);
        model.addAttribute("color", colors);
        model.addAttribute("customer", customers);
        return "plan/manager_add";
    }

    @RequestMapping(value = "/manager_update/{planId}", method = RequestMethod.GET)
    public String getManagerUpdate(@PathVariable Integer planId, Model model) {
        List<Standard> standards = standardService.standardQuery();
        List<Color> colors = colorService.colorQuery();
        List<Customer> customers = customerService.customerQuery();
        Plan plan = managerService.queryById(planId);
        model.addAttribute("standard", standards);
        model.addAttribute("color", colors);
        model.addAttribute("customer", customers);
        model.addAttribute("plan", plan);
        return "/plan/manager_update";
    }
}
