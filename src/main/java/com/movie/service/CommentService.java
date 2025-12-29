package com.movie.service;

import com.movie.entity.Comment;
import java.util.List;

public interface CommentService {
    void add(Comment comment);

    void delete(int id);

    void delete(Comment comment); // Overload for convenience if needed, or just use delete(int)

    List<Comment> findByMovie(int movieId);

    List<Comment> findAll();
}
