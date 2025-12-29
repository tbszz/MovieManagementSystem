package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.Carousel;
import com.movie.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CarouselServiceImpl implements CarouselService {

    @Autowired
    private BaseDao<Carousel> baseDao;

    @Override
    public void add(Carousel carousel) {
        baseDao.save(carousel);
    }

    @Override
    public void update(Carousel carousel) {
        baseDao.update(carousel);
    }

    @Override
    public void delete(int id) {
        Carousel carousel = get(id);
        if (carousel != null) {
            baseDao.delete(carousel);
        }
    }

    @Override
    public Carousel get(int id) {
        return baseDao.get(Carousel.class, id);
    }

    @Override
    public List<Carousel> findAll() {
        return baseDao.findAll(Carousel.class);
    }

    @Override
    public List<Carousel> findVisible() {
        return baseDao.find("from Carousel where isVisible = true order by sortOrder asc");
    }
}
