package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> displayListBook();
    void addNewBook(Book book);
    void editBook(int id,Book book);
    Book findID(int id);
    void deleteBook(int id);
    List<Book> searchBook(String name);
}
