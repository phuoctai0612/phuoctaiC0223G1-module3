package repository;

import model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> getList();
    void addNewBook(Book book);
    void editBook(int id,Book book);
    Book findID(int id);
    void deleteBook(int id);
}
