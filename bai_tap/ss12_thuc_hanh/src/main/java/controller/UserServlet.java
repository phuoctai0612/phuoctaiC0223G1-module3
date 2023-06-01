package controller;

import model.User;
import repository.UserDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insertUser(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "edit":
                editUser(request,response);
                break;
            case "findName":
                findList(request,response);
            case "sort":
                sortName(request,response);
                break;
        }
    }

    private void findList(HttpServletRequest request,HttpServletResponse response) {
        List<User> listUser;
        String name= request.getParameter("findName");
        listUser= userDAO.findName(name);
        request.setAttribute("listUser",listUser);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("user/list.jsp");
        try {
            requestDispatcher.forward(request,response);
            response.sendRedirect("/users");
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                     int id=Integer.parseInt(request.getParameter("id"));
                     request.setAttribute("id",id);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "delete":
                    deleteUser(request,response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void sortName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser=  userDAO.sortName();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editUser(HttpServletRequest request,HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        try {
            userDAO.updateUser(id,new User(name,email,country));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        userDAO.insertUser(newUser);
        response.sendRedirect("/users");
    }
    private void deleteUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
           int id=Integer.parseInt(request.getParameter("deleteId"));
        try {
            userDAO.deleteUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/users");
    }
}
