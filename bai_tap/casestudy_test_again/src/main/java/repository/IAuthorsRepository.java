package repository;

import model.Authors;

import java.util.List;

public interface IAuthorsRepository {
    List<Authors> getList();
}
