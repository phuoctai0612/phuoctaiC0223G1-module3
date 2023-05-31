package com.example.ss10.bai_tap_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MayTinhServlet", value = "/may-tinh-servlet")
public class MayTinhServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num1 = null;
        String num2=null;
        String dau;
        num1 = request.getParameter("num1");
        num2 = request.getParameter("num2");


            dau = request.getParameter("pheptinh");
            double ketqua=0;
            switch (dau){
                case "cong":
                    ketqua=Double.parseDouble(num1)+Double.parseDouble(num2);
                    break;
                case "tru":
                    ketqua=Double.parseDouble(num1)-Double.parseDouble(num2);
                    break;
                case"nhan":
                    ketqua=Double.parseDouble(num1)*Double.parseDouble(num2);
                    break;
                case "chia":
                    ketqua=Double.parseDouble(num1)/Double.parseDouble(num2);
                    break;
            }
            request.setAttribute("ketQua",ketqua);
            request.getRequestDispatcher("ss10_jsp/bai_tap_2/ket-qua.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
