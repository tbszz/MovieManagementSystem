package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.News;
import com.movie.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {

    @Autowired
    private BaseDao<News> baseDao;

    @Override
    public void add(News news) {
        baseDao.save(news);
    }

    @Override
    public void update(News news) {
        baseDao.update(news);
    }

    @Override
    public void delete(int id) {
        News news = get(id);
        if (news != null) {
            baseDao.delete(news);
        }
    }

    @Override
    public News get(int id) {
        return baseDao.get(News.class, id);
    }

    @Override
    public List<News> findAll() {
        return baseDao.findAll(News.class);
    }
}
