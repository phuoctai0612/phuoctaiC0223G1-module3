package repository.impl;

import model.Authors;
import model.Book;
import model.CateGory;
import repository.BaseRepository;
import repository.IBookRepository;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private final String LIST_BOOK = "select b.*,a.id as id_cate,c.id as id_cate,a.name_authors,c.name_cate_gory  from books b\n" +
            "join authors a\n" +
            "on b.author_id=a.id\n" +
            "join cate_gory c\n" +
            "on b.cate_gory_id=c.id ;";
    private final String ADD_BOOK = "insert into books (title,page_size,author_id,cate_gory_id) value(?,?,?,?);";
    private final String EDIT_BOOK = "update books \n" +
            "set title=?,page_size=?,author_id=?,cate_gory_id=? where id= ?;";
private final String DELETE_BOOK="delete from books where id = ?;";
    @Override
    public List<Book> getList() {
        List<Book> bookList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(LIST_BOOK);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                int authorId = resultSet.getInt("author_id");
                String authorName = resultSet.getString("name_authors");
                Authors authors = new Authors(authorId, authorName);
                int cateGoryId = resultSet.getInt("id_cate");
                String cateGoryName = resultSet.getString("name_cate_gory");
                CateGory cateGory = new CateGory(cateGoryId, cateGoryName);
                bookList.add(new Book(id, title, pageSize, authors, cateGory));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public void addNewBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_BOOK);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getPage_size());
            preparedStatement.setInt(3, book.getAuthor_id().getId());
            preparedStatement.setInt(4, book.getCate_gory_id().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void editBook(int id, Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_BOOK);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getPage_size());
            preparedStatement.setInt(3, book.getAuthor_id().getId());
            preparedStatement.setInt(4, book.getCate_gory_id().getId());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Book findID(int id) {
        Connection connection = BaseRepository.getConnection();
        String FIND_BOOK_ID = "select * from books where id =" + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(FIND_BOOK_ID);
            while (result.next()) {
                String title = result.getString("title");
                int pageSize = result.getInt("page_size");
                int idAuthor = result.getInt("author_id");
                int idCateGory = result.getInt("cate_gory_id");
                String nameAuthor = result.getString("name_authors");
                String nameCategory = result.getString("name_cate_gory");
                Authors author = new Authors(idAuthor, nameAuthor);
                CateGory category = new CateGory(idCateGory, nameCategory);
                Book book = new Book(id, title, pageSize, author, category);
                return book;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void deleteBook(int id) {
    Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_BOOK);
            preparedStatement.setInt(1,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
