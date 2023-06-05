package service;

import model.CateGory;
import repository.CateGoryRepository;
import repository.ICateGoryRepository;

import java.util.List;

public class CateGoryService implements ICateGoryService{
    private ICateGoryRepository iCateGoryRepository=new CateGoryRepository();
    @Override
    public List<CateGory> getList() {
        return iCateGoryRepository.getList();
    }
}
