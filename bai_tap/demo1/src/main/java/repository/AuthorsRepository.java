package repository;

import model.Authors;
import model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorsRepository implements IAuthorsRepository{

    @Override
    public List<Authors> getList() {
        List<Authors> authorsList=new ArrayList<>();
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from authors");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name_authors");
                authorsList.add(new Authors(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authorsList;
    }
}
