package com.yizu.scgcxx.service.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.info.CustomerDao;
import com.yizu.scgcxx.dto.CustomerDto;
import com.yizu.scgcxx.model.Customer;
import com.yizu.scgcxx.service.info.CustomerService;

@Service //@CacheConfig(cacheNames="Customer")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override //@Cacheable
    public List<Customer> getCustomer(CustomerDto customerDto) {
        return customerDao.getCustomer(customerDto);
    }

    @Override //@CacheEvict(allEntries=true)
    public int delById(Integer id) {

        return customerDao.delById(id);
    }

    @Override //@CacheEvict(allEntries=true)
    public void deleteByIds(Integer[] ids) {
        customerDao.deleteByIds(ids);
    }

    @Override //@CacheEvict(allEntries=true)
    public int addCus(Customer customer) {

        return customerDao.addCus(customer);
    }

    @Override //@CacheEvict(allEntries=true)
    public int updateById(Customer customer) {

        return customerDao.updateById(customer);
    }


    @Override //@CacheEvict(allEntries=true)
    public int updateCustomerStatus(CustomerDto customerDto) {

        return customerDao.updateCustomerStatus(customerDto);
    }

    @Override //@CacheEvict(allEntries=true)
    public void updateCustomersStatus(Integer[] cus_ids, String cus_status) {

        customerDao.updateCustomerStatusByIds(cus_ids, cus_status);

    }

    @Override //@Cacheable
    public List<Customer> customerQuery() {

        return customerDao.customerQuery();
    }

}
