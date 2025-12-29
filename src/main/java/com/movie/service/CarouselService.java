package com.movie.service;

import com.movie.entity.Carousel;
import java.util.List;

public interface CarouselService {
    void add(Carousel carousel);

    void update(Carousel carousel);

    void delete(int id);

    Carousel get(int id);

    List<Carousel> findAll();

    List<Carousel> findVisible();
}
