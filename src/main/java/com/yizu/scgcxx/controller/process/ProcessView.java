package com.yizu.scgcxx.controller.process;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.yizu.scgcxx.model.Process;

@Controller
@RequestMapping("/process")
public class ProcessView {
    @RequestMapping("/rawcloth_to")
    public String toRawcloth() {
        return "/process/rawcloth";
    }

    @RequestMapping("/rawcloth_add")
    public String toRawclothAdd() {
        return "/process/rawcloth_add";
    }

    @RequestMapping(value = "/grouping_to", method = RequestMethod.POST)
    public String toGroup(Process process, Model model) {
        model.addAttribute("message", process);
        return "/process/rawcloth_group";
    }

    @RequestMapping(value = "/pretreatment_to")
    public String toPretreatment() {
        return "/process/pretreatment";
    }

    @RequestMapping("/dye_to")
    public String dyeTo() {
        return "process/m_dye";
    }

    @RequestMapping(value = "/print_to", method = RequestMethod.GET)
    public String toPrint() {
        return "process/myprint";
    }

    @RequestMapping("/arrange_to")
    public String toArrange() {
        return "process/arrange";
    }

    @RequestMapping("/check_to")
    public String toCheck() {
        return "process/check";
    }

    @RequestMapping("/pkg_to")
    public String toPkg() {
        return "process/pkg";
    }

    @RequestMapping("out_to")
    public String toOut() {
        return "process/out";
    }

    @RequestMapping("/store_to")
    public String toStore() {
        return "/process/mstore";
    }
}
