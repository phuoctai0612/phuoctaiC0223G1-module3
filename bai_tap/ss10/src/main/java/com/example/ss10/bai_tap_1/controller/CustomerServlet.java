package com.example.ss10.bai_tap_1.controller;

import com.example.ss10.bai_tap_1.model.Customer;
import com.example.ss10.bai_tap_1.service.CustomerService;
import com.example.ss10.bai_tap_1.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "delete":
                request.getRequestDispatcher("ss10_jsp/bai_tap_1/table-customer.jsp").forward(request,response);
                break;
            case "edit":
                request.getRequestDispatcher("ss10_jsp/bai_tap_1/table-customer-edit.jsp").forward(request,response);
                break;
            default:
                List<Customer> list = customerService.display();
                request.setAttribute("list",list);
                request.getRequestDispatcher("ss10_jsp/bai_tap_1/danh-sach-khach-hang.jsp").forward(request,response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
