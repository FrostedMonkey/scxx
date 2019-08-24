package com.yizu.scgcxx.dao.info;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.CustomerDto;
import com.yizu.scgcxx.model.Customer;

public interface CustomerDao {

    List<Customer> getCustomer(CustomerDto customerDto);

    int delById(Integer cusId);

    void deleteByIds(Integer[] ids);

    int addCus(Customer customer);

    int updateById(Customer customer);

    int updateCustomerStatus(CustomerDto customerDto);

    void updateCustomerStatusByIds(@Param("ids") Integer[] cus_ids, @Param("cus_status") String cus_status);

    List<Customer> customerQuery();
}
