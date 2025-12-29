package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.Category;
import com.movie.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private BaseDao<Category> baseDao;

    @Override
    public void add(Category category) {
        baseDao.save(category);
    }

    @Override
    public void update(Category category) {
        baseDao.update(category);
    }

    @Override
    public void delete(int id) {
        Category category = get(id);
        if (category != null) {
            baseDao.delete(category);
        }
    }

    @Override
    public Category get(int id) {
        return baseDao.get(Category.class, id);
    }

    @Override
    public List<Category> findAll() {
        return baseDao.findAll(Category.class);
    }
}
