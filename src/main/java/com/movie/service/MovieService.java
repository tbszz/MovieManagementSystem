package com.movie.service;

import com.movie.entity.Movie;
import java.util.List;

public interface MovieService {
    void add(Movie movie);

    void update(Movie movie);

    void delete(int id);

    Movie get(int id);

    List<Movie> findAll();

    List<Movie> findByCategory(int categoryId);

    List<Movie> search(String keyword);

    List<Movie> findHotMovies(int limit);
}
