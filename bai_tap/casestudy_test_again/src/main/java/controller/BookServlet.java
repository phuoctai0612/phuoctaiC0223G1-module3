package controller;

import model.Authors;
import model.Book;
import model.CateGory;
import service.*;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private IBookService bookService = new BookService();
    private IAuthorsService authorsService = new AuthorsService();
    private ICateGoryService iCateGoryService = new CateGoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFromBook(request, response);
                break;
            case "edit":
                editFromBook(request, response);
                break;
            default:
                listBook(request, response);
        }
    }

    private void delete(HttpServletRequest request,HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("deleteId"));
        bookService.deleteBook(id);
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editFromBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findID(id);
        request.setAttribute("book", book);
        List<Authors> authorsList = authorsService.getList();
        List<CateGory> cateGoryList = iCateGoryService.getList();
        request.setAttribute("authorsList", authorsList);
        request.setAttribute("cateGoryList", cateGoryList);
        try {
            request.getRequestDispatcher("view/book/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createFromBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Authors> authorsList = authorsService.getList();
        List<CateGory> cateGoryList = iCateGoryService.getList();
        request.setAttribute("authorsList", authorsList);
        request.setAttribute("cateGoryList", cateGoryList);
        request.getRequestDispatcher("view/book/create.jsp").forward(request, response);
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookService.displayListBook();
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("view/book/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                listBook(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("search");
        List<Book> bookList=  bookService.searchBook(name);
      request.setAttribute("bookList",bookList);
        try {
            request.getRequestDispatcher("view/book/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/book");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int page = Integer.parseInt(request.getParameter("page"));
        int author = Integer.parseInt(request.getParameter("author"));
        int cate = Integer.parseInt(request.getParameter("cate"));
        Authors authors = new Authors(author);
        CateGory cateGory = new CateGory(cate);
        Book book = new Book(title, page, authors, cateGory);
        bookService.editBook(id, book);
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int authorsId = Integer.parseInt(request.getParameter("authorId"));
        Authors authors1 = new Authors(authorsId);
        int cateId = Integer.parseInt(request.getParameter("cateGory"));
        CateGory cateGory = new CateGory(cateId);
        bookService.addNewBook(new Book(title, pageSize, authors1, cateGory));
        try {
            response.sendRedirect("/book");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
