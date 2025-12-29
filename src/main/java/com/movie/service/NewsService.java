package com.movie.service;

import com.movie.entity.News;
import java.util.List;

public interface NewsService {
    void add(News news);

    void update(News news);

    void delete(int id);

    News get(int id);

    List<News> findAll();
}
