package service;

import model.Authors;
import repository.AuthorsRepository;
import repository.IAuthorsRepository;

import java.util.List;

public class AuthorsService implements IAuthorsService{
    private IAuthorsRepository iAuthorsRepository=new AuthorsRepository();
    @Override
    public List<Authors> getList() {
        return iAuthorsRepository.getList();
    }
}
