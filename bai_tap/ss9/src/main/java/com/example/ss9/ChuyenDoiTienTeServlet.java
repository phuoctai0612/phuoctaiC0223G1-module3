package com.example.ss9;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChuyenDoiTienTeServlet2", value = "/ChuyenDoiTienTeServlet")
public class ChuyenDoiTienTeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.getRequestDispatcher("chuyen_doi_tien_te/trang_chu_product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        float tigia = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));
        float vnd=tigia*usd;
        request.setAttribute("ketqua",vnd);
        RequestDispatcher r=request.getRequestDispatcher("chuyen_doi_tien_te/trang_ket_qua.jsp");
        r.forward(request,response);
    }
}
