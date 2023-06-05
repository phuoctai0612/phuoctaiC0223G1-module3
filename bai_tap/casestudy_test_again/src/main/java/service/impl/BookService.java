package service.impl;

import model.Book;
import repository.IBookRepository;
import repository.impl.BookRepository;
import service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    IBookRepository bookRepository=new BookRepository();
    @Override
    public List<Book> displayListBook() {
        return bookRepository.getList();
    }

    @Override
    public void addNewBook(Book book) {
    bookRepository.addNewBook(book);
    }

    @Override
    public void editBook(int id, Book book) {
bookRepository.editBook(id,book);
    }

    @Override
    public Book findID(int id) {
        return bookRepository.findID(id);
    }

    @Override
    public void deleteBook(int id) {
 bookRepository.deleteBook(id);
    }

    @Override
    public List<Book> searchBook(String name) {
        return bookRepository.searchBook(name);
    }
}
