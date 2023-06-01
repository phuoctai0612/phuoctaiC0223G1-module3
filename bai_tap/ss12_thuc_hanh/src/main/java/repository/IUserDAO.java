package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public void deleteUser(int id) throws SQLException;

    public void updateUser(int id,User user) throws SQLException;

    List<User> findName(String name);
    List<User> sortName();
}
