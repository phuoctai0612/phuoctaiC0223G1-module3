package com.example.ss10.bai_tap_1.repository;

import com.example.ss10.bai_tap_1.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList=new ArrayList<>();
    static {
        customerList.add(new Customer("Tài","06-12-2001","Huế","https://th.bing.com/th/id/OIP.Cm3HHQy5YhSVkeMv7oCKfwHaLI?w=116&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"));
        customerList.add(new Customer("Quốc","06-12-2001","Huế","https://th.bing.com/th/id/OIP.Cm3HHQy5YhSVkeMv7oCKfwHaLI?w=116&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"));
        customerList.add(new Customer("Vũ","06-12-2001","Huế","https://th.bing.com/th/id/OIP.Cm3HHQy5YhSVkeMv7oCKfwHaLI?w=116&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"));
        customerList.add(new Customer("Thiện","06-12-2001","Huế","https://th.bing.com/th/id/OIP.Cm3HHQy5YhSVkeMv7oCKfwHaLI?w=116&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"));
        customerList.add(new Customer("Thành","06-12-2001","Huế","https://th.bing.com/th/id/OIP.Cm3HHQy5YhSVkeMv7oCKfwHaLI?w=116&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"));
    }
    @Override
    public List<Customer> display() {
        return customerList;
    }
}
