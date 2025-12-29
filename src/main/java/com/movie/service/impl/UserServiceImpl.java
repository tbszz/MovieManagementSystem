package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.User;
import com.movie.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private BaseDao<User> baseDao;

    @Override
    public User login(String username, String password) {
        String hql = "from User where username = ?0 and password = ?1";
        List<User> users = baseDao.find(hql, username, password); // Note: In real app, hash password!
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public void register(User user) {
        baseDao.save(user);
    }

    @Override
    public List<User> findAll() {
        return baseDao.find("from User");
    }

    @Override
    public User get(Integer id) {
        return baseDao.get(User.class, id);
    }

    @Override
    public void update(User user) {
        baseDao.update(user);
    }

    @Override
    public void delete(Integer id) {
        User user = get(id);
        if (user != null) {
            baseDao.delete(user);
        }
    }
}
