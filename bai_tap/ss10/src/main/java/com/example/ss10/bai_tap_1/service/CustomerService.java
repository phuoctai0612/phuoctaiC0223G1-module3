package com.example.ss10.bai_tap_1.service;

import com.example.ss10.bai_tap_1.model.Customer;
import com.example.ss10.bai_tap_1.repository.CustomerRepository;
import com.example.ss10.bai_tap_1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository customerRepository=new CustomerRepository();
    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
