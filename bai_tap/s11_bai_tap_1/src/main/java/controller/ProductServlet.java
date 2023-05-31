package controller;

import model.Product;
import service.IProductService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "themMoi":
                themMoiProduct(request, response);
                break;
            case "xoaDanhSach":
                int id = Integer.parseInt(request.getParameter("id"));
                iProductService.xoaProduct(id);
                response.sendRedirect("/product-servlet");
                break;
            case "suaDanhSach":
                suaProduct(request, response);
                break;
            case "timTenSanPham":
                timTenSanPham(request, response);
            default:
                List<Product> list = iProductService.display();
                request.setAttribute("list", list);
                RequestDispatcher dispatcher = request.getRequestDispatcher("hien-thi-danh-sach.jsp");
                dispatcher.forward(request, response);
        }
    }

    private void timTenSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher2 = request.getRequestDispatcher("tim-san-pham-chi-tiet.jsp");
        dispatcher2.forward(request, response);
    }

    private void suaProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        request.getRequestDispatcher("sua-danh-sach.jsp").forward(request, response);
        response.sendRedirect("sua-danh-sach.jsp");
    }


    private void themMoiProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("them-danh-sach.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "themMoi":
                themMoiProduct1(request, response);
                RequestDispatcher dispatcher = request.getRequestDispatcher("them-danh-sach.jsp");
                dispatcher.forward(request, response);
                break;
            case "suaDanhSach":
                suaProduct1(request, response);
                response.sendRedirect("/product-servlet");
                break;
            case "timTenSanPham":
                timKiemSanPham(request, response);
                break;
            default:
        }
    }

    private void timKiemSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameProduct");
        List<Product> list = iProductService.findNameProduct(name);
        if (list.size()==0){
           request.setAttribute("list",0);
            RequestDispatcher dispatcher1= request.getRequestDispatcher("hien-thi-san-pham-theo-ten.jsp");
            dispatcher1.forward(request, response);
        }else {
            request.setAttribute("list", list);
            RequestDispatcher dispatcher1= request.getRequestDispatcher("hien-thi-san-pham-theo-ten.jsp");
            dispatcher1.forward(request, response);
        }

    }


    private void suaProduct1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sanpham = request.getParameter("sanpham");
        double gia = Double.parseDouble(request.getParameter("gia"));
        String mota = request.getParameter("mota");
        String nhasanxuat = request.getParameter("nhasanxuat");
        iProductService.eidtProduct(id, new Product(id, sanpham, gia, mota, nhasanxuat));

    }


    private void themMoiProduct1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sanpham = request.getParameter("sanpham");
        double gia = Double.parseDouble(request.getParameter("gia"));
        String mota = request.getParameter("mota");
        String nhasanxuat = request.getParameter("nhasanxuat");
        iProductService.addNewProduct(new Product(id, sanpham, gia, mota, nhasanxuat));
    }
}
