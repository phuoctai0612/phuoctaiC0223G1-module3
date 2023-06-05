package repository;

import model.Authors;
import model.Book;

import java.util.List;

public interface IAuthorsRepository {
    List<Authors> getList();
}
