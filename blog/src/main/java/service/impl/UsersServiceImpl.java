package service.impl;

import dao.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Users;
import service.UsersService;

import java.util.List;
@Service("usersService")
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;
    @Override
    public void insert(Users users) {
        usersMapper.insert(users);
    }

    @Override
    public void update(Users users) {
        usersMapper.update(users);
    }

    @Override
    public void delete(int id) {
        usersMapper.delete(id);
    }

    @Override
    public Users selectOne(int id) {
        return usersMapper.selectOne(id);
    }

    @Override
    public Users selectOneByName(String username) {
        return usersMapper.selectOneByName(username);
    }

    @Override
    public List<Users> selectAll() {
        return usersMapper.selectAll();
    }
}
