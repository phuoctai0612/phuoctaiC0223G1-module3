package com.example.ss9;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TuDienServlet", value = "/TuDienServlet")
public class TuDienServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("tu_dien/tu_dien.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> stringMap = new HashMap<>();
        stringMap.put("datadifinationlanguage", "ngôn ngữ định nghĩa dữ liệu");
        stringMap.put("dataminipulation", "ngôn ngữ thao tác dữ liệu");
        stringMap.put("datacontrollanguage", "ngôn ngữ điều khiển dữ liệu");
        stringMap.put("transactioncontrollanguage", "ngôn ngữ điều khiển giao dịch");
        String search = request.getParameter("txtSearch");
        String result =stringMap.get(search);
        if (result!=null){
            request.setAttribute("ketqua1", result);
            RequestDispatcher r=request.getRequestDispatcher("tu_dien/ket_qua.jsp");
            r.forward(request,response);
        }else {
            request.setAttribute("ketqua1","Không tìm thấy");
            RequestDispatcher r=request.getRequestDispatcher("tu_dien/ket_qua.jsp");
            r.forward(request,response);
        }
    }
}
