package dao;

import pojo.Users;

import java.util.List;

public interface UsersMapper {
    void insert(Users users);
    void update(Users users);
    void delete(int id);
    Users selectOne(int id);
    Users selectOneByName(String username);
    List<Users> selectAll();
}
