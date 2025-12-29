package com.movie.service;

import com.movie.entity.User;

public interface UserService {
    User login(String username, String password);

    void register(User user);

    java.util.List<User> findAll();

    User get(Integer id);

    void update(User user);

    void delete(Integer id);
}
