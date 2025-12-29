package com.movie.service;

import com.movie.entity.Category;
import java.util.List;

public interface CategoryService {
    void add(Category category);

    void update(Category category);

    void delete(int id);

    Category get(int id);

    List<Category> findAll();
}
