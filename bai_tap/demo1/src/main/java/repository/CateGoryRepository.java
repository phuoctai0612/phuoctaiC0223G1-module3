package repository;

import model.Authors;
import model.Book;
import model.CateGory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CateGoryRepository implements ICateGoryRepository{
    @Override
    public List<CateGory> getList() {
        List<CateGory> cateGoryList=new ArrayList<>();
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from cate_gory");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name_cate_gory");
                cateGoryList.add(new CateGory(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cateGoryList;
    }
}
