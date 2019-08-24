package com.yizu.scgcxx.service.info;

import java.util.List;

import com.yizu.scgcxx.dto.CustomerDto;
import com.yizu.scgcxx.model.Customer;

public interface CustomerService {
    int updateCustomerStatus(CustomerDto customerDto);

    List<Customer> getCustomer(CustomerDto customerDto);

    int delById(Integer id);

    void deleteByIds(Integer[] ids);

    int addCus(Customer customer);

    int updateById(Customer customer);

    void updateCustomersStatus(Integer[] cus_ids, String cus_status);

    List<Customer> customerQuery();
}
