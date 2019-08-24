package com.yizu.scgcxx.controller.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.CustomerDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Customer;
import com.yizu.scgcxx.service.info.CustomerService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/info")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/customer_do", method = RequestMethod.GET)
    public LauiData doQueryAll(CustomerDto customerDto) {
        PageHelper.startPage(customerDto.getPage(), customerDto.getLimit());
        List<Customer> customers = customerService.getCustomer(customerDto);
        PageInfo pageInfo = new PageInfo(customers, 5);
        return LauiData.SETDATA(0, "查到", new Long(pageInfo.getTotal()).intValue(), customers, pageInfo);
    }

    @RequestMapping(value = "/customer_do/{customerId}", method = RequestMethod.DELETE)
    public ResultDto doDelById(@PathVariable("customerId") Integer customerId) {
        System.out.println("-----------------------" + customerId);
        int i = customerService.delById(customerId);
        if (i > 0) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/customer_do", method = RequestMethod.DELETE)
    public ResultDto doDelByIds(@RequestBody Integer[] ids) {
        try {
            customerService.deleteByIds(ids);
            return ResultDto.succeedResult("删除成功");
        } catch (Exception e) {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/customer_do", method = RequestMethod.POST)
    public ResultDto doAddCus(Customer customer) {
        int i = customerService.addCus(customer);
        if (i > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    @RequestMapping(value = "/customer_do", method = RequestMethod.PUT)
    public ResultDto doUpdateById(@RequestBody Customer customer) {
        int i = customerService.updateById(customer);
        if (i > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }

    @RequestMapping(value = "/customer_do/status/{cusId}/{cusStatus}", method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@PathVariable Integer cusId, @PathVariable String cusStatus) {
        CustomerDto customerDto = new CustomerDto();
        customerDto.setCus_id(cusId);
        customerDto.setCus_status(cusStatus);
        int i = customerService.updateCustomerStatus(customerDto);
        if (i > 0) {
            return ResultDto.succeedResult("客户信息状态更新成功");
        } else {
            return ResultDto.failResult("客户信息状态更新失败");
        }
    }

    @RequestMapping(value = "/customer_do/status/{cus_status}", method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@RequestBody Integer[] cus_ids, @PathVariable String cus_status) {
        for (int i = 0; i < cus_ids.length; i++) {
            System.out.print(cus_ids);
        }
        customerService.updateCustomersStatus(cus_ids, cus_status);
        return ResultDto.succeedResult("批量状态修改成功");
    }

}
